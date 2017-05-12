---
layout: post
title: Connection Pooling with c3p0
date: 2017-05-12 15:00:00 00:00
category: database
author:
    - imprashast
---

We at Bring have been using [c3p0](http://www.mchange.com/projects/c3p0/) in one of our application from the past few years. Recently we faced an issue where we started to see lots of `CONNECTION TIMEOUT` and `APPARENT DEADLOCK` WARN errors.

The underlying database is MySql for reference. Last week we did a server migration and our initial thoughts were related to the performance of the new datacenter. But we ruled that out when we checked that there were not enough slow queries to back this claim.

Upon digging in further we found that:
 
- There are not enough slow queries in the database to explain the errors.
- The threaddumps for this application are weird. Lots of threads stuck waiting on something called GooGooStatementCache in c3p0.
- Heapdump reveals several hundreds of NewPreparedStatement from c3p0.
- The application logs contain lots and lots of "APPARENT DEADLOCK" WARN-entries from c3p0, indicating that the problem comes from the connection pool library, not mysql.

<img src="{{ site.baseurl }}/img/heap_dump_c3p0.png" />

Futher on analysing the application logs, which looked something like this:

`WARN  [c.ThreadPoolAsynchronousRunner] [user:] -`
`com.mchange.v2.async.ThreadPoolAsynchronousRunner$DeadlockDetector@15046d35`
`-- APPARENT DEADLOCK!!! Creating emergency threads for unassigned pending tasks!`
`WARN  [c.ThreadPoolAsynchronousRunner] [user:] -`
`com.mchange.v2.async.ThreadPoolAsynchronousRunner$DeadlockDetector@15046d35` 
`-- APPARENT DEADLOCK!!! Complete Status:`

Some of those were `CannotGetJdbcConnectionException` which is how we identified it was a c3p0 issue. 

Looking at our configurations we found one property to be configured somewhat wrong. `maxStatements` in c3p0 was set to a higher value.

So we decided to set the `maxStatements=0` which will disable the statement cache entirely and it won't need to defer the close. Problem solved, isn't it?

Yes it did, but what we saw after deploying this fix was quite fascinating. We set up a metric in Kibana to check the response time for this application. These are the graphs:

<img src="{{ site.baseurl }}/img/response_time_graphs_c3p0.png" />

The response time here got reduced almost by a factor of 5. Last week, 90th percentile response time was ~900ms, now it's 200ms. Quite Impressive. Hope this might help someone who has a similar problem.

