---
title: Performance
layout: api-sub
menu:
  apidocs:
    identifier: bookingperformance
    title: Performance
    parent: booking
weight: 3
---

Different service groups have different response times in booking:

  - Parcels and courier services
    - A booking will typically take < 2 seconds
  - Express UPS services and Cargo
    - A booking will typically take < 3 seconds
  - Express Nordic SameDay
    - A booking will typically take < 10 seconds (query in flight schedules). We are working on improving the response times for QuickPack SameDay, making popular city-pairs much faster.
