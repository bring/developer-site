---
title: Measurements for Cargo and Home Delivery services
layout: api-sub
menu:
  apidocs:
    identifier: bookingmeasurements
    title: Measurements for Cargo and Home Delivery services
    parent: booking
weight: 4
---

For cargo services (5100, 5300, 9100), Weight is mandatory and one of the Volume / Load Meters / Dimensions / Number of Pallets is mandatory.

For home delivery services (e.g. DOUBLE_INDOOR, CURBSIDE), Weight is mandatory and one of Volume / Dimensions are mandatory.

## Request example

### Cargo Norway - Number of Pallets & Load Meters

```json
"product": {
  "id": "5100"
},
"packages": [
  {
    "weightInKg": 50,
    "volumeInDm3": 20,
    "numberOfPallets": 2,
    "loadMeters": 1
  }
]
```
