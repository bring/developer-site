---
title: Pickup API
layout: api
disqus_identifier: https-developer-bring-com-api-pickup
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
  The Pickup API is used to book ad hoc pickups.

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](#authorization).

  - title: Rate limiting
    content: |
      Clients exceeding a certain number of requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.
      Pickup endpoints will assume all requests are UTF-8 encoded.

oas: https://api.bring.com/pickup/api-docs
---
