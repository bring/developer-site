---
title: Lead time
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgleadtime
    title: Lead time
    parent: shippingguide_2
weight: 6
---
Lead time does not only depend on the recipient’s postal code, but also the address itself.

For example, two different addresses on the same postal code can have different lead time. 
We have therefore added an addressLine field, which allows lead time to be calculated based on both postal code and street address. For this to work, it is important that recipients fill out a valid street address. 

By using our Address API, the address the recipients fill inn can be pre-validated, which will ensure more accurate lead times.We therefore recommend using the Address API in combination with Shipping Guide API. 

There are several services that are affected by this new field: ```1000, 1988, 3500, 5000, 1736, 5600, 0330, 0332, 0349, 3570, 3584```
```xml
 <ns:AddressLine>Testsvingen 12</ns:AddressLine>
 ```

```json
"addressLine":"Testsvingen 12"
 ```
