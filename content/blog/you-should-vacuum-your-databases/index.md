---
layout: post
title: You should vacuum your databases
publishDate: 2017-02-17 13:51:43 +01:00
tags:
  - postgres
params:
  authors:
    - AnshikaKoul
    - kaaveland
  heroImage: robot_vacuum.png
---

![](robot_vacuum.png)


Postgres has a great multiversion concurrency control implementation ([MVCC](https://en.wikipedia.org/wiki/Multiversion_concurrency_control)). MVCC a very useful concept, which allows you to do things like roll back transactions that do DDL changes. The goal is to allow for consistent point in time views of the database, while still allowing multiple transactions to read and write the database at the same time -- without having to use expensive locks.

This means that when you update data in your Postgres database, the existing data is not modified. Instead, a new version of that data is added to the database. This is because it's not safe to directly modify existing data, because other transactions could be reading it. At some point, the old version of the data is no longer going to be interesting for anyone, which means it's time to clean it out. That can be done by issuing [`VACUUM`](https://www.postgresql.org/docs/9.5/static/sql-vacuum.html) in your database. Normally, you don't have to worry about doing that, because postgres has something called the autovacuum launcher. It will periodically launch an autovacuum process, which will vacuum tables that it believes has a decent amount of garbage ("dead tuples"). You can read more about autovacuum [here](https://www.postgresql.org/docs/9.5/static/routine-vacuuming.html).

So far we've used default settings for autovacuum, but we recently started investigating some slow queries and found out that the tables had not been autovacuumed or analyzed for a really long time (7 weeks). Manually vacuuming the affected tables cleared up lots of unused items and we're paying close attention to check if that improves query performance. Below is some output from `VACUUM VERBOSE ANALYZE`:

```
There were 1829170 unused item pointers.
DETAIL:  1845 index row versions were removed.
49 index pages have been deleted, 92195 are currently reusable.
```

Investigating some more tables in the database revealed that most tables were being properly vacuumed and analyzed frequently, and the tables we were having issues with just have very different types of workloads. They contained many millions of rows and data was almost always only added to them, very rarely updated or deleted. It doesn't seem like just doing `INSERT` on tables will actually cause autovacuuming to occur. In terms of accumulating garbage, that's fine, because `INSERT` creates very little garbage. But the auto-vacuum will also normally take care of running [`ANALYZE`](https://www.postgresql.org/docs/9.5/static/sql-analyze.html), which will update the statistics that the query planner uses to make efficient query execution plans. Often, the direct consequence of having outdated statistics will be that the query planner will select suboptimal query execution plans. In bad cases, this can lead to a high performance degradation. In our case, we did see that the query planner would select better execution plans for a few hours after running `ANALYZE`, but it's now back to picking the suboptimal plan.

That's because we didn't have much success with tuning the [autovacuum parameters](https://www.postgresql.org/docs/9.5/static/sql-createtable.html#SQL-CREATETABLE-STORAGE-PARAMETERS) for the table to make autovacuum analyze it. We found [this](https://www.citusdata.com/blog/2016/11/04/autovacuum-not-the-enemy/) blogpost very helpful in understanding how autovacuum parameters should be set. It looks like we'll need to set up a job to analyze the tables in some other way. The reason we think this is an interesting topic, is that we encounter this sort of problem as application developers, not as DBAs (we're not DBAs). We only encountered this problem because the work-load for 2 particular tables in our cluster with 11 databases is very different from the rest, so autovacuum doesn't really do a great job here. In very rare cases, we will batch-update a significant amount of rows (tens of thousands), but not significant enough to trigger autovacuum (because the tables have many millions of rows).

This is just one more example of the broad scope of knowledge a team needs to have in order to develop efficient, modern web-applications. We see cases where we need to know about Linux wizardry to hunt down socket leaks caused by bad ssh config, flexbox incompatibilities between different versions of the same browser, css minification differences between different versions of the same minifier, double-submits in JavaScript causing database deadlocks and many other different odd pieces of knowledge and trivia. Now we're adding table bloat, index bloat, stale statistics and vacuuming to our list.
