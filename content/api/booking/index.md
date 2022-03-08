---
title: Booking API
layout: api
disqus_identifier: https-developer-bring-com-api-booking
menu:
  apidocs:
    identifier: booking
    title: Booking API
    url: /api/booking
    parent: book
weight: 21

introduction: |
  The Booking API is used to book shipments and supports more than 60 different services as well as a variety of additional services. Each shipment is booked individually, and shipment number, tracking link, EDI-prenotification, label and other transport documents are created as part of the transaction. Additionally, it's possible to book pickups. The API can also provide a list of supported services and countries based on your agreement with Bring (i.e. the customer numbers attached to your user). The Booking API has similarities with the Shipment API, but there are [differences](/api/booking-shipment/).

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page. In addition to authentication, you need to be [authorized](#authorization).

  - title: Rate limiting
    content: |
      Clients exceeding 18 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP and SOAP over HTTP.
      Booking endpoints will assume all requests are UTF-8 encoded.

documentation:
  - title: Versioning
    content: |
      Each request has a `schemaVersion` element indicating which release of the schema is being used in the request and expected schema format in the response. Important: All clients must accept new (unknown) elements in the response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash when unknown elements are encountered. Note that this requirement excludes the (old, but still widely used) Apache Axis 1.x Web Service client framework.

  - title: Authorization
    content: |
      In addition to [authentication](#authentication), you need to be authorized with the _booking_ right in order to perform bookings. This is done in [customer administration in Mybring](https://www.mybring.com/useradmin/external/administration):

      ![Authorized for booking](booking_authorization.png)

      To perform a booking, you must specify which customer number to use. For your convenience, there is an [API for getting the customer numbers](#list-customer-numbers) associated with your API user. The Customer Number API also links customer numbers with the services the customer number is valid for.

  - title: Performance
    content: |
      Different service groups have different response times in booking:

      - Parcels and courier services
        - A booking will typically take < 2 seconds
      - Express UPS services and Cargo
        - A booking will typically take < 3 seconds
      - Express Nordic SameDay
        - A booking will typically take < 10 seconds (query in flight schedules). We are working on improving the response times for QuickPack SameDay, making popular city-pairs much faster.

  - title: Checking prices and availability
    content: |
      Booking uses Shipping Guide as the source for price and availability for the different services. We advise clients of the Booking API to use [Shipping Guide API](/api/shipping-guide_2/) for getting the list price and checking availability before sending a booking request. Note that invoice payment is the only available payment option for the Booking API. This means that the Mybring user ID used in the booking request must have access to the customer number specified as payer of the booking.

  - title: Making labels
    content: |
      The Booking API generates and sends all necessary EDI messages to carry out the shipment. A URL to a PDF label is returned in responses. This label must be printed and be attached to the shipment. A URL that points to tracking information is also returned.

      A GET request to the label URL will result in a HTTP 302 redirect to the concrete storage facility (e.g. redirect to Amazon S3). Ensure that your client follows these redirects.

  - title: Generating QR Codes
    content: |
      For Parcel Norway domestic return services, it is possible to request QR codes. An end user can bring the QR code to any PiB or a Post Office in Norway, scan the QR code, and have a label printed there.

      To book, add the element `generateQrCodes` at the consignment level and set it to `true`. The response will contain one `qrCodeLink` per package. This is a URL to a PNG image of the QR code.

      The following services support QR codes:
      - 9300
      - SERVICEPAKKE_RETURSERVICE
      - 9600
      - EKSPRESS09_RETURSERVICE
      - 9000
      - BPAKKE_DOR-DOR_RETURSERVICE


  - title: Free return of parcel(s)
    content: |
      For Parcel Norway domestic services, it is possible to book the return shipment at the same time as the outgoing shipment. By setting the element `returnProduct` and specifying the return service, you will both get the regular label and the return label in the response. 

      We recommend to include the return label in the outgoing shipment, so that the return label can easily be used if your customer wants to return the shipment to you. 

      You will be invoiced for the return only if your customer uses it.

      The following outgoing and return service combinations are supported:

      | Outgoing services |  Return services |
      | -------------- | -------------- |
      | `3570, 3584`       | `9650` |
      | `4850, 5000, 5600, 5800`   | `9000, 9300, 9600` |
      | `BEDRIFTSPAKKE, SERVICEPAKKE, EKSPRESS09, PA_DOREN`  | `BEDRIFTSPAKKE_RETUR, EKSPRESS09_RETUR, SERVICEPAKKE_RETURSERVICE` |

      #### XML

      ```xml
      <returnProduct>
      <id>9650</id>
      </returnProduct>
      ```

      #### JSON

      ```json
      "returnProduct": {
          "id": "9650",
      }
      ```

  - title: Mailbox Parcel (Pakke i Postkassen)
    content: |
      - Booking Mailbox Parcel in Booking API is a single-step process with one label per booking (multi-kolli is not supported). Each parcel is invoiced separately. A link to the label is returned in the response. 
      - When booking Mailbox Parcel in Booking API, the new API customer number is used. This is identical to your company's main customer number (without prefix PARCELS_NORWAY and without padded zeros if any).
      - When booking Mailbox Parcel in Booking API, the service is defined by setting 3584 or 3570 in the product id. 

      To book, order one of the two product ids:

      ### 3570 (tracking with RFID)
      Mailbox Parcel shipments can optionally be ordered with tracking using RFID.

      Normally, we create PDF labels that can be printed on any printer. If you opt for tracking, we create ZPL labels instead. ZPL stands for [Zebra Programming Language (ZPL)](https://en.wikipedia.org/wiki/Zebra_(programming_language)).

      The labels will be ZPL code containing instructions for programming the passive RFID antenna in the printer's labels with package numbers.

      In addition to the RFID programming instructions, the ZPL code contains instructions for rendering the rest of the label (addresses, icons, barcode, etc.).

      #### Special hardware required
      RFID-tagged labels require special printer hardware. Currently we support the following printers:

      - Zebra R410
      - Zebra 500R

      ### 3584 (no tracking)
      If you don't have a supported printer, you cannot order shipments with tracking. In this case, we will create normal PDF labels that can be printed using any printer.

      ### Additional Service: Bag on door (Pose på døren)
      A delivery alternative for Mailbox Parcels that cannot be delivered to the mailbox. 

      Mailbox Parcel (Pakke i postkassen) is a parcel that will be delivered in the recipient’s mailbox. If the parcel for various reasons does not fit in the mailbox, the sender may, against a surcharge, choose to leave the parcel on the door handle (in a special bag) to avoid it being sent to the pickup point. It's recommended that this delivery option is actively confirmed by the receiver upon booking in the sender's webshop. When the parcel is delivered as a bag on the door, the bar code is scanned and the recipient will receive an SMS/email. Note that if the parcel is delivered in the mailbox the additional fee will not occur.

      #### Terms of delivery
              
      The sender must clearly inform the recipient about the criteria of Bag on door when displaying this service in the check out (e.g. via Shipping Guide API):
        
      - The distance from the mailbox to the recipient's door must not exceed 250 m 
      - House no. must be clearly marked
      - The door must be clearly marked with the recipient's name 
      - Posten must have access to the recipient's door, even when the main entrance is locked, for instance when recipient live in an apartment. 
        
      In cases where the criteria are not met, i.e. bad weather (risk of damage) or where for security reason the risk is considered too high to use Bag on door, the parcel will still be delivered to the recipient's pickup point for delivery.

      ### Example request
      There is an example request for 3584 in "More examples" section below. Booking 3570 is just a matter of changing the service code from 3584 to 3570. If you want to specify a different return address on the label than your actual sender address, use the returnTo party tag. When the returnTo party tag is populated the input will replace your actual sender address on the top left corner of the label.

  - title: Customs Export information
    content: |     
      It is required to pass customs information when booking the following services from Norway -> abroad:

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

      There are two examples in the _More Examples_ section below that show requests containing customs information.
      * In one of these examples, importer not sent in request, hence the recipient is the importing party with (optional) `vatNumber`.
      * In the other example, there is importer party set in the request with the (optional) `vatNumber`.

      ### IOSS (Import One-Stop Shop) - Adding an IOSS number for exports from Norway to EU

      By using the `iossNumber` element of `ediCustomsDeclarations`, one can specify an IOSS number for exports from Norway to EU countries. Only applicable when `natureOfTransaction` is of type `SALE_OF_GOODS`.
      Note that this can not be combined with a `reference` field on the `senders` party. More info on [IOSS](https://www.bring.no/tjenester/toll/ioss).

  - title: VOEC - Customs declaration for import shipments to Norway
    content: |
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

      There is an example in the _More Examples_ section below that shows request containing customs information for import.

  - title: LQ - Limited quantities (of dangerous goods)
    content: |
      When booking Nordic parcel services it is possible to specify that a shipment contains limited quantities of dangerous goods, by adding the `0003` additional service.
      The LQ gross weight is optional unless the shipment is transported by boat, as specified in the table below:

      | From | To |
      | ---- | -- |
      | ALL except FI | FI, FO, GL, IS, AX |
      | FI | SE, DK, NO, FO, GL, IS, AX |

      In such cases the gross weight of Limited quantities must be provided. The document Multimodal Dangerous Goods Form must also be completed correctly and sent to Bring’s booking department before transportation begins.

      The following rules apply:
      - The document Multimodal Dangerous Goods Form must also be completed correctly and sent to Bring’s booking department before transportation begins
      - For shipments with LQ transported by boat (see table above), it is mandatory to specify the LQ gross weight and a dangerous goods declaration must be attached physically to the parcel/pallet.
      - For shipments with LQ to NO, DK or FI, it's not allowed to send shipments with LQ to islands without bridge connections.
      - For shipments with LQ to SE: except from Gotland, it's not allowed to send shipments with LQ to islands without bridge connections. For such shipments to Gotland, it is always mandatory to specify the LQ gross weight in grams.
---
