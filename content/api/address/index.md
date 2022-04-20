---
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
  The Address API is used for validating and querying addresses, as well as getting suggestions in scenarios where the complete address is not known. It currently supports Norwegian addresses (street, place, post office box and postal place addresses). Addresses validated by this API are guaranteed to be valid, and it is therefore recommended to validate addresses that are used as input to Booking and Checkout related APIs.


information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Rate limiting
    content: |
      Clients exceeding 40 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP. 

      Returned format is controlled by the `Accept` header. Supported values are `application/json` and `application/xml`. Default returned format is JSON.

oas: https://api.bring.com/address/api-docs/
---
