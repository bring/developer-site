---
title: Pickup API
layout: api
support: true
menu:
  apidocs:
    identifier: pickup
    title: Pickup API
    url: /api/pickup
    parent: book
weight: 21
aliases:
  - pickupapi.html

introduction: |
  <p>The Pickup API is used to book ad hoc pickup (to the terminal) that customers may need/want e.g. if they don't have a fixed pickup agreement with Bring for the relevant shipments. Two types of pickup are supported - cargo shipments in Norway and for parcels and business pallet in NO/SE/DK.</p>

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](./authorization).

  - title: Rate limiting
    content: |
      Clients exceeding a certain number of requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST JSON over HTTP is recommended for all new integrations. While we currently also support XML, this is very likely to be phased out in the future.
      Pickup endpoints will assume all requests are UTF-8 encoded.

subpages:
  title: Special topics

documentation:
  - title: Where is ad hoc pickup applicable?
    content: |
      For cargo services in Norway, ad hoc pickup orders are only applicable in the below scenarios.

      ### Applicable:
      - 5400 if shipment not booked with pickup</li>
      - 5100 if shipment not booked via Booking API (where pickup is always included)</li>
  
      ### Not applicable:
      - 5300
      - 5200

oas: https://api.bring.com/pickup/api-docs
---
