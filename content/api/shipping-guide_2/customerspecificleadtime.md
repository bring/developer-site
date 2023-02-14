---
title: Get customer specific leadtimes for Mailbox Parcel (Pakke i postkassen)
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgcustomerspecificleadtime
    title: Get customer specific leadtimes for Mailbox Parcel (Pakke i postkassen)
    parent: shippingguide_2
weight: 9
---
Prioritized customers can get their customer specific leadtimes in the response for the outgoing Mailbox Parcel services (3570 and 3584). This is easily done by making sure the **customerNumber** is always set in the requst.
* SOAP: customerNumber
```xml
<CustomerNumber>2001001000</CustomerNumber>
```
* REST POST: 2001001000
```json
"customerNumber": "2001001000",
```
