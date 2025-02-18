---
title: Versioning
layout: api-sub
menu:
  apidocs:
    identifier: bookingversioning
    title: Versioning
    parent: booking
weight: 1
---

Each request has a `schemaVersion` element indicating which release of the schema is being used in the request and expected schema format in the response. Important: All clients must accept new (unknown) properties/elements in the response. E.g. unknown properties/elements should be ignored. The client framework used by client must thus not crash when unknown elements are encountered.
