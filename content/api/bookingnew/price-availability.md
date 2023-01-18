---
title: Checking prices and availability
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingpriceavailability
    title: Checking prices and availability
    parent: bookingnew
weight: 5
hidden: true
---

Booking uses Shipping Guide as the source for price and availability for the different services. We advise clients of the Booking API to use [Shipping Guide API](/api/shipping-guide_2/) for getting the list price and checking availability before sending a booking request. Note that invoice payment is the only available payment option for the Booking API. This means that the Mybring user ID used in the booking request must have access to the customer number specified as payer of the booking.
