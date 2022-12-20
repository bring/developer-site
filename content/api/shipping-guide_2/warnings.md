---
title: Should I handle warnings?
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgwarnings
    title: Should I handle warnings?
    parent: shippingguide_2
weight: 14
hidden: true
---
Ideally clients should not parse these warning codes for any logic as they
are bound to change. These are supposed to be treated as informational data.
Warnings are sent out when Shipping guide is able to validate the
request but missed some part of response for example Price or lead time due
to unavailability of external systems. Ideally clients should not parse
these warning codes for any logic as they are bound to change. These are
supposed to be treated as informational data. Warning codes are documented
in [xsd](https://api.bring.com/shippingguide/api/ws/shipping-guide-20.xsd)
as well.
