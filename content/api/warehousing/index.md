---
title: Send order/article update
layout: api
disqus_identifier: https-developer-bring-com-api-warehousing
menu:
  apidocs:
    identifier: warehousing
    title: Send order/article update
    url: /api/warehousing
    parent: warehouse
weight: 1

introduction:
  The Warehousing API is used to submit order and article information to Bring’s warehouses. Users are also able to extract/subscribe for detailed order information from our warehouses while the orders are being processed. Further, the API provides information about articles in stock, with methods for retrieving information about single items or configurable list of items.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON over HTTPS. This API doesn't support JSON for all methods yet. Look in the example section to see which are supported.

oas: data/warehousing.json
---
