---
title: Performance
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgperformance
    title: Performance
    parent: shippingguide_2
weight: 3
---
To have better performance of the api

* Request can be limited to have only the services needed since the response time of some services can be slow as compared to others
* If the request is only to find the lead time / prices of different service, the flag for withExpectedDelivery / withPrices should be set to true and others can be set to false. In case of REST these are different endpoints.
* For net prices requests should include customer number and correct package details
* Request can include limited number of consignments in each request for quick response.
* New shipments request can be part of separate request
