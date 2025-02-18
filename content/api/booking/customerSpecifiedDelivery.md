---
title: Customer specified delivery date and time windows for Home Delivery services
layout: api-sub
menu:
  apidocs:
    identifier: bookingcustomerspecifieddelivery
    title: Customer specified delivery date and time windows for Home Delivery services
    parent: booking
weight: 14
---

For outgoing Home Delivery services, Bring provides a possibility to offer alternative delivery dates and time windows to your end customers. Alternative delivery date and time window that have been selected by the end customer, can be booked via Booking API as described in the below request examples.

We advise clients of the Booking API to use Shipping Guide API for getting the alternative delivery dates and time windows for a particular Home Delivery shipment before sending a booking request with the preferred alternative.

## Request example

```json
"product": {
  "customerNumber": "**********",
  "explicitAdditionalServices": false,
  "id": "DOUBLE_INDOOR"
},
"shippingDateTime": "2024-01-23T12:30:00",
"customerSpecifiedDelivery": {
  "startDateTime": "2024-01-25T08:00:00",
  "endDateTime": "2024-01-25T13:00:00"
}
```
