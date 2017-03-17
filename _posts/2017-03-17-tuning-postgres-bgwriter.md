---
layout: post
title: Tuning postgres bgwriter
date: 2017-03-17 13:51:43 01:00
category: postgres
author:
    - AnshikaKoul
    - kaaveland
---

<img src="{{ site.baseurl }}/img/bgwriter-stats.png" />

Back and writing about Postgres again! Turns out it's hard to go one week without discovering something new and
interesting about postgres. Postgres performance tuning has been an uncharted territory for us till now, we have done minor
 tweakings here and there but never dove into it head first. Recently we have encountered certain slow inserts and
  as a part of investigating those, we discovered that running postgres with default settings for checkpoints can lead to spiky
  I/O. Namely XLog triggered checkpoints may force a timed checkpoint to complete very quickly, leading to bursty writes. You can
  read more about those [here](http://blog.postgresql-consulting.com/2017/03/deep-dive-into-postgres-stats.html).

We have telegraf setup which reads [pg_stat_bgwriter](https://www.postgresql.org/docs/9.5/static/monitoring-stats.html#PG-STAT-BGWRITER-VIEW)
every 10 seconds which was immensely helpful in locating the spiky checkpoint activities. The picture at the top of the blog post
is a graph of the derivative of the values present in this view. The green line is the amount of buffers that had to be cleaned by
the client. The blue indicates the work done by the bgwriter and yellow represents the checkpoint activity.

Timings of the slow inserts coincided with spiky checkpoints and we also observed high I/O rate at these point in time. Therefore
 it seemed plausible that inserts were slow because of spiky checkpoints. Something you can do to make checkpoints less spiky is
 to increase checkpoint timeout and `max_wal_size`. Following the advice from the blog post linked above we conservatively increased
 the checkpoint timeout from default 5 to 15 minutes and max_wal_size from default 1GB to 5GB. Furthermore we tried leverage the
  bgwriter to do more aggressive to avoid client connections clean shared buffers.


You can read more about shared buffer cache [here](https://2ndquadrant.com/media/pdfs/talks/InsideBufferCache.pdf). A short summary
is that everything postgres reads from disk has to into a shared buffer. If the shared buffers has been modified it is said to
be dirty. Before using shared buffers it has to be cleaned which is accomplished by flushing it to disk. This can be done by a
client connection if there are no clean shared buffers available, or it can be done by the checkpointer or the bgwriter. It is
preferable that the bgwriter does this rather than the clients because it is a background process which won't block any user.

With the default settings bgwriter will run upto 5 times in a second and is allowed to clean upto 100 pages each time it runs
because one page is 8192 bytes that means it can clean upto 4MB per second. In our database, this was dwarfed by the amount of cleaning
done by client connections. So, we doubled the frequency of the runs and doubled the max amount of pages to clean per run which allowed
the bgwriter to clean 16MB per second.

<img src="{{ site.baseurl }}/img/bgwriter-tuned-stats.png" />

This graph shows the bgwriter being a lot more active and checkpointer being a lot more even, which is exactly what we hoped for.

Unfortunately this did not fix our slow inserts even though our disk activities are now much more even. We no longer think that
spiky disk I/O was the reason for the slow inserts. In hindsight this should have been obvious as we were only observing the slow
inserts on certain tables, if spiky I/O was the reason for that we would have seen it affect other tables as well. Our new lead is that
the fact the tables have [gin indexes](https://www.postgresql.org/docs/9.5/static/gin-implementation.html#GIN-FAST-UPDATE). We found
some email threads discussing the performance implications of how gin fast update works. [This](http://www.postgresql-archive.org/how-to-investigate-GIN-fast-updates-and-cleanup-cycles-td5863756.html)
is an interesting discussion of the trade off that the fast update does which is to make inserts faster on average. Our table does not get
vacuumed often enough because it's workload is mostly inserts. You can read more about vacuuming [here](http://developer.bring.com/blog/you-should-vacuum-your-databases/).

