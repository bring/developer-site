---
title: Customs information
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingcustoms
    title: Customs information
    parent: bookingnew
weight: 10
hidden: true
---

It is required to pass customs information when booking the following services from Norway to abroad:

- Business Parcel
- PickUp Parcel

Sending customs information as part of a booking request only applies to the aforementioned products.

When included during booking, the customs information will be sent electronically from Bring to the destination country. 

If sending customs information, the following elements are to be used:

- quantity (required)
- goodsDescription (required)
- customsArticleNumber (optional)
- itemNetWeightInKg (required)
- tarriffLineAmount (required)
- currency (required)
- countryOfOrigin (required)
- natureOfTransaction (required)

Please refer to the _Request params_ section below for more details about the elements. [Customs tariff codes (tolltariffnummer)](http://tolltariffen.toll.no/).

### Example {#customs-export-information-example}

In this example, you are sending a parcel/shipment with 2 shampoos, 5 cotton t-shirts and 1 wool jacket. The number of pieces is 8 (2 shampoos + 5 cotton
t-shirts + 1 wool jacket), and the number of articles is 3 (shampoo, cotton t-shirt, wool jacket). The whole shipment is referred to as an item.

| Quantity | Description of contents | Customs tariff code | Total content net weight (kg) | Total content value | Currency | Country of origin |
| -------: | ----------------------- | ------------------- | ----------------------------: | ------------------: | -------- | ----------------- |
| `2` | `shampoo` | `33.05.1000` | `3.0` | `200` | `NOK` | `CH`|
| `5` | `cotton t-shirts` | `61.09.1000` | `2.5` | `1000`| `NOK`| `PL` |
| `1` | `wool jacket` | `61.04.3100` | `2.0` | `750` | `NOK`| `DE` |

<strong>Nature of Transaction</strong>: Gift or Sale of Goods or Returned Goods or Commercial Sample or Documents or Other

Sending `Importer` party in the request is not mandatory. But if there is no importer sent then system will consider recipient as importer.

Another additional field captured for customs is `vatNumber` for the parties. This is an optional field. If you are setting importer party then you can add `vatNumber` in it,
else you can set `vatNumber` in the existing recipient party.

There are two examples in the _Request examples_ section below that show requests containing customs information.
* In one of these examples, importer not sent in request, hence the recipient is the importing party with (optional) `vatNumber`.
* In the other example, there is importer party set in the request with the (optional) `vatNumber`.

### IOSS (Import One-Stop Shop) - Adding an IOSS number for exports from Norway to EU

By using the `iossNumber` element of `ediCustomsDeclarations`, one can specify an IOSS number for exports from Norway to EU countries. Only applicable when `natureOfTransaction` is of type `SALE_OF_GOODS`.
Note that this can not be combined with a `reference` field on the `senders` party. More info on [IOSS](https://www.bring.no/tjenester/toll/ioss).

### Request examples
#### Customs declaration - with recipient as the importing party

#### XML

```xml
<parties>
  <recipient>
    <name>Tore Mottaker</name>
    <addressLine>Mottakerveien 14</addressLine>
    <addressLine2>c/o Tina Mottaker</addressLine2>
    <postalCode>12000</postalCode>
    <city>stockholm</city>
    <countryCode>se</countryCode>
    <vatNumber>12345</vatNumber>
  </recipient>
</parties>
<product>
  <id>BUSINESS_PARCEL</id>
  <ediCustomsDeclarations>
    <natureOfTransaction>GIFT</natureOfTransaction>
    <ediCustomsDeclaration>
      <quantity>2</quantity>
      <goodsDescription>shampoo</goodsDescription>
      <customsArticleNumber>33.05.1000</customsArticleNumber>
      <itemNetWeightInKg>3.0</itemNetWeightInKg>
      <tarriffLineAmount>200</tarriffLineAmount>
      <currency>NOK</currency>
      <countryOfOrigin>CH</countryOfOrigin>
    </ediCustomsDeclaration>
    <ediCustomsDeclaration>
      <quantity>5</quantity>
      <goodsDescription>cotton t-shirts</goodsDescription>
      <customsArticleNumber>61.09.1000</customsArticleNumber>
      <itemNetWeightInKg>2.5</itemNetWeightInKg>
      <tarriffLineAmount>1000</tarriffLineAmount>
      <currency>NOK</currency>
      <countryOfOrigin>PL</countryOfOrigin>
    </ediCustomsDeclaration>
    <ediCustomsDeclaration>
      <quantity>1</quantity>
      <goodsDescription>wool jacket</goodsDescription>
      <customsArticleNumber>61.04.3100</customsArticleNumber>
      <itemNetWeightInKg>2.0</itemNetWeightInKg>
      <tarriffLineAmount>750</tarriffLineAmount>
      <currency>NOK</currency>
      <countryOfOrigin>DE</countryOfOrigin>
    </ediCustomsDeclaration>
  </ediCustomsDeclarations>
</product>
```

#### JSON

```json
"parties": {
  "recipient": {
    "name": "Tore Mottaker",
    "addressLine": "Mottakerveien 14",
    "addressLine2": "c/o Tina Mottaker",
    "postalCode": "12000",
    "city": "Stockholm",
    "countryCode": "SE",
    "vatNumber": "12345",
  }
}
"product": {
  "id": "BUSINESS_PARCEL",
  "ediCustomsDeclarations": {
    "ediCustomsDeclaration": [
      {
        "quantity": 2,
        "goodsDescription": "shampoo",
        "customsArticleNumber": "33.05.1000",
        "itemNetWeightInKg": 3.0,
        "tarriffLineAmount": 200,
        "currency": "NOK",
        "countryOfOrigin": "CH"
      },
      {
        "quantity": 5,
        "goodsDescription": "cotton t-shirts",
        "customsArticleNumber": "61.09.1000",
        "itemNetWeightInKg": 2.5,
        "tarriffLineAmount": 1000,
        "currency": "NOK",
        "countryOfOrigin": "PL"
      },
      {
        "quantity": 1,
        "goodsDescription": "wool jacket",
        "customsArticleNumber": "61.04.3100",
        "itemNetWeightInKg": 2.0,
        "tarriffLineAmount": 750,
        "currency": "NOK",
        "countryOfOrigin": "DE"
      }
    ],
    "natureOfTransaction": "GIFT"
  }
}
```

#### Customs declaration - with importer

#### XML

```xml
<parties>
  <importer>
    <name>Tore Mottaker</name>
    <addressLine>Mottakerveien 14</addressLine>
    <addressLine2>c/o Tina Mottaker</addressLine2>
    <postalCode>12000</postalCode>
    <city>stockholm</city>
    <countryCode>se</countryCode>
    <vatNumber>12345</vatNumber>
  </importer>
</parties>
<product>
  <id>BUSINESS_PARCEL</id>
  <ediCustomsDeclarations>
    <natureOfTransaction>GIFT</natureOfTransaction>
    <ediCustomsDeclaration>
      <quantity>2</quantity>
      <goodsDescription>shampoo</goodsDescription>
      <customsArticleNumber>33.05.1000</customsArticleNumber>
      <itemNetWeightInKg>3.0</itemNetWeightInKg>
      <tarriffLineAmount>200</tarriffLineAmount>
      <currency>NOK</currency>
      <countryOfOrigin>CH</countryOfOrigin>
    </ediCustomsDeclaration>
    <ediCustomsDeclaration>
      <quantity>5</quantity>
      <goodsDescription>cotton t-shirts</goodsDescription>
      <customsArticleNumber>61.09.1000</customsArticleNumber>
      <itemNetWeightInKg>2.5</itemNetWeightInKg>
      <tarriffLineAmount>1000</tarriffLineAmount>
      <currency>NOK</currency>
      <countryOfOrigin>PL</countryOfOrigin>
    </ediCustomsDeclaration>
    <ediCustomsDeclaration>
      <quantity>1</quantity>
      <goodsDescription>wool jacket</goodsDescription>
      <customsArticleNumber>61.04.3100</customsArticleNumber>
      <itemNetWeightInKg>2.0</itemNetWeightInKg>
      <tarriffLineAmount>750</tarriffLineAmount>
      <currency>NOK</currency>
      <countryOfOrigin>DE</countryOfOrigin>
    </ediCustomsDeclaration>
  </ediCustomsDeclarations>
</product>
```

#### JSON

```json
"parties": {
  "importer": {
    "name": "Tore Mottaker",
    "addressLine": "Mottakerveien 14",
    "addressLine2": "c/o Tina Mottaker",
    "postalCode": "12000",
    "city": "Stockholm",
    "countryCode": "SE",
    "vatNumber": "12345"
  }
}
"product": {
  "id": "BUSINESS_PARCEL",
  "ediCustomsDeclarations": {
    "ediCustomsDeclaration": [
      {
        "quantity": 2,
        "goodsDescription": "shampoo",
        "customsArticleNumber": "33.05.1000",
        "itemNetWeightInKg": 3.0,
        "tarriffLineAmount": 200,
        "currency": "NOK",
        "countryOfOrigin": "CH"
      },
      {
        "quantity": 5,
        "goodsDescription": "cotton t-shirts",
        "customsArticleNumber": "61.09.1000",
        "itemNetWeightInKg": 2.5,
        "tarriffLineAmount": 1000,
        "currency": "NOK",
        "countryOfOrigin": "PL"
      },
      {
        "quantity": 1,
        "goodsDescription": "wool jacket",
        "customsArticleNumber": "61.04.3100",
        "itemNetWeightInKg": 2.0,
        "tarriffLineAmount": 750,
        "currency": "NOK",
        "countryOfOrigin": "DE"
      }
    ],
    "natureOfTransaction": "GIFT"
  }
}
```
