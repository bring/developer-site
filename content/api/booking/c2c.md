---
title: C2C platform parcels services
layout: api-sub
menu:
  apidocs:
    identifier: booking_c2c
    title: C2C platform parcels services
    parent: booking
weight: 9
---

## Bring Pack (0360) returns

### Bring Pack passive returns

A passive return happens when:

* The parcel is not picked up by the recipient.
* The sender stops the shipment before the recipient has received it.

The address for passive returns can be specified by the `returnTo` party element of the request.

If no `returnTo` party is provided, the default pickup point for the `sender` party will be used.

### Bring Pack passive return addresses for active returns

An active return happens when the original parcel is picked up, but the recipient wants to return it and a new shipment should be ordered for the return.

When ordering an active return shipment, the `returnTo` party should be set to a Bring address. This is necessary to ensure that if the return is not collected, triggering a passive return of the active return, it is not sent a second time to the original recipient.

The Bring addresses to set as the `returnTo` must be set based on country as described below.

#### Sweden and Finland 

<p lang="se" translate="no">
Bring Special Handling<br>
Södra Stigamovägen 9A<br>
556 50 Jönköping
</p>

#### Denmark

<p lang="dk" translate="no">
Bring<br>
Ventrupparken 4<br>
2670 Greve<br>
</p>

#### Norway

<p lang="no" translate="no">
LSO ubesørgelige pakker ROAØ<br>
Alfasetvn. 24<br>
0024 Oslo
</p>





