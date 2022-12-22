---
title: Get alternative expected delivery dates
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgalternativedeliverydates
    title: Get alternative expected delivery dates
    parent: shippingguide_2
weight: 8
hidden: true
---
Customers who want the x next possible delivery dates in the response, can use the **numberOfAlternativeDeliveryDates**:
* SOAP: 
```xml
 <NumberOfAlternativeDeliveryDates>2</NumberOfAlternativeDeliveryDates>
```
* REST POST: 
```json
 "numberOfAlternativeDeliveryDates": 2
```

Note: make sure the **numberOfAlternativeDeliveryDates** is also set to some positive value. The maximum number of alternative delivery days that can be requested is 9.