---
title: Versioning
layout: api-sub
menu:
  apidocs:
    identifier: pupversioning
    title: Versioning
    parent: pickuppoint
weight: 2
---
The Pickup Point API makes an effort to always be backwards compatible regarding data format for requests and responses.

**Important**: All clients must accept **new (unknown) elements** in the response. E.g. unknown elements should be ignored. Also, **new error codes** could be added as well. The client framework used by client must not crash when **unknown elements or new code values** are encountered.

