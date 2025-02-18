---
title: QuickPack Envelope for Express International
layout: api-sub
menu:
  apidocs:
    identifier: bookingquickpack
    title: QuickPack Envelope for Express International
    parent: booking
weight: 12
---

The `quickPackEnvelope` element/attribute is of type boolean, and can be set for services that allow quickpack envelope shipment. We recommend using the weight and measurements shown in the example, for correct mapping.

## Request example

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
