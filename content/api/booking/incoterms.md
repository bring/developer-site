---
title: Incoterms for Cargo International
layout: api-sub
menu:
  apidocs:
    identifier: bookingincoterms
    title: Incoterms for Cargo International
    parent: booking
weight: 11
---

The `incotermRule` element/attribute can be set for Cargo International service. This is a mandatory element while creating an order for Cargo International. API request will return error code `BOOK-INPUT-065` in case no `incotermRule` is provided in the request. This element allows either of the following values: `DDP`, `DAP`, `FCA` and `EXW`.

## Request example

```json
"product": {
  "id": "CARGO_INTERNATIONAL",
  "incotermRule": "DDP"
}
```
