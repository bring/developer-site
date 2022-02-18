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
  The Address API is used for validating and querying addresses, as well as getting suggestions in scenarios when the complete address is not known. It currently only supports Norwegian addresses. It supports street, place and postal place addresses. Addresses validated by this API is guaranteed to valid when used with the other checkout APIs (Booking, Shipping guide, Pickup point and Postal code). It is therefore recommended to validate addresses before using them in a booking request.


information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page. In addition to authentication, you need to be [authorized](#authorization).

  - title: Rate limiting
    content: |
      Clients exceeding 40 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

oas: https://api.qa.bring.com/address/api-docs/
---
