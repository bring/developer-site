---
hidden: true
title: Address API
layout: api
disqus_identifier: https-developer-bring-com-api-address
menu:
  apidocs:
    identifier: address
    title: Address API
    url: /api/address
    parent: checkout
weight: 13

introduction: |
  The Address API

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

oas: https://api.qa.bring.com/address/api-docs/
---
