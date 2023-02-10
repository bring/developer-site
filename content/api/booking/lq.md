---
title: LQ - Limited quantities (of dangerous goods)
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookinglq
    title: LQ - Limited quantities (of dangerous goods)
    parent: booking
weight: 10
---

When booking Nordic parcel services it is possible to specify that a shipment contains limited quantities of dangerous goods, by adding the `0003` additional service.
The LQ gross weight is optional unless the shipment is transported by boat, as specified in the table below:

| From | To |
| ---- | -- |
| ALL except FI | FI, FO, GL, IS, AX |
| FI | SE, DK, NO, FO, GL, IS, AX |

In such cases the gross weight of Limited quantities must be provided. The document Multimodal Dangerous Goods Form must also be completed correctly and sent to Bring’s booking department before transportation begins.

The following rules apply:
- The document Multimodal Dangerous Goods Form must also be completed correctly and sent to Bring’s booking department before transportation begins
- For shipments with LQ transported by boat (see table above), it is mandatory to specify the LQ gross weight and a dangerous goods declaration must be attached physically to the parcel/pallet.
- For shipments with LQ to NO, DK or FI, it's not allowed to send shipments with LQ to islands without bridge connections.
- For shipments with LQ to SE: except from Gotland, it's not allowed to send shipments with LQ to islands without bridge connections. For such shipments to Gotland, it is always mandatory to specify the LQ gross weight in grams.
