---
title: Booking API
layout: api
menu:
  apidocs:
    identifier: bookingnew
    title: Booking API
    url: /api/bookingnew
    parent: book
weight: 20
hidden: true
aliases:
  - bookingapi.html

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

subpages:
  title: Special topics

oas: https://www.qa.mybring.com/booking-api/v3/api-docs
---
