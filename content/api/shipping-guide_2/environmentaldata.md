---
title: Shipment environmental data
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgvenvironmentaldata
    title: Shipment environmental data
    parent: shippingguide_2
weight: 5
hidden: true
---
For the following Norwegian domestic and Nordic parcel services it is now possible to get data on whether fossil free (electric and/or bio) transportation is used during last mile transport leg of shipment:

* Pakke i postkassen med RFID (3570)
* Pakke i postkassen (3584)
* Pakke levert hjem (5600)
* På døren (PA_DOREN)
* Pakke til bedrift (5000)
* Bedriftspakke (BPAKKE_DOR-DOR)
* Business Parcel (0330)
* Business Parcel Bulk (0332)
* Pickup Parcel (0340)
* Pickup Parcel Bulk (0342)
* Home Delivery Parcel (0349)


To get the environmental data, use the following new fields:
* SOAP: WithEnvironmentalData
```xml
<WithEnvironmentalData>true</WithEnvironmentalData>
```
* REST POST: withEnvironmentalData
```json
 "withEnvironmentalData": true
```

The data returned contains a list of transport legs (FIRST_MILE, LINE_HAUL and LAST_MILE), and whether the leg is carried out with fossil free transportation. If environmental data is requested for a non-supported service, or no data is  currently available (temporary error) a **NO_ENVIRONMENTAL_DATA** warning is returned.
```xml
<ns2:EnvironmentalData>
      <ns2:TransportLeg>
          <ns2:TransportLegType>LAST_MILE</ns2:TransportLegType>               
          <ns2:FossilFree>true</ns2:FossilFree>
          <ns2:Description>Pakken leveres fossilfritt til din adresse</ns2:Description>
          <ns2:Details>
              <ns2:Electric>0.6</ns2:Electric>
              <ns2:Bio>0.4</ns2:Bio>
          </ns2:Details>
      </ns2:TransportLeg>
</ns2:EnvironmentalData>
```  
If the transport leg is carried out by electric vehicle, `electric` will contain the percentage share of electric vehicle usage where `1.0 == 100%`. If transport leg is carried out with a mix of bio-diesel and electric vehicles, `fossilFree` will still be `true` if percentages sums up to `1.0`. `electric` and `bio` will contain the usage percentage share of corresponding vehicles.

The API currently only supports environmental data for the `LAST_MILE` leg.

**NOTE**: the API returns values based on what is, in a normal situation, expected for the postal code in question. In case of car maintenance or other extraordinaty situations, we can not guarantee a fossil free delivery.

Environmental logo is also returned in the GuiInformation  for mentioned services when also including ```<WithGuiInformation>true</WithGuiInformation>``` in the request
```xml
<ns2:GuiInformation>
     <ns2:EnvironmentalLogoUrl>https://www.mybring.com/shipping-guide/assets/img/Environment_logo.svg</ns2:EnvironmentalLogoUrl>
</ns2:GuiInformation>
```
