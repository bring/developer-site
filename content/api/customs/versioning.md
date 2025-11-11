---
title: Versioning
layout: api-sub
menu:
  apidocs:
    identifier: customs_versioning
    title: Versioning
    parent: customs
weight: 1
---

The main version is part of the path of the endpoint. Important: All clients must accept new (unknown) elements in the response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash when unknown elements are encountered.
