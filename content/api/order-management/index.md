---
title: Order Management API
layout: api
disqus_identifier: https-developer-bring-com-api-order-management
menu:
  apidocs:
    identifier: ordermanagement
    title: Order Management API
    url: /api/order-management
    parent: om
weight: 61

documentation:
  - title: Introduction
    content: |
      Order management is an application that serves customers from different business areas to create, track and extract report on order (e.g. Purchase order, Sales order) level.
      As a customer of Bring, one gets complete overview of status on order level throughout the lifecycle of an order. This can certainly help in achieving better planning and control at customer's end.

      A typical usage pattern is that a customer creates order and lets all of its suppliers get the order and order details from Order Management. The suppliers will first check whether a customer is a Order Management customer before creating a packing list with transport information. All events and status changes will go back to the order owner.

      This is a step-by-step guide on how to use the API.

      Order Management has rest interfaces (XML/JSON). Choose the option that fits your needs best (see table below).

      Please note that this API currently doesn't support json on all of its methods yet. Look in the example section to see which are supported.

  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Error handling
    content: |
      When using the Order Management, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use timeouts and other error handling techniques when making requests to the service.

      How you handle errors depends on the nature of your application, but one strategy for handling such situations is by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).

      See [the list of error codes](#list-error-codes) for hints on how to implement error handling.
---
