---
title: Label free codes (Sweden & Denmark)
layout: api-sub
menu:
  apidocs:
    identifier: bookinglabelfree
    title: Label free codes (Sweden & Denmark)
    parent: booking_labels
weight: 2
---

Label free codes enable senders to dispatch and return parcels at any of our pickup and drop-off locations without needing a label. 
This is particularly helpful for those who don't have access to a printer. Please note that the label free code can only be used 
when the parcel is _handed in at a pickup point_. If your parcels are to be picked up by Bring, a regular label must be used.


The label free solution contains two elements.

### 1. Label free code

To get a label free code, [VAS 1288](https://developer.bring.com/api/services/#label-free) must be included in the booking request. 
A unique code in the format `BRING-1234-5678` is returned as part of the API response. 
After the booking is completed, the code and is sent to the sender and recipient by e-mail (assuming their respective e-mail addresses are included in the request).

The label free code, as well as the recipient's name and address, should be written on the parcel before it is handed in. 
The staff at the pickup point will then print the label using the label free code, which is then attached to the parcel. 

### 2. QR code

When ordering a label free code, a QR code should also be requested. Add the element `generateQrCodes` at the consignment level and set it to true. 
The response will contain one QR code per package. This is a URL to a PNG image of the QR code.
The QR code can be scanned by the staff at the pickup point to print a label which is then attached to the parcel.


#
The API response will contain one label free code/QR code per package. 
The order of packages and the corresponding label free codes/QR codes in the booking response will match the order of packages in the API request.

See [Service portfolio](https://developer.bring.com/api/services/#label-free) for relevant services.
