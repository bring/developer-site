---
title: Service not applicable
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgservicenotapplicable
    title: Service not applicable
    parent: shippingguide_2
weight: 13
hidden: true
---
### No applicable services found

When no services are applicable for the requested you've made an empty
resultset is returned. Reasons can be that the shipment was too large or too
small, or the requested shipment was outside the coverage area of the
requested services. Your code should handle these cases, i.e. an empty
result, and should not fail because of this.

How can I fix this? You could e.g. use a Cargo product when you want to send
large shipments, or you could request other services and see which ones that
fits your need and find your service by using [What would you like to send?](https://www.bring.no/english/sending)

### Additional service XXX is not applicable for product YYY

If a requested additional service is not supported on requested product, API
will just ignore that additional service for price calculation and return
info as a trace message. Supported list of value added services on services
can be found in the section [Value added Services](/api/services/#additional-services).
