---
title: Get alternative expected delivery dates
menu:
  apidocs:
    identifier: sgalternativedeliverydates
    title: Get alternative expected delivery dates
    parent: sgleadtime
weight: 3
---
Customers who want the x next possible delivery dates in the response, can use the **numberOfAlternativeDeliveryDates**:

```json
 "numberOfAlternativeDeliveryDates": 2
```

Note: make sure the **numberOfAlternativeDeliveryDates** is also set to some positive value. The maximum number of alternative delivery days that can be requested is 9.
