---
title: Label free codes (Sweden & Denmark)
layout: api-sub
menu:
  apidocs:
    identifier: bookinglabelfree
    title: Label free codes
    parent: booking_labels
weight: 2
---

Label free provides the ability to send parcels without a label, and is useful for senders who do not have access to a printer.

In Sweden & Denmark, with Label free one can send and return packages without a label at our pickup and drop off points.

Label free solution for Sweden & Denmark contains two elements.



### 1. Label Free code

With Label free, a unique code in the format `BRING-1234-5678` is returned as part of the API response, and is sent to the sender by e-mail after the booking is completed.

The label free code, as well as the recipient's name and address, is written on the parcel before it is handed in.

### 2. QR-code

Available as a supplement with Label free, a `QR-code` is also generated.
This QR-code can be scanned by the staff at pickup and drop-off point to print a label which is then attached to the parcel.


#
To get the label free code and QR-code for your booking, your booking request needs to contain Value Added Service(VAS) `1288` and `generateQrCodes`.

The API response will contain one label free code/ QR-code per package. Order of packages and the corresponding label free codes/ QR-codes in the booking response will resemble order of packages in the API request.



See [Service portfolio](https://developer.bring.com/api/services/#label-free) for how to request this VAS/ QR-Code and when it can be ordered.
