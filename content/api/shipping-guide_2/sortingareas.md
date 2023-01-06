---
title: Sorting area for Same day delivery (2012)
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgsortingareas
    title: Sorting area for Same day delivery (2012)
    parent: shippingguide_2
weight: 10
hidden: true
---
The Same day delivery VAS (2012) allows shipments to be delivered same- or next-day, depending on when the shipment is booked. By default, SG API returns the full service coverage area for Same day delivery. The "sortingAreas" parameter allows the web shop to reduce the delivery area to the area they currently choose to provide the service."routeInformation" contains information about the sorting area for a specific parcel. Intended use is to aid pre-sorting of same day parcels.

## Area Code
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

### SOAP: VAS - 2012
```xml
<ns:AdditionalServices>
      <ns:AdditionalService>
            <ns:Id>2012</ns:Id>
            <ns:LeadTimeFromCustomerInMinutes>120</ns:LeadTimeFromCustomerInMinutes>
             <ns:SortingAreas>
                  <ns:Area>100</ns:Area>
                  <ns:Area>300</ns:Area>
                  <ns:Area>500</ns:Area>
                  <ns:Area>600</ns:Area>
             </ns:SortingAreas>
      </ns:AdditionalService>
</ns:AdditionalServices>
```

### REST POST:  VAS - 2012
```json
 {
  "id": "2012",
  "leadTimeFromCustomerInMinutes": 30,
  "SortingAreas": ["100","400","500","600"]
 }        
``` 
