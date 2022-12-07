---
title: Making labels
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingmakinglabels
    title: Making labels
    parent: bookingnew
weight: 5
hidden: true
---

The Booking API generates and sends all necessary EDI messages to carry out the shipment. A URL to a PDF label is returned in responses. This label must be printed and be attached to the shipment. A URL that points to tracking information is also returned.

A GET request to the label URL will result in a HTTP 302 redirect to the concrete storage facility (e.g. redirect to Amazon S3). Ensure that your client follows these redirects.
