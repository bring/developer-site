---
title: Customs information
layout: api-sub
menu:
  apidocs:
    identifier: bookingcustoms
    title: Customs information
    parent: booking
weight: 10
---

## Customs data
Depending on the service ordered and the country combination, one can pass customs data with the booing. The customs information will be sent electronically from Bring to the destination country.

### Customs data example {#customs-export-information-example}

In this example, you are sending a parcel/shipment with 2 shampoos, 5 cotton t-shirts and 1 wool jacket. The number of pieces is 8 (2 shampoos + 5 cotton
t-shirts + 1 wool jacket), and the number of articles is 3 (shampoo, cotton t-shirt, wool jacket). The whole shipment is referred to as an item.

| Quantity | Description of contents | Customs tariff code | Total content net weight (kg) | Total content value | Currency | Country of origin |
| -------: | ----------------------- | ------------- | ----------------------------: | ------------------: | -------- | ----------------- |
| `2` | `shampoo` | `33051000` | `3.0` | `200` | `NOK` | `CH`|
| `5` | `cotton t-shirts` | `61091000` | `2.5` | `1000`| `NOK`| `PL` |
| `1` | `wool jacket` | `61043100` | `2.0` | `750` | `NOK`| `DE` |

**Nature of Transaction**: Gift or Sale of Goods or Returned Goods or Commercial Sample or Documents or Other

Sending `Importer` and `Exporter` parties in the request is mandatory.

See [Customs tariff codes (tolltariffnummer)](http://tolltariffen.toll.no/) for more details about tariff codes.

Another additional field captured for customs is `vatNumber` for the importer/exporter parties. This is an optional field.

## Export from Norway

It is required to pass customs information when booking the following services from Norway to abroad:

- Business Parcel (0330)
- PickUp Parcel (0340)
- Letter Packet (3639)

Sending customs export information as part of a booking request only applies to the aforementioned products.

### IOSS (Import One-Stop Shop) - Adding an IOSS number for exports from Norway to EU

By using the `ioss` element of `customsInformation`, one can specify an IOSS number for exports from Norway to EU countries. Only allowed when `natureOfCargo` is of type `SALE_OF_GOODS`.
Note that this can not be combined with a `reference` field on the `senders` party. See example [here](https://developer.bring.com/api/booking#make-a-booking-post) More info about IOSS [here](https://www.bring.no/tjenester/toll/ioss).

## Import to Norway

Currently, the only way to pass customs data for shipments to Norway, is by using VOEC.

### VOEC (VAT on E-commerce) - Adding a VOEC number for imports to Norway

VOEC can be declared on the following services when sent to Norway from abroad

- Pickup Parcel (0340)
- Pickup Parcel Bulk (0342)
- Home Delivery Parcel (0349)

By using the `voec` element of `customsInformation`, one can specify a VOEC number for imports to Norway. Only allowed when `natureOfCargo` is of type `SALE_OF_GOODS`. Not that a `consolidatedShipmentId` will have to be specified for grouping shipments.
See example [here](https://developer.bring.com/api/booking#make-a-booking-post) More info about VOEC [here](https://www.bring.no/en/services/customs/voec-vat-on-e-commerce).
