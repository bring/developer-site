---
layout: post
title: Metrics at Mybring
date: 2017-03-03 13:51:43 01:00
category: metrics
author:
    - AnshikaKoul
    - kaaveland
---

<img src="{{ site.baseurl }}/img/many_graphs.png" />

At mybring, we collect a lot of metrics. We think metrics are incredibly useful and they can be a lot of fun. And at the end of the day, it's essential to understand our systems and users better. Collecting metrics enables us to take informed decisions - which are based on facts rather than speculations. We get an overview of the health of our servers, changes in system behaviour are reported over a period of time, which helps us in discovering a problem before it happens.

To cite a simple example, we recently encountered issues in one of our applications, the reason for it which we later figured out was that the one of the pages in aforementioned application had slowed down by a factor of 10. Now if we had been collecting the response time for that page, we could have gone back and figured out why and when it started happening. Having this kind of data enable us to go back in time and figure out when things changed.

To view the user trends after we introduce new features in the applications. Or determining the current favourite feature that our users use the most. This helps us in prioritizing tasks, making sure we pick features which are important to the end user over something which ain't that important.

Other than tracking our application and servers, there are a bunch of other things which are fun to work with. Tracking pull request data, or how often are we deploying/releasing to production. It will be cool to see the trend of open pull requests, total pull requests per repositories, code added, deleted over time. We think it will be amazing how much value can be extracted from all of this as it provide us with an perfect overview of our work-flow.

The picture above is a mosaic of graphs from a variety of systems that we have at Mybring. But today as we our talking about metrics, we'll steer our focus towards Grafana, Influxdb and Telegraf.

InfluxDB is a time-series database

We have [`telegraf`](https://www.influxdata.com/telegraf-correlate-log-metrics-data-performance-bottlenecks/) installed on every server, collecting metrics. For applications we use metrics, a microlibrary that we have created to send data to InfluxDB.

Grafana is a tool for visualization of timeseries-data, vis-à-vis server metrics and application metrics. 



