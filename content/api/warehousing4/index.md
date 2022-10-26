---
title: Pull order/article
layout: api
disqus_identifier: https-developer-bring-com-api-warehousing
menu:
  apidocs:
    identifier: warehousing4
    title: Pull order/article 
    url: /api/warehousing
    parent: warehouse
weight: 3

introduction:
      You are able to extract detailed order information from our warehouse while the orders are being processed. Further, the API provides information about articles in stock, with methods for retrieving information about single items or configurable list of items.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON and SOAP over HTTP. Warehousing API has several interfaces (SOAP and XML/JSON). Choose the option that fits your needs best (see table below). The XML/JSON interface is the core interface with complete functionality. Please note that this API currently doesn't support json on all of its methods yet. Look in the example section to see which are supported.

documentation:
  - title: Error handling
    content: |
      When using the Warehousing API, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use timeouts and other error handling techniques when making requests to the service.

      How you handle errors depends on the nature of your application, but one strategy for handling such situations is by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).

      See [the list of error codes](#list-error-codes) for hints on how to implement error handling.
---
