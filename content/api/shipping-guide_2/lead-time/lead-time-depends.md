---
title: Lead time depends on the recipient’s postal code and address
menu:
  apidocs:
    identifier: sgleadtimedepends
    title: Lead time depends on the recipient’s postal code and address
    parent: sgleadtime
weight: 1
---

Two different addresses on the same postal code can have different lead time. 
We have therefore added an addressLine field, which allows lead time to be calculated based on both postal code and street address. For this to work, it is important that recipients fill out a valid street address. 

By using our Address API, the address the recipients fill inn can be pre-validated, which will ensure more accurate lead times. We therefore recommend using the Address API in combination with Shipping Guide API. 

There are several services that are affected by this new field: ```1000, 3500, 5000, 1736, 5600, 0330, 0332, 0349, 3570, 3584```
```xml
 <ns:AddressLine>Testsvingen 12</ns:AddressLine>
 ```

```json
"addressLine":"Testsvingen 12"
 ```

### Pickup agreement also affects lead time

In absence of a pickup agreement with Bring, you hand in the shipment yourself at one of our manned drop-off points. 

Handing in at some places can add an extra day to the delivery time. Hence, to ensure more accurate lead times, we recommend relaying the aforementioned information to us via field "postingAtPostoffice" in your request.
