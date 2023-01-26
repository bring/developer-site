---
title: Measurements
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingmeasurements
    title: Measurements
    parent: bookingnew
weight: 4
hidden: true
---

For cargo services (5100, 5300, CARGO, 9100), Weight is mandatory and one of the Volume / Load Meters / Dimensions / Number of Pallets is mandatory.

For home delivery services (DOUBLE_INDOOR, CURBSIDE, DOUBLE_INDOOR_EVENING, CURBSIDE_EVENING), Weight is mandatory and one of Volume / Dimensions are mandatory.

## Request example

### Cargo Norway - Number of Pallets & Load Meters

#### XML
```xml
<product>
  <id>5100</id>
</product>
<packages>
  <package>
    <weightInKg>50</weightInKg>
    <volumeInDm3>20</volumeInDm3>
    <numberOfPallets>2</numberOfPallets>
    <loadMeters>1</loadMeters>
  </package>
</packages>
```

#### JSON
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