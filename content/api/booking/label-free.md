---
title: Label free codes
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookinglabelfree
    title: Label free codes
    parent: booking
weight: 6
---

Label free provides the ability to send parcels without a label, and is useful for senders who do not have access to a printer. The label free code, as well as the recipient’s name and address, is written on the parcel before it is handed in.

A unique code in the format `BRING-1234-5678` is returned as part of the API response, and is sent to the sender by e-mail after the booking is completed. 
The label free code, as well as the recipient's name and address, is written on the parcel before it is handed in.

The API response will contain one label free code per package. Order of packages and the corresponding label free codes in the booking response will resemble order of packages in the API request.

See [Service portfolio](https://developer.bring.com/api/services/#label-free) for how to request this Value Added Service and when it can be ordered.
