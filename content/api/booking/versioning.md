---
title: Versioning
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingversioning
    title: Versioning
    parent: booking
weight: 1
---

Each request has a `schemaVersion` element indicating which release of the schema is being used in the request and expected schema format in the response. Important: All clients must accept new (unknown) elements in the response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash when unknown elements are encountered.
