---
title: General
layout: api-sub
menu:
  apidocs:
    identifier: booking_customs_general
    title: General
    parent: booking_customs
weight: 1
---

### New customs structure from March 2025
There's been a change in the way customs information must be reported. This format will be applicable for all customs declarations.
Impacted services will be

- Business Parcel (0330)
- PickUp Parcel (0340)
- Letter Packet (3639)

For 3639, this applies immediately, whereas there will be a grace period for the remaining ones. We'll notify about this, but advice scheduling the change.

The new element to be used is called `customsInformation`, which replaces the element `ediCustomsInformation` on the `product` element.

The main differences are:
- a consent field is added, this needs to be true 
- importer and exporter parties are required 

If there's no difference between the importer/recipient and exporter/sender pairs, it's ok to send the same information. 

## Customs data
Depending on the service ordered and the country combination, one can pass customs data with the booking. The customs information will be sent electronically from Bring to the destination country.

### Customs data example {#customs-export-information-example}

In this example, you are sending a parcel/shipment with 2 shampoos, 5 cotton t-shirts and 1 wool jacket. The number of pieces is 8 (2 shampoos + 5 cotton
t-shirts + 1 wool jacket), and the number of articles is 3 (shampoo, cotton t-shirt, wool jacket). The whole shipment is referred to as an item.

| Quantity | Description of goods | Customs tariff code | Total content gross weight (kg) | Total content value | Currency | Country of origin |
| -------: |----------------------| -------- |--------------------------------:| ------------------: | -------- | ----------------- |
| `2` | `shampoo`            | `330510` |                           `3.0` | `200` | `NOK` | `CH`|
| `5` | `cotton t-shirts`    | `610910` |                           `2.5` | `1000`| `NOK`| `PL` |
| `1` | `wool jacket`        | `610431` |                           `2.0` | `750` | `NOK`| `DE` |

**Nature of Cargo**: Gift or Sale of Goods or Returned Goods or Commercial Sample or Documents or Other

Sending `Importer` and `Exporter` parties in the request is mandatory.

See [Customs tariff codes (tolltariffnummer)](http://tolltariffen.toll.no/) for more details about tariff codes.

Another additional field captured for customs is `vatNumber` for the importer/exporter parties. This is an optional field.

## Export from Norway

It is required to pass customs information when booking the following services from Norway to abroad:

- Business Parcel (0330)
- PickUp Parcel (0340)
- Letter Packet (3639)

Sending customs export information as part of a booking request only applies to the aforementioned products.

### Consent requirement for Customs declaration

For exports from Norway, the sender is required to provide explicit consent confirming that:

- The customs information provided is accurate and complete.
- The consignment does not contain any dangerous or prohibited goods.
- This ensures compliance with customs regulations and the secure processing of international shipments.

**Note**:
- Providing consent is mandatory for booking.
- Bookings will not be allowed unless consent is provided.

Consent is signalled with the `consent` property on `customsInformation`. The value will lead to digital signature on CN23 label / customs declaration when this document is applicable. This can be seen in the image of a CN23 label below.

![](/images/booking/cn23_consent.png)

### IOSS (Import One-Stop Shop) - Adding an IOSS number for exports from Norway to EU

By using the `ioss` element of `customsInformation`, one can specify an IOSS number for exports from Norway to EU countries. This is only allowed when `natureOfCargo` is of type `SALE_OF_GOODS`.
Note that this can not be combined with a `reference` field on the `senders` party. See example [here](https://developer.bring.com/api/booking#make-a-booking-post) and more info about IOSS [here](https://www.bring.no/tjenester/toll/ioss).

## Import to Norway

Currently, the only way to pass customs data for shipments to Norway, is by using VOEC.
