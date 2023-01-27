---
title: QuickPack Envelope for Express International
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingquickpack
    title: QuickPack Envelope for Express International
    parent: bookingnew
weight: 12
hidden: true
---

The `quickPackEnvelope` element/attribute is of type boolean, and can be set for services that allow quickpack envelope shipment. We recommend using the weight and measurements shown in the example, for correct mapping.

## Request example

#### XML
```xml
<product>
  <id>EXPRESS_INTERNATIONAL</id>
  <services>
    <quickPackEnvelope>true</quickPackEnvelope>
  </services>
</product>
<packages>
  <package>
    <weightInKg>1.0</weightInKg>
    <dimensions>
      <heightInCm>2</heightInCm>
      <widthInCm>35</widthInCm>
      <lengthInCm>24</lengthInCm>
    </dimensions>
  </package>
</packages>
```

#### JSON
```json
"product": {
  "id": "EXPRESS_INTERNATIONAL",
  "services": {
    "quickPackEnvelope": true
  }
},
"packages": [
  {
    "weightInKg": 1,
    "dimensions": {
      "heightInCm": 2,
      "widthInCm": 35,
      "lengthInCm": 24
    }
  }
]
```
