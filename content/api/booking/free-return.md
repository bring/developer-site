---
title: Free return of parcels
layout: api-sub
menu:
  apidocs:
    identifier: bookingfreereturn
    title: Free return of parcels
    parent: booking
weight: 9
---

For Parcel Norway domestic services, it is possible to book the return shipment at the same time as the outgoing
shipment. By setting the element `returnProduct` and specifying the return service, you will both get the regular label
and the return label in the response.

We recommend to include the return label in the outgoing shipment, so that the return label can easily be used if your customer wants to return the shipment to you. 

You will be invoiced for the return only if your customer uses it.

The following outgoing and return service combinations are supported:

| Outgoing services              | Return services            |
|--------------------------------|----------------------------|
| `3584, 4850, 5000, 5600, 5800` | `9000, 9300, 9600, 9350`   |

## Request examples


### Return parcel to business with free return of parcel

 ```json
"product": {
  "id": "5800"
},
"returnProduct": {
  "id": "9350"
}
 ```


### Return parcel to business with free return of parcel and flex delivery addditional service

```json
"product": {
  "id": "5800"
},
"returnProduct": {
  "id": "9350",
  "additionalServices": [
    {
      "id": "0041"
    }
  ]
}
```
