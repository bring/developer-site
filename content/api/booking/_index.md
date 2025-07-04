---
title: Booking API
layout: api
menu:
  apidocs:
    identifier: booking
    title: Booking API
    url: /api/booking
    parent: book
weight: 21
aliases:
  - bookingapi.html
params:
  disqus_identifier: https-developer-bring-com-api-booking
  oas: https://api.bring.com/booking/api-docs

  important:
    - type: warn
      title: New customs information structure, with support for VOEC on imports to Norway
      message: |
        The Booking API has gotten a new structure for sending customs information. Along with this comes support for sending VOEC (VAT on E-commerce) on imports to Norway on some services.
        The existing/old format is now deprecated, and will be phased out. See [this page](/api/booking/customs/) for more information on how to send such information when ordering a shipment.


  introduction: |
    The Booking API is used to book shipments and supports more than 60 different services as well as a variety of additional services. Each shipment is booked individually, and shipment number, tracking link, EDI-prenotification, label and other transport documents are created as part of the transaction. The API can also provide a list of supported services and countries based on your agreement with Bring (i.e. the customer numbers attached to your user). The Booking API has similarities with the Shipment API, but there are [differences](/api/booking-shipment/).

  information:
    - title: Authentication
      content: |
        To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](./authorization).

    - title: Rate limiting
      content: |
        Clients exceeding 18 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

    - title: Formats
      content: |
        REST JSON over HTTP is recommended for all new integrations. While we currently also support XML, this is very likely to be phased out in the future.
        Booking endpoints will assume all requests are UTF-8 encoded.

  subpages:
    title: Special topics
---
