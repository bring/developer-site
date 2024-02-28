---
title: Shipping Guide API
layout: api
disqus_identifier: https-developer-bring-com-api-shipping-guide-2
menu:
  apidocs:
    identifier: shippingguide_2
    title: Shipping Guide API
    url: /api/shipping-guide_2
    parent: checkout
weight: 11
aliases:
  - shipping-guide
  - shippingguideapi.html

important:
  - type: warn
    title: SOAP endpoint deprecated
    message: |
      The SOAP endpoint is now deprecated. Going forward the API will only support `application/json` and `application/xml` as Content-Type. 
      
      If you are currently relying on the SOAP endpoint of Shipping Guide API, please migrate to the [JSON/XML over HTTP based endpoints](/api/shipping-guide_2/#fetch-shipping-details-post). 

      We will start rate limiting requests to the SOAP endpoint from **1 September 2024**, with gradually reduced request rate until **1 October**. This means that you will risk rejected requests because of rate limiting after **1 September**.

introduction: |
  The Shipping Guide API provides available services for a given combination of sender and recipient locations, including estimated delivery times, prices and environmental data. It also returns logo and human readable service descriptions that can be shown in your checkout. Available services are based on your agreement with Bring (i.e. the customer numbers attached to your user).

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).

  - title: Rate limiting
    content: |
      Clients exceeding 120 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      Both XML and JSON over HTTP. The GET request only supports single consignments, while the POST requests can be used for multiple consignments.

subpages:
  title: Special topics

guides:
- title: The importance of provided shipping date
  content: | 
    Providing the **actual shipping date** in the request is a prerequisite for getting the correct lead times, as the lead time is always calculated from the day and time when the parcel **arrives** at a Bring terminal. It is recommended to read [this guide](/api/e-commerce-solutions/best-practice-checkout/implement-estimated-delivery/) for a better understanding of how the provided shipping date affects the returned lead time. 
    
    **NOTE**: In absence of a shipping date set by the user, the Shipping Guide API will default to `now`. If shipping date is set to `now`, lead times will be calculated on the assumption that the packages has just arrived at a terminal.

oas: https://api.bring.com/shippingguide/api-docs
---
