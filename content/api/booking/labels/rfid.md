---
title: RFID labels for Mailbox Parcel (3570)
layout: api-sub
menu:
  apidocs:
    identifier: bookingrfid
    title: RFID labels for Mailbox Parcel (3570)
    parent: booking_labels
weight: 4
---

Mailbox Parcel shipments can optionally be ordered with tracking using RFID.

Normally, we create PDF labels that can be printed on any printer. If you opt for tracking, we create ZPL labels instead. ZPL stands for [Zebra Programming Language (ZPL)](https://en.wikipedia.org/wiki/Zebra_(programming_language)).

When ordering the service 3570, the labels will be ZPL code containing instructions for programming the passive RFID antenna in the printer's labels with package numbers.

In addition to the RFID programming instructions, the ZPL code contains instructions for rendering the rest of the label (addresses, icons, barcode, etc.).

## Special hardware required
RFID-tagged labels require special printer hardware. Currently we support the following printers:

- Zebra R410
- Zebra 500R
