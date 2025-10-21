---
title: VOEC (VAT on E-commerce)
layout: api-sub
menu:
  apidocs:
    identifier: voec
    title: VOEC (VAT on E-commerce)
    parent: booking_customs
weight: 1
---

VOEC can be declared on the following services 

When sent to Norway from abroad

- Pickup Parcel (0340)
- Pickup Parcel Bulk (0342)
- Home Delivery Parcel (0349)

When sent to Norway from Norway

- Home mailbox parcel (3584)

A setup with Bring is required for this. Note that VOEC is supported only when Bring is transporting cross border to Norway. A shipment list needs to be created based on VOEC data that is transmitted. If you have any questions about the list please get in touch with edi@bring.com. See [here](/files/booking/Shipment_packagelist_VOEC.xlsx) for an example of such a list.

By using the `voec` element of `customsInformation`, one can specify a VOEC number for imports to Norway. This is only allowed when `natureOfCargo` is of type `SALE_OF_GOODS`. Note that a `consolidatedShipmentId` will have to be specified for grouping shipments.
See example [here](https://developer.bring.com/api/booking#make-a-booking-post) and more info about VOEC [here](https://www.bring.no/en/services/customs/voec-vat-on-e-commerce).
