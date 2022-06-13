---
title: Order Management API (SOAP)
layout: api
disqus_identifier: https-developer-bring-com-api-order-management-soap
menu:
  apidocs:
    identifier: ordermanagement-soap
    title: Order Management API (SOAP)
    url: /api/order-management-soap
    parent: om
weight: 62

introduction: |
  Order Management is a solution that lets integrated customers, their suppliers and Bring exchange order level information across the life cycle of customers’ orders. The Order Management SOAP can be used by customers to send a copy of their purchase and sales orders to the solution. Suppliers can use the SOAP to fetch order details, and to create packaging lists with transport details. Bring collects, structures and enriches the order information with transport and event details, and makes it available to the customer.

information:
  - title: Authentication
    content: |
      To make SOAP requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      SOAP TEXT/XML over HTTP. Look in the example section to see which are supported.

documentation:
  - title: Error handling
    content: |
      When using the Order Management, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use timeouts and other error handling techniques when making requests to the service.

      How you handle errors depends on the nature of your application, but one strategy for handling such situations is by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).

---
