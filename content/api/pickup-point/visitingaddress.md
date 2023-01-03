---
title: Postbox and visiting address
layout: api
notanapi: true
menu:
  apidocs:
    identifier: visitingaddress
    title: Postbox and visiting address
    parent: pickuppoint
weight: 4
hidden: true
---
There are two sets of addresses in the response, postbox (`address` and `postalCode`) and visiting address (`visitingAddress` and `visitingPostalCode`). Postbox address is required to get a package produced correctly, use this AS RECIPIENT address on label. Visiting address is more appropriate for user interface (Street address of the PIB).

