---
layout: post
title: Postgres auto_explain thresholds
publishDate: 2017-02-24 13:51:43 +01:00
tags:
  - postgres
params:
  authors:
    - AnshikaKoul
    - kaaveland
  heroImage: explain_analyze.jpg
---

![](explain_analyze.jpg)

Back and blogging about postgres again! We do other things too, it's just that postgres is a really cool product that we've had time to learn a lot about recently and it's interesting to write about.

When we configured postgres, we set up logging for slow queries, but we set a really high [`log_min_duration_statement`](https://www.postgresql.org/docs/9.5/static/runtime-config-logging.html#GUC-LOG-MIN-DURATION-STATEMENT), going for 60 seconds. We've been running with that configuration ever since, but we've decided that 60 seconds is way too high to be useful, since nothing should ever trigger that. We've been wanting to lower it so we can be better at keeping track of slow queries. The first step you're probably going to do when optimizing a query is to find the query plan that was executed.

Postgres comes with a neat module called [`auto_explain`](https://www.postgresql.org/docs/9.5/static/auto-explain.html) which can be configured to log the query plans for queries that run for more than `auto_explain.log_min_duration` milliseconds. We wanted both to lower `log_min_duration_statement`, and at the same time set up auto-explain to the same threshold. We weren't sure exactly of how low is too low. The reason why this matters is mostly to avoid spamming logs and creating too much I/O on the database server. The overhead of `auto_explain` will stay low, as long as you do not enable `auto_explain.log_analyze`. The documentation warns you about this, saying the following:

> When this parameter is on, per-plan-node timing occurs for all statements executed, whether or not they run long enough to actually get logged. This can have an extremely negative impact on performance. [...]

We tried to investigate exactly how large this "extremely negative impact" actually is, but didn't find too much. People we chatted with said slowdown by about a factor of 2 could happen. We honestly don't know what that would do to the database server and prefer not to find out. So we chose to not enable `auto_explain.log_analyze` at all.

There's another postgres extension that was really helpful when setting our thresholds. [`pg_stat_statements`](https://www.postgresql.org/docs/9.5/static/pgstatstatements.html) will gather statistics about your most common queries for you, if you `CREATE EXTENSION` `PG_STAT_STATEMENTS` in your database. This view contains several really interesting statistics about your queries, for example how often they are called, how long they take to execute (mean, max, min, standard deviation), how often they have cache-misses and how many temporary files they generate (ideally none!)

We decided we could use this to obtain a ballpark estimate of how many queries different thresholds for `auto_explain` would catch. We really don't want to be logging many thousands each day, as that would make it difficult to focus on the big wins, so we'd prefer to start with a lenient threshold and then lower it as we improve queries. Trying to query against `pg_stat_statements` also gave us an opportunity to practice some pretty cool SQL.

We based our choice on `mean_time` and `calls` (total amount of query executions) and investigated what percentage of our total queries that had which average running time. We started by classifying each query in `pg_stat_statements` into different buckets depending on its `mean_time`:

```sql
select calls, case
              when mean_time > 60000 then 60
              when mean_time > 30000 then 30
              when mean_time > 10000 then 10
              when mean_time > 5000 then 5
              else 0 end as bucket_time
from pg_stat_statements;
```

This will classify each query according to its `mean_time`, giving it the `bucket_time` of 0, 10, 30 or 60 seconds, which is the lower bound of the bucket we put it in. We can build on this query to aggregate some useful information:

```sql
with query_times as
    (select calls,
        case when mean_time > 60000 then 60
             when mean_time > 30000 then 30
             when mean_time > 10000 then 10
             when mean_time > 5000 then 5
             else 0 end as bucket_time from pg_stat_statements)
select sum(calls) as calls, bucket_time from query_times group by bucket_time;
```

The `with` statement here is called a Common Table Expression and you can read more about it [here](https://www.postgresql.org/docs/9.5/static/queries-with.html). It's super useful for structuring queries nicely to make them readable, and it helps with building up queries one part at a time. The query above produces an output much like:

```
   calls    | bucket_time
------------+-------------
        688 |          30
       1131 |          60
       4166 |           5
 6065699764 |           0
       1483 |          10
```

That's already useful and will give us our ballpark estimate. We know that it's probably safe to set our threshold to 5 seconds for a start, because that won't catch many queries (`688 + 1131 + 4166 + 1483`). But wouldn't it be cool to calculate some percentages so we can see how many percents of queries that fall into each bucket? We can do that with [window functions](https://www.postgresql.org/docs/9.5/static/tutorial-window.html):

```sql
with query_times as
    (select calls,
        case when mean_time > 60000 then 60
             when mean_time > 30000 then 30
             when mean_time > 10000 then 10
             when mean_time > 5000 then 5
             else 0 end as bucket_time from pg_stat_statements),
  grouping as
    (select sum(calls) as calls, bucket_time
    from query_times group by bucket_time)

select bucket_time,
    100 * calls / (sum(calls) over ()) as percent,
    calls,
    rank() over (order by bucket_time)
from grouping;
```

The `sum(calls) over ()` part of the query will `sum` up `calls` for each column in the window, which in our case is the entire result-set. `rank()` will number the rows according to the ordering of `bucket_time`. In total, this produces an output much like:

```
 bucket_time |          percent           |   calls    | rank
-------------+----------------------------+------------+------
           0 |        99.9998768942781880 | 6066323073 |    1
           5 | 0.000068674134583396087978 |       4166 |    2
          10 | 0.000024446409406427364011 |       1483 |    3
          30 | 0.000011341287708443713041 |        688 |    4
          60 | 0.000018643890113735231758 |       1131 |    5
```

Wouldn't it be cooler still if we could accumulate the calls and percentages according to `ranks`, such that each bucket also contains all the calls from the ranks that are lower than it? That way, we can say that `99.9999999%` of all queries complete in less than X seconds. We can do that joining the previous query with a join-condition on the rank:

```sql
with query_times as
    (select calls,
        case when mean_time > 60000 then 60
             when mean_time > 30000 then 30
             when mean_time > 10000 then 10
             when mean_time > 5000 then 5
             else 0 end as bucket_time from pg_stat_statements),
  grouping as
    (select sum(calls) as calls, bucket_time
    from query_times group by bucket_time),

  stats as
    (select bucket_time,
      100 * calls / (sum(calls) over ()) as percent,
      calls,
      rank() over (order by bucket_time)
     from grouping)

select
    s1.bucket_time,
    s1.calls,
    s1.percent,
    sum(s2.calls) as accumulated_calls,
    sum(s2.percent) as accumulated_percent
from stats s1
    inner join stats s2 on s1.rank >= s2.rank
group by s1.bucket_time, s1.calls, s1.percent order by s1.bucket_time;
```

The result will look something like this:

```
 bucket_time |   calls    |          percent           | accumulated_calls |     accumulated_percent
-------------+------------+----------------------------+-------------------+------------------------------
           0 | 6066780909 |        99.9998769035684793 |        6066780909 |          99.9998769035684793
           5 |       4166 | 0.000068668952024004314466 |        6066785075 |  99.999945572520503304314466
          10 |       1483 | 0.000024444564534709169072 |        6066786558 |  99.999970017085038013483538
          30 |        688 | 0.000011340431827295959758 |        6066787246 |  99.999981357516865309443296
          60 |       1131 | 0.000018642483134697282684 |        6066788377 | 100.000000000000000006725980
```

Notice how `accumulated_percent` is larger than `100%`? We think this is a combination of rounding errors with floats, and the fact that we're actually running queries right now, which will add new entries to `pg_stat_statements` while we're executing. Anyway, the `acumulated` columns should show how many queries that are *at least* this fast, on average. Choosing different bucket sizes is easy, only the first common table expression needs to be modified.

The result gives us some pretty good ballpark figures for setting slow query thresholds.
