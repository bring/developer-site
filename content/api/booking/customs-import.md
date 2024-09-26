---
title: VOEC - Customs declaration for import shipments to Norway
layout: api-sub
menu:
  apidocs:
    identifier: bookingcustoms
    title: VOEC - Customs declaration for import shipments to Norway
    parent: booking
weight: 10
---

With this concept the recipient can skip paying VAT when picking up the parcel on a pickup point in Norway. Instead, the web shop collects the VAT directly when the recipient is paying in the checkout.
In that way, the Norwegian tax authorities doesn't need to demand this from the recipients via pickup points, the web shops would do the customs clearance.

This feature is applicable for following services, when booking from abroad -> Norway:

  - Pickup Parcel
  - Pickup Parcel Bulk
  - Home Delivery Parcel

  To avail this functionality, the following elements must be sent in the booking request:

  - quantity (required)
  - goodsDescription (required)
  - customsArticleNumber (required)
  - itemNetWeightInKg (required)
  - tariffLineAmount (required)
  - currency (required)
  - countryOfOrigin (optional)
  - natureOfTransaction (optional). If specified, must be SALE_OF_GOODS. In case not specified, system would treat it as SALE_OF_GOODS.
  - In addition to that, web shop's **vatOnEcommerce** must be added on shipment level .

  However, if VOEC functionality is not needed, then its not mandatory to fill in above information.
  Please refer to the _Request params_ section below for more details about the elements. Customs tariff codes (tolltariffnummer) can be found [here](http://tolltariffen.toll.no/).

  ### Example {#voec-example}

  In this example, you are sending a parcel/shipment with 2 shampoos, 5 cotton t-shirts and 1 wool jacket. The number of pieces is 8 (2 shampoos + 5 cotton
  t-shirts + 1 wool jacket), and the number of articles is 3 (shampoo, cotton t-shirt, wool jacket). The whole shipment is referred to as an item.

  | Quantity | Description of contents | Customs tariff code | Total content net weight (kg) | Total content value | Currency | Country of origin |
  | -------: | ----------------------- | ------------------- | ----------------------------: | ------------------: | -------- | ----------------- |
  | `2` | `shampoo` | `33.05.1000` | `3.0` | `200` | `NOK` | `CH`|
  | `5` | `cotton t-shirts` | `61.09.1000` | `2.5` | `1000`| `NOK`| `PL` |
  | `1` | `wool jacket` | `61.04.3100` | `2.0` | `750` | `NOK`| `DE` |
