---
title: Customs API
layout: api
menu:
  apidocs:
    identifier: customs
    title: Customs API
    url: /api/customs
    parent: book
weight: 21
params:
  oas: https://api.qa.bring.com/customs/v1/openapi

  introduction: |
    <p>The Customs API is used to submit customs data electronically</p>

  information:
    - title: Authentication
      content: |
        To integrate with Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](./authorization).

    - title: Rate limiting
      content: |
        Clients exceeding a certain number of requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

    - title: Formats
      content: |
        REST JSON over HTTP

  documentation:
    - title: What can the Customs API help me with?
      content: |
        The Customs API can help users send customs-releated data as structured data to Bring.

---
