---
title: Customer specified delivery date and time windows for Courier and Distribution services
layout: api-sub
menu:
  apidocs:
    identifier: booking_customer_specified_delivery_courier_and_distribution_service
    title: Customer specified delivery date and time windows for Courier and Distribution services
    parent: booking
weight: 14
---

For Courier and Distribution services, Bring provides a possibility to offer alternative delivery dates and time windows to your end customers. Alternative delivery date and time window that have been selected by the end customer, can be booked via Booking API as described in the below request examples.

We advise clients of the Booking API to use Shipping Guide API for getting the alternative delivery dates and time windows for a particular Courier or Distribution shipment before sending a booking request with the preferred alternative.

## Request example

### XML
```xml
<product>
  <customerNumber>"**********"</customerNumber>
  <explicitAdditionalServices>false</explicitAdditionalServices>
  <id>3625</id>
</product>
<shippingDateTime>2025-08-27T07:00:00+02:00</shippingDateTime>
<customerSpecifiedDelivery>
 <startDateTime>2025-08-27T08:00:00</startDateTime>
  <endDateTime>2025-08-27T09:00:00</endDateTime>
</customerSpecifiedDelivery>
```

### JSON
```json
"product": {
  "customerNumber": "**********",
  "explicitAdditionalServices": false,
  "id": "3625"
},
"shippingDateTime": "2025-08-27T07:00:00+02:00",
"customerSpecifiedDelivery": {
  "startDateTime": "2025-08-27T08:00:00",
  "endDateTime": "2025-08-27T09:00:00"
}
```

Please send timezone in shippingDateTime

#### For Norway/Denmark/Sweden
```json
"shippingDateTime": "2025-08-27T07:00:00+02:00"
```

#### For Finland
```json
"shippingDateTime": "2025-08-27T07:00:00+03:00"
```