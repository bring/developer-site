---
title: Generating QR and Label Free Codes for Parcel Returns (Norway)
layout: api-sub
menu:
  apidocs:
    identifier: bookingqr
    title: Generating QR and Label Free Codes for Parcel Returns (Norway)
    parent: booking_labels
weight: 3
---

Our label free solutions in Norway allow senders to return parcels at a pickup point or a parcel locker without needing a printed label.

## QR Code Generation

For parcels returns in/from Norway, you can request QR codes. An end user simply presents the QR code at any PiB or Post Office in Norway where the code is scanned to print a shipping label.

To enable QR code generation, add the element `generateQrCodes` at the consignment level and set it to `true`.
The API response will include one `qrCodeLink` per package—a URL to a PNG image of the QR code.
- **Supported Services:**
  - 9000 (Return business parcel)
  - 9300 (Return from pick-up point)
  - 9350 (Return parcel to business)
  - 9600 (Return express)
  - 0331 (Business Parcel Return)
  - 0333 (Business Parcel Return Bulk)
  - 0341 (PickUp Parcel Return)
  - 0343 (PickUp Parcel Return Bulk)

**Note:** The sender’s email address is required in the booking request to receive the QR code.

## Label-Free Codes

Label free codes are gradually being rolled out for select parcel return services (see dropdown below for detailed description of the rollout stages). No additional action is needed for requesting label free codes in Norway if you are already requesting QR codes. When you request QR codes for the following services, you will also receive a label free code.

- **Supported Services:**
  - 9300 (Return from pick-up point)
  - 9350 (Return parcel to business)
  - 0341 (PickUp Parcel Return)
  - 0343 (PickUp Parcel Return Bulk)

A unique code in the format `BRING-1234-5678` will be generated and returned as part of the API response.
After the booking is completed, the code is also sent by email to both the sender and recipient (provided that both email addresses are included in the request).

**When using label free code** 
<br>
The label free code should be clearly written on the parcel before it is handed in. The parcel can then be returned via a parcel locker (for unmanned pickup points) or a PiB (manned pickup points). 

You can specify the pickup point in the booking request using the `pickupPoint` element at the parties level in the request. Pickup points ids can be found through the [Pickup Point API](https://developer.bring.com/api/pickup-point/). You can filter on [pickup point types](https://developer.bring.com/api/pickup-point/#pickup-point-types) to ensure end customers can return parcels at nearest parcel locker. Use [max parcel dimension](https://developer.bring.com/api/pickup-point/#tips-and-guides) to filter out pickup points based on parcel size on the client side, and thus preventing failed bookings during checkout. 

For information on the rollout of label free codes, see the details in the dropdown below. 
<br>
We are currently on **Step One: April-May (Region Øst)** in the rollout. 
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
