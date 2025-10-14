---
title: Customers API
layout: api
menu:
  apidocs:
    identifier: customers
    title: Customers API
    url: /api/customers
    parent: book
weight: 21
aliases:
  - customersapi.html
params:
  disqus_identifier: https-developer-bring-com-api-customers
  oas: https://api.qa.bring.com/booking-customer-info-api/api-docs

  introduction: |
    <p>The Customers API is used to list available services for one or more customers</p>

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

  documentation:
    - title: What can the Customers API help me with?
      content: |
        The Customers API can help users bootstrap their checkout and booking process by providing a list of customers, countries, and services available to the user. 

---
