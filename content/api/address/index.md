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

documentation:
  - title: What endpoint should I use?
    content: |
      The address API offers several endpoints intended for different use cases. Depending on the use case different endpoints are more or less suited.

      ### Auto-complete or address suggestion scenarios
        If you are planning to display suggestions with 2 separate input elements for street/place and house number, these are the APIs for you: 
        - [Get street or place suggestions](/api/address/#get-street-or-place-suggestions-get)
        - [Get available street numbers](/api/address/#get-available-street-numbers-get)

        If you want to display a single input element for the complete address (including house number), you should use this API:
        - [Get address suggestions](/api/address/#get-address-suggestions-get)
 
        The suggestion endpoints performs fuzzy searches and will return exact and/or close matches. The returned matches should therefore be offered to the end user for selection.

      ### Address validation
        The address validation will validate the provided addresses, and provide close matching suggesions if no exact match is found.
        - [Validate provided address](/api/address/#validate-provided-address-get)
 
        You could also use the address querying endpoint if you are not interested in suggestions when no exact match is found. 

      ### Address lookup and querying
        [Get addresses matching query](/api/address/#get-addresses-matching-query-get)

oas: https://api.bring.com/address/api-docs/address
---
