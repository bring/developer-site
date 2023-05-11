---
title: Versioning
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgversioning
    title: Versioning
    parent: shippingguide_2
weight: 2
---
The Shipping Guide makes an effort to always be backwards compatible regarding data format for requests and responses. To achieve this, Versioning is defined as part of endpoint itself.

**Important**: All clients must accept **new (unknown) elements** in the response. E.g. unknown elements should be ignored. Also, **new error codes and warning codes** could be added as well. The client framework used by client must not crash when **unknown elements or new code values** are are encountered.

When incompatible changes in the schema are made (other than addition of new elements), the namespace versioning will be updated accordingly. The new schema is used at the *same endpoint URL* as before for webservices. Old schema versions will be shut down some time in the future, so its recommended always updating to the latest version.
