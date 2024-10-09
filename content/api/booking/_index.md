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
aliases:
  - bookingapi.html

introduction: |
  The Booking API is used to book shipments and supports more than 60 different services as well as a variety of additional services. Each shipment is booked individually, and shipment number, tracking link, EDI-prenotification, label and other transport documents are created as part of the transaction. The API can also provide a list of supported services and countries based on your agreement with Bring (i.e. the customer numbers attached to your user). The Booking API has similarities with the Shipment API, but there are [differences](/api/booking-shipment/).

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](#authorization).

  - title: Rate limiting
    content: |
      Clients exceeding 18 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.
      Booking endpoints will assume all requests are UTF-8 encoded.

subpages:
  title: Special topics

oas: https://api.bring.com/booking/api-docs
---
