---
title: Delivery to parcel locker
layout: api-sub
menu:
  apidocs:
    identifier: booking_delivery_to_parcel_locker
    title: Delivery to parcel locker
    parent: booking
weight: 10
---

### B2C: Pakke til hentested(5800), 0340(PickUp Parcel), 0342(Pickup Parcel Bulk), 5801(Pakkeboks), and Parcel Locker(0344).
### B2B: Business parcel(5000)
### C2C: Norgespakke(3067) and Bring Pack(0360)
### Return Services: Return business parcel(9000) and Return parcel to business(9350)

Parcels that are sent to locker but are too big for it (over 60 * 50 * 44 cm), will be rerouted to a manned pickup point, with a notification to the recipient.

When this happens for Parcel locker services, customer will be charged an additional fee.

Allowed max dimensions will be (60 x 50 x 44 cm) across SE, DK, and NO.

