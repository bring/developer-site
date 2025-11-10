---
title: Customer Info API
layout: api
menu:
  apidocs:
    identifier: customerinfo
    title: Customer Info API
    url: /api/customerinfo
    parent: book
weight: 21
aliases:
  - customerinfoapi.html
params:
  disqus_identifier: https-developer-bring-com-api-customer-info
  oas: https://api.bring.com/customer-info/api-docs

  introduction: |
    <p>The Customer Info API is used to list available services for one or more customers</p>

  information:
    - title: Authentication
      content: |
        To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](./authorization).

    - title: Rate limiting
      content: |
        Clients exceeding a certain number of requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

    - title: Formats
      content: |
        REST JSON over HTTP is the way for all new integrations. While we currently also support XML for legacy reasons, this will be phased out in the future.

  documentation:
    - title: What can the Customer Info API help me with?
      content: |
        The Customer Info API can help users bootstrap their checkout and booking process by providing a list of customers, countries, and services available to them.

---
