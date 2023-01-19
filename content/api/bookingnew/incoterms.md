---
title: Incoterms
layout: api
notanapi: true
menu:
  apidocs:
    identifier: bookingincoterms
    title: Incoterms
    parent: bookingnew
weight: 11
hidden: true
---

The `incotermRule` element/attribute can be set for Cargo International service. This is a mandatory element while creating an order for Cargo International. API request will return error code `BOOK-INPUT-065` in case no `incotermRule` is provided in the request. This element allows either of the following values: `DDP`, `DAP`, `FCA` and `EXW`.

## Request example

#### XML
```xml
<product>
  <id>CARGO_INTERNATIONAL</id>
  <incotermRule>DDP</incotermRule>
</product>
```

#### JSON
```json
"product": {
  "id": "CARGO_INTERNATIONAL",
  "incotermRule": "DDP"
}
```
