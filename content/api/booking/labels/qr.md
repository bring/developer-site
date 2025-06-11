---
title: Generating QR and Label-Free Codes for Parcel Returns (Norway)
layout: api-sub
menu:
  apidocs:
    identifier: bookingqr
    title: Generating QR codes (Norway)
    parent: booking_labels
weight: 3
---

## QR Code Generation

For parcels returns in/from Norway, you can request QR codes. An end user simply presents the QR code at any PiB or Post Office in Norway where the code is scanned to print a shipping label.

To enable QR code generation, add the element `generateQrCodes` at the consignment level and set it to `true`.
The API response will include one `qrCodeLink` per package—a URL to a PNG image of the QR code.
- **Supported Services:**
  - 9000
  - 9300
  - 9350
  - 9600
  - 0331
  - 0333
  - 0341
  - 0343

**Note:** The sender’s email address is required in the booking request to receive the QR code.

## Label-Free Codes

Label-Free codes are gradually being rolled out for select parcel return services. When you request QR codes for the following services, you will also receive a Label-Free code:

- **Supported Services:**
  - 9300
  - 9350
  - 0341
  - 0343

A unique code in the format `BRING-1234-5678` will be generated and returned as part of the API response.
After the booking is completed, the code is sent by email to both the sender and recipient (provided that both email addresses are included in the request).
The Label-Free code should be clearly written on the parcel before it is handed in. The parcel can then be returned via a parcel locker.

<details>
<summary>Rollout Steps</summary>

**Step One: April-May (Region Øst)**
- Stokke
- Drammen
- Kristiansand

**Step Two: May-Jun (Region Vest)**
- Stavanger
- Haugesund
- Bergen
- Førde

**Step Three: Aug-Sep (Region Midt+Nord)**
- Trondheim / Bodø
- Ålesund / Tromsø
- Molde / Harstad
- Mo I Rana / Alta

**Step Four: Sep-Oct (Region OAØ)**
- LSO
- ØT
- Fredrikstad
- Hamar

</details>
