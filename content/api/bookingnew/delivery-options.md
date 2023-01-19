---
title: Delivery options
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingdeliveryoptions
    title: Delivery options
    parent: bookingnew
weight: 5
hidden: true
---

If a sender wants their package delivered to the door, and it cannot be delivered (i.e. Business closed or recipient is not present), then you can now choose what will happen with your package.

This is controlled by the `deliveryOption` element/attribute.

If you want Bring to attempt delivery only once and/or deliver package to nearest PiB, then you must tell us by setting this option. These options cost extra money but the customer/sender will only be charged if the event happens.

Example:

You send a package to a business with the `deliveryOption=TWO_DELIVERIES_THEN_RETURN`

- If Bring manages to deliver the package to the recipient on first try, then no extra charge is made.
- If first attempt to deliver fails, then Bring will do a second attempt. The customer/sender will be charged extra.
- If the second attempt also fails, then the package will be returned. The customer/sender will be charged extra.

Possible options:

- `ONE_DELIVERY_THEN_PIB`
- `TWO_DELIVERIES_THEN_PIB`
- `TWO_DELIVERIES_THEN_RETURN`
