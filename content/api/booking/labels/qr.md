---
title: Generating QR and Label-Free Codes
layout: api-sub
menu:
  apidocs:
    identifier: bookingqr
    title: Generating QR and Label-Free Codes
    parent: booking_labels
weight: 3
---

Both QR codes and label‑free codes are used to simplify parcel returns by eliminating the need for printed shipping labels. When you enable QR code generation (by adding the element `generateQrCodes` at the consignment level), the API returns a URL to a PNG image of the QR code. When label-free codes are requested, a unique label‑free code (format: `BRING-1234-5678`) is generated which, if used, must be clearly written on the parcel.

The API response always contains one QR code/label‑free code per package and the order matches that of the API request. These features are supported for Norway, Sweden and Denmark

---

## Sweden & Denmark

Label‑free solution for Sweden and Denmark works as follows:

- To request a label‑free code, include [VAS 1288](https://developer.bring.com/api/services/#label-free) in the booking request.
- The returned label‑free code and the recipient’s name and address are to be written clearly on the parcel.  After the booking is completed, the code is sent to the sender and recipient by e-mail (assuming their respective e-mail addresses are included in the request).
- A QR code can also be requested (by setting `generateQrCodes` to `true`) so that pickup point staff can scan the code to print a label. When requesting a QR code, label-free code will also be generated for the shipment. 
- This solution is applicable only when parcels are handed in at a pickup point (if Bring picks up your parcels, a regular label must be used).
  
See [Service portfolio](https://developer.bring.com/api/services/#label-free) for relevant services.

---

## Norway

In Norway historically we have been supporting only QR codes for label-free dispatch of a shipment. Now Bring is in the process of rolling out label-free code as a complementary label-free solution for dispatch via parcel lockers.

### QR Code Generation

Enable QR codes by adding the element `generateQrCodes` at the consignment level. The API response returns one `qrCodeLink` per package. After the booking is completed, the QR code is sent to the sender and recipient by e-mail (assuming their respective e-mail addresses are included in the request).

**Supported Services:**
- 9000 - Return business parcel
- 9300 - Return from pick-up point
- 9350 - Return parcel to business
- 9600 - Return express
- 0331 - Business Parcel Return
- 0333 - Business Parcel Return Bulk
- 0341 - PickUp Parcel Return
- 0343 - PickUp Parcel Return Bulk

*Note:* The sender’s email address is required in the booking request.

### Label‑Free Codes

Label‑free codes in Norway are automatically generated when requesting QR codes for the following services.
The generated code is returned in the API response and sent by email to both sender and recipient. The code and the recipient’s name and address are to be clearly written on the parcel before it is handed over. Parcels may then be returned via a parcel locker.

**Supported Services:**
- 9300 - Return from pick-up point
- 9350 - Return parcel to business
- 0341 - PickUp Parcel Return
- 0343 - PickUp Parcel Return Bulk


*Rollout Notice:* The label‑free codes solution in Norway is in the process of being rolled out and is currently in **Step Two: West Region**.
### Rollout Steps
- Step One: East Region
- Step Two: West Region
- Step Three: Central and North Region
- Step Four: Oslo, Akershus, and Østfold

