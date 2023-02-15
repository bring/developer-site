---
title: Shipping date and Same day delivery (2012)
layout: api
notanapi: true
menu:
  apidocs:
    identifier: shippingdateandexpress
    title: Shipping date and Same day delivery (2012)
    parent: shippingguide_2
weight: 15
---
The provided shipping date does **not** affect the calculation of Same day delivery (2012) availability. In stead the 
Same day delivery VAS is configured with the `leadTimeFromCustomerInMinutes` attribute containing the number of minutes 
it will take the customer to prepare the package for shipment. This number is in turn used to calculate if delivery
is possible today or tomorrow.

**NOTE**: A shipping date should still be provided as it will be used for calculating the alternate home delivery dates.
You should add internal lead-time to the shipping date used in the request by providing a date and time when the shipment
will be sent to Bring to ensure that the customer does not choose a date that is impossible to deliver at.
