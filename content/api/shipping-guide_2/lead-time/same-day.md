---
title: Same day delivery
menu:
  apidocs:
    identifier: sgsortingareas
    title: Same day delivery
    parent: sgleadtime
weight: 5
---

### Sorting area for Same day delivery (2012)
The Same day delivery VAS (2012) allows shipments to be delivered same- or next-day, depending on when the shipment is booked. By default, SG API returns the full service coverage area for Same day delivery. The "sortingAreas" parameter allows the web shop to reduce the delivery area to the area they currently choose to provide the service."routeInformation" contains information about the sorting area for a specific parcel. Intended use is to aid pre-sorting of same day parcels.

#### Area Code
| Area name        | Area code | 
|:-----------------|:------------|
| `Oslo CS 12` | `100` |
| `Fredrikstad H2` | `160` |
| `Drammen H2` | `300` |
| `Stokke H2` | `320` |
| `Stavanger H2` | `400` |
| `Kristiansand H2` | `460` |
| `Bergen H2`| `500`|
| `Trondheim` | `700` |


####  VAS - 2012
```json
 {
  "id": "2012",
  "leadTimeFromCustomerInMinutes": 30,
  "SortingAreas": ["100","400","500","600"]
 }        
``` 

### Shipping date and Same day delivery (2012)

The provided shipping date does **not** affect the calculation of Same day delivery (2012) availability. In stead the 
Same day delivery VAS is configured with the `leadTimeFromCustomerInMinutes` attribute containing the number of minutes 
it will take the customer to prepare the package for shipment. This number is in turn used to calculate if delivery
is possible today or tomorrow.

**NOTE**: A shipping date should still be provided as it will be used for calculating the alternate home delivery dates.
You should add internal lead-time to the shipping date used in the request by providing a date and time when the shipment
will be sent to Bring to ensure that the customer does not choose a date that is impossible to deliver at.
