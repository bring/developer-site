---
title: Order Management API
layout: api
menu:
  apidocs:
    identifier: ordermanagement
    title: Order Management API
    url: /api/order-management
    parent: om
weight: 61
aliases:
  - ../order-management/
params:
  disqus_identifier: https-developer-bring-com-api-order-management
  oas: https://www.qa.mybring.com/po/v2/api-docs

  introduction: |
    Order Management is a solution that lets integrated customers, their suppliers and Bring exchange order level information across the life cycle of customers' orders. Suppliers can use the API to fetch order details, and to create packaging lists with transport details. Bring collects, structures and enriches the order information with transport and event details, and makes it available to the customer.

  information:
    - title: Authentication
      content: |
        To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).

    - title: Formats
      content: |
        REST XML/JSON over HTTP and SOAP TEXT/XML over HTTP. This API doesn't support JSON for all methods yet. Look in the example section to see which are supported.

  documentation:
    - title: Error handling
      content: |
        When using the Order Management, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use timeouts and other error handling techniques when making requests to the service.

        How you handle errors depends on the nature of your application, but one strategy for handling such situations is by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).
---
