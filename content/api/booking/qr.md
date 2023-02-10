---
title: Generating QR Codes
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingqr
    title: Generating QR Codes
    parent: booking
weight: 8
---

For Parcel Norway domestic return services, it is possible to request QR codes. An end user can bring the QR code to any PiB or a Post Office in Norway, scan the QR code, and have a label printed there.

To book, add the element `generateQrCodes` at the consignment level and set it to true. The response will contain one qrCodeLink per package. This is a URL to a PNG image of the QR code.

The following services support QR codes:

- 9300
- SERVICEPAKKE_RETURSERVICE
- 9600
- EKSPRESS09_RETURSERVICE
- 9000
- BPAKKE_DOR-DOR_RETURSERVICE
- 0341
- 0343
