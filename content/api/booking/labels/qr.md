---
title: Generating QR codes (Norway)
layout: api-sub
menu:
  apidocs:
    identifier: bookingqr
    title: Generating QR codes (Norway)
    parent: booking_labels
weight: 3
---

For Parcel Norway domestic return services, it is possible to request QR codes. An end user can bring the QR code to any PiB or Post Office in Norway, scan the QR code, and have a label printed there.

To book, add the element `generateQrCodes` at the consignment level and set it to true. The response will contain one qrCodeLink per package. This is a URL to a PNG image of the QR code.

The following services support QR codes:

- 9000
- 9300
- 9350
- 9600
- 0331
- 0333
- 0341
- 0343

Sender's email address is required in the booking request to receive the requested QR code.
