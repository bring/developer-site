---
title: Performance
menu:
  apidocs:
    identifier: sgperformance
    title: Performance
    parent: sgusing
weight: 1
---
To have better performance of the API:

* Requests can be limited to have only the services needed since the response time of some services can be slow compared to others
* If the request is only to find the lead time / prices of different services, the flag for withExpectedDelivery / withPrices should be set to true and others can be set to false. In case of REST these are different endpoints.
* For net prices, requests should include customer number and correct package details
* Request can include limited number of consignments in each request for quick response.
* New shipment request can be part of separate requests.
