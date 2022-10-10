---
title: Order Management API (REST)
layout: api
disqus_identifier: https-developer-bring-com-api-order-management
menu:
  apidocs:
    identifier: ordermanagement
    title: Order Management API (REST)
    url: /api/order-management
    parent: om
weight: 61

introduction: |
  Order Management is a solution that lets integrated customers, their suppliers and Bring exchange order level information across the life cycle of customers' orders. Suppliers can use the API to fetch order details, and to create packaging lists with transport details. Bring collects, structures and enriches the order information with transport and event details, and makes it available to the customer.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON over HTTP. This API doesn't support JSON for all methods yet. Look in the example section to see which are supported.

documentation:
  - title: Error handling
    content: |
      When using the Order Management, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use timeouts and other error handling techniques when making requests to the service.

      How you handle errors depends on the nature of your application, but one strategy for handling such situations is by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).

oas: https://www.qa.mybring.com/po/v2/api-docs
---
