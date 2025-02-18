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

It is required to pass customs information when booking the following services from Norway to abroad:

- Business Parcel
- PickUp Parcel
- Letter Packet (3639)

Sending customs information as part of a booking request only applies to the aforementioned products.

When included during booking, the customs information will be sent electronically from Bring to the destination country.

Please refer to the _Request params_ section below for more details about the elements. [Customs tariff codes (tolltariffnummer)](http://tolltariffen.toll.no/).

## Example {#customs-export-information-example}

In this example, you are sending a parcel/shipment with 2 shampoos, 5 cotton t-shirts and 1 wool jacket. The number of pieces is 8 (2 shampoos + 5 cotton
t-shirts + 1 wool jacket), and the number of articles is 3 (shampoo, cotton t-shirt, wool jacket). The whole shipment is referred to as an item.

| Quantity | Description of contents | Customs tariff code | Total content net weight (kg) | Total content value | Currency | Country of origin |
| -------: | ----------------------- | ------------------- | ----------------------------: | ------------------: | -------- | ----------------- |
| `2` | `shampoo` | `33.05.1000` | `3.0` | `200` | `NOK` | `CH`|
| `5` | `cotton t-shirts` | `61.09.1000` | `2.5` | `1000`| `NOK`| `PL` |
| `1` | `wool jacket` | `61.04.3100` | `2.0` | `750` | `NOK`| `DE` |

<strong>Nature of Transaction</strong>: Gift or Sale of Goods or Returned Goods or Commercial Sample or Documents or Other

Sending `Importer` and `Exporter` parties in the request is mandatory.

Another additional field captured for customs is `vatNumber` for the importer/exporter parties. This is an optional field.

## IOSS (Import One-Stop Shop) - Adding an IOSS number for exports from Norway to EU

By using the `ioss` element of `customsInformation`, one can specify an IOSS number for exports from Norway to EU countries. Only allowed when `natureOfCargo` is of type `SALE_OF_GOODS`.
Note that this can not be combined with a `reference` field on the `senders` party. More info on [IOSS](https://www.bring.no/tjenester/toll/ioss).

## Request examples
### Customs declaration

```json
  "consignments": [
    {
      "shippingDateTime": "2025-02-01T12:31:33.007+00:00",
      "parties": {
        "sender": {
          "name": "Ola Nordmann",
          "addressLine": "Testsvingen 12",
          "postalCode": "0150",
          "city": "OSLO",
          "countryCode": "NO",
          "reference": "11522",
          "additionalAddressInfo": "Hentes på baksiden etter klokken to",
          "contact": {
            "name": "Trond Nordmann",
            "phoneNumber": "+45700000000",
            "email": "trond@normanntest.no"
          }
        },
        "recipient": {
          "name": "Tore Mottaker",
          "addressLine": "Mottakerveien 14",
          "addressLine2": "c/o Tina Mottaker",
          "postalCode": "1200",
          "city": "COPENHAGEN",
          "countryCode": "DK",
          "reference": "43242",
          "additionalAddressInfo": "Bruk ringeklokken",
          "contact": {
            "name": "Tore Mottaker",
            "email": "tore@mottakertest.no",
            "phoneNumber": "+4740000000"
          }
        },
        "importer": {
          "name": "Im Porter",
          "addressLine": "Mottakerveien 15",
          "addressLine2": "c/o Tina Mottaker",
          "postalCode": "1200",
          "city": "COPENHAGEN",
          "countryCode": "DK",
          "vatNumber": "12345567"
        },
        "exporter": {
          "name": "Ex Porter",
          "addressLine": "Mottakerveien 16",
          "addressLine2": "c/o Tina Mottaker",
          "postalCode": "0150",
          "city": "OSLO",
          "countryCode": "NO"
        }
      },
      "product": {
        "id": "PICKUP_PARCEL",
        "customerNumber": "nnn",
        "additionalServices": []
      },
      "customsInformation": {
        "ioss": "IM01234567889",
        "natureOfCargo": {
          "type": "SALE_OF_GOODS",
        },
        "customsDeclarations": [
          {
            "goodsDescription": "shampoo",
            "customsArticleNumber": "33051000",
            "grossWeight": 3.0,
            "netWeight": 3.0,
            "amount": 200.0,
            "currency": "NOK",
            "countryCodeOrigin": "CH",
            "quantity": 2
          },
          {
            "goodsDescription": "cotton t-shirts",
            "customsArticleNumber": "61091000",
            "grossWeight": 2.5,
            "netWeight": 2.5,
            "amount": 1000.0,
            "currency": "NOK",
            "countryCodeOrigin": "PL",
            "quantity": 5
          },
          {
            "goodsDescription": "wool jacket",
            "customsArticleNumber": "61043100",
            "grossWeight": 2.0,
            "netWeight": 2.0,
            "amount": 750.0,
            "currency": "NOK",
            "countryCodeOrigin": "DE",
            "quantity": 1
          }
        ]
      },
      "packages": [
        {
          "goodsDescription": "description",
          "weightInKg": 10,
          "packageType": "pallet",
          "dimensions": {
            "heightInCm": 23,
            "widthInCm": 13,
            "lengthInCm": 11
          }
        }
      ]
    }
  ]

```
