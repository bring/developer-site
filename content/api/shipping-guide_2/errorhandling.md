---
title: Error handling
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgerrorhandling
    title: Error handling
    parent: shippingguide_2
weight: 4
---
When using the Shipping Guide it is important to handle errors gracefully. Your users should still be able to order even if the Shipping Guide API returns an error or if there is an error establishing a connection to the API.

The Shipping Guide API return two levels of error information:

* HTTP error codes(We follow general convention of HTTP status codes.)


* An error object in the response that is on service level

When we are not able to process one of the service requested, we will respond with a error on service level.
