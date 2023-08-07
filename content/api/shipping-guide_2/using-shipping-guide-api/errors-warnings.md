---
title: Error and warning handling
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgwarnings
    title: Error and warning handling
    parent: sgusing
weight: 4
---

### Errors
Errors should be handled gracefully. Your users should still be able to order even if the Shipping Guide API returns an error or if there is an error establishing a connection to the API.

The Shipping Guide API return two levels of error information:

* HTTP error codes(We follow general convention of HTTP status codes.)
* An error object in the response that is on service level

When we are not able to process one of the service requested, we will respond with a error on service level.

#### No applicable services found

When no services are applicable for the request you've made, an empty
resultset is returned. Reasons can be that the shipment was too large or too
small, or the requested shipment was outside the coverage area of the
requested services. Your code should handle these cases, i.e. an empty
result, and should not fail because of this.

To fix this, you could e.g. use a Cargo product for large shipments, or you could request other services and see which ones that
fit your need and find your service by using [What would you like to send?](https://www.bring.no/english/sending)

#### Additional service XXX is not applicable for product YYY

If a requested additional service is not supported on requested product, API
will just ignore that additional service for price calculation and return
info as a trace message. Supported list of value added services on services
can be found in the section [Value added Services](/api/services/#additional-services).

### Warnings

Ideally, clients should not parse warning codes for any logic as they
are bound to change and supposed to be treated as informational data.
Warnings are sent out when Shipping Guide is able to validate the
request but missed some part of response, for example price or lead time, due
to unavailability of external systems.

Warning codes are documented
in [xsd](https://api.bring.com/shippingguide/api/ws/shipping-guide-20.xsd)
as well.
