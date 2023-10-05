---
title: Generating QR Codes
layout: api-sub
menu:
  apidocs:
    identifier: bookingqr
    title: Generating QR Codes
    parent: booking_labels
weight: 3
---

For Parcel Norway domestic return services, it is possible to request QR codes. An end user can bring the QR code to any PiB or a Post Office in Norway, scan the QR code, and have a label printed there.

To book, add the element `generateQrCodes` at the consignment level and set it to true. The response will contain one qrCodeLink per package. This is a URL to a PNG image of the QR code.

The following services support QR codes:

- 9600
- 9350
- 9300
- 9000
- 0341
- 0343

If a confirmation email to sender is wanted (that includes the requested QR code), add sender's e-mail address in the booking request.
