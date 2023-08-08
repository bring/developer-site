---
title: Price
layout: api-sub
menu:
  apidocs:
    identifier: sgprice
    title: Price
    parent: shippingguide_2
weight: 2
---

## Volume, weight, dimensions and loading meter
Shipping Guide use measurement of the package to calculate price of the
Shipment. Shipping Guide accept measurements in ```Volume```,
```Weight``` and ```Dimensions(Length, Width and Height)```.
Either ```Volume``` or ```Weight``` or
```Dimensions``` must be present in the request. It is recommended to
request Shipping Guide with accurate measurements to get most precise price.
Apart from these measurements, ```Loading meter``` is a kind of
measurement which can be sent in the request for CARGO services to get more
precise price information.
