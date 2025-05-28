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
A passive return happens either when the parcel is not picked up by the recipient or is stopped and the sender requests it to be returned.
The address used for passive returns can be specified by the `returnTo` party element of the request.

For Bring Pack, if nothing is specified, the return address is set to the default pickup point for the original sender by default.

### Bring pack passive return addresses for active returns
An active return means that the original parcel is picked up, but the recipient wants to return it.
In this case, a new outbound request is required, and the passive return should be set to a Bring address in the respective country, again using the `returnTo` party element.

The Bring addresses to be used for this are listed below.

**Sweden and Finland**
```
Bring Special Handling
Södra Stigamovägen 9A
556 50 Jönköping
```

**Denmark**
```
Bring
Ventrupparken 4
2670 Greve
```

**Norway**
```
LSO ubesørgelige pakker ROAØ
Alfasetvn. 24
0024 Oslo
```





