---
title: Estimated arrival time for domestic parcels and cargo
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgeta
    title: Estimated arrival time for domestic parcels and cargo
    parent: sgleadtime
weight: 2
---
For the following Norwegian domestic parcel and cargo services you can now get extended leadtime information - the estimated arrival time.
* Bedriftspakke (BPAKKE_DOR-DOR)
* Pakke til bedrift (5000)
* Servicepakke (SERVICEPAKKE)
* Pakke til hentested (5800)
* Stykkgods til bedrift (5100)
* Stykkgods (CARGO)
* Pall til bedrift (5400)
* På Døren (1736) (currently only for pilot customers)
* Pakke levert hjem (5600) (currently only for pilot customers)
* Business Parcel (0330) (only for domestic Sweden)
* Business Parcel Bulk (0332) (only for domestic Sweden)
* Pickup Parcel (0340) (only for domestic Sweden)
* Pickup Parcel Bulk (0342) (only for domestic Sweden)


Note: setting the **actual shipping date** in the Shipping Guide request is a prerequisite for getting the correct estimate back from the machine learning model, as the leadtime is always calculated from the day the parcel is handed in to Bring. In absence for a shipping date set by the user, the Shipping Guide API will default to "now".    

### Parcels and cargo delivered to companies
For the above mentioned services, you can now get extended leadtime information - the estimated arrival time.

Earlier, we have just returned the expected delivery **date** when you request our Shipping Guide API to get leadtime. Now, based on a machine learning model gathering scanning data from deliveries made in Norway, we are also predicting the **arrival window** - i.e. when the shipment is expected to arrive at the recipient address. If you are already presenting expected delivery date in your checkout, we strongly recommend that you consider increasing the value by also including the predicted arrival window.

The estimated arrival window is returned automatically as long as the WithExpectedDelivery flag is set to true. If we for some reason are unable to predict the arrival window, the expected delivery date will still be returned.

The arrival window is returned as time slots in the API response:

```xml
<ns2:ExpectedDelivery>
    <ns2:WorkingDays>1</ns2:WorkingDays>
    <ns2:UserMessage/>
    <ns2:FormattedExpectedDeliveryDate>29.01.2021</ns2:FormattedExpectedDeliveryDate>
    <ns2:ExpectedDeliveryDate>
        <ns2:Year>2021</ns2:Year>
        <ns2:Month>1</ns2:Month>
        <ns2:Day>29</ns2:Day>
        <ns2:TimeSlots>
            <ns2:TimeSlot>
                <ns2:StartTime>
                    <ns2:Hour>9</ns2:Hour>
                    <ns2:Minute>0</ns2:Minute>
                </ns2:StartTime>
                <ns2:EndTime>
                    <ns2:Hour>13</ns2:Hour>
                    <ns2:Minute>0</ns2:Minute>
                </ns2:EndTime>
            </ns2:TimeSlot>
        </ns2:TimeSlots>
    </ns2:ExpectedDeliveryDate>
    <ns2:AlternativeDeliveryDates/>
</ns2:ExpectedDelivery>
 ```

#### How to present the time window data in your checkout
We recommend to insert the start (X) and end (Y) time values into the following sentence:

* **NO:** Pakken ankommer vanligvis mellom kl. X og Y
* **EN:** The parcel usually arrives between X and Y

Together with the expected delivery date, we recommend the following implementation:

* **NO:** Forventet levert XX.XX.20XX. Pakken ankommer vanligvis mellom kl. X og Y
* **EN:** Expected delivered XX.XX.20XX. The parcel usually arrives between X and Y

Even though the API response schema supports minute granularity for start and end time, the minute value will always be set to 0. It is therefore sufficient to parse hours only.

Note that Bring cannot guarantee the arrival time for a specific parcel. The estimated arrival time indicates when, based on historical scanning data, the parcel normally will arrive at the recipient address.

### Parcels going to pickup points
For the services Servicepakke (SERVICEPAKKE) and Pakke til hentested (5800), you can now get extended leadtime information - the estimated arrival time for one or more pickup points.

Earlier, we have just returned the expected delivery **date** when you request our Shipping Guide API to get leadtime for SERVICEPAKKE/5800. Now, based on a machine learning model gathering scanning data from all pickup points in Norway, we are also predicting the **arrival window** - i.e. when the parcel is expected to arrive at a specific pickup point on that specific date. If you are already showing expected delivery date in your checkout, we strongly recomment that you consider increasing the value by also including the predicted arrival window.

To get the estimaterd arrival time for one or more pickup points, use the following new fields:
*  estimateddeliverytime, pickuppoints

Note: along with WithEstimatedDeliveryTime, make sure ensure the flag WithExpectedDelivery is also set to true.

There are two ways of using the functionality for estimated arrival time for pickup points in our Shipping Guide API - with or without the Pickup Point API: 

#### Estimated arrival time for specified pickup points (w/ Pickup Point API)
You specify which pickup points you want us to return estimated arrival time for by including the relevant pickup point IDs in the Shipping guide request. Based on that, we return the start and end time of the expected arrival time window for each pickup point ID you have specified in the request. For a best possible customer experience, we strongly recommend that you use the functionality in combination with the Pickup Point API.
For an example on how to do this, see the example request at the bottom of this page.

#### Estimated arrival time for the end users default pickup point(s) (w/o Pickup Point API)
In the absence of specified pickup point IDs, we take care of looking up the recipient´s default pickup point(s), based on its postal code. Based on that, we return the start and end time of the expected arrival time window for the recipient´s default pickup point(s).
In this case, we will also provide the name of the default pickup point(s). To use the API this way, just omit the `PickupPoints/pickuppoints` element from the example at the page bottom. Please note that in some cases, the recipient´s postal code may have several default pickup points.
  
For arrival times at pickup points, the `ExpectedDelivery` response element normally used for lead time information is **not** returned. In stead a list of `EstimatedDeliveryTimes` is available:  

```xml
<ns2:EstimatedDeliveryTimes>
  <ns2:EstimatedDeliveryTime>
    <ns2:PickupPointId>121532</ns2:PickupPointId>
    <ns2:PickupPointName>Extra Vestby</ns2:PickupPointName>
    <ns2:DeliveryStartTime>13:00</ns2:DeliveryStartTime>
    <ns2:DeliveryEndTime>16:00</ns2:DeliveryEndTime>
    <ns2:FormattedExpectedDeliveryDate>05.01.2022</ns2:FormattedExpectedDeliveryDate>
    <ns2:ShippingDate>04.01.2022</ns2:ShippingDate>
    <ns2:WorkingDays>1</ns2:WorkingDays>
  </ns2:EstimatedDeliveryTime>
  <ns2:EstimatedDeliveryTime>
    <ns2:PickupPointId>121532</ns2:PickupPointId>
    <ns2:PickupPointName>Extra Vestby</ns2:PickupPointName>
    <ns2:DeliveryStartTime>13:00</ns2:DeliveryStartTime>
    <ns2:DeliveryEndTime>16:00</ns2:DeliveryEndTime>
    <ns2:FormattedExpectedDeliveryDate>06.01.2022</ns2:FormattedExpectedDeliveryDate>
    <ns2:ShippingDate>05.01.2022</ns2:ShippingDate>
    <ns2:WorkingDays>1</ns2:WorkingDays>
  </ns2:EstimatedDeliveryTime>
</ns2:EstimatedDeliveryTimes>
```
  
Each item in the list represents an expected delivery time at a specific pickup point. If multiple pickup points are specified in the request, a delivery time for each pickup point is available in the list. If combined with the **NumberOfAlternativeDeliveryDates** request parameter, the list will contain the requested number of delivery dates for each requested pickup point. 

**NOTE:** The delivery time might be different for each returned delivery date.

#### How to present the time window data in your checkout
We recommend to insert the start (X) and end (Y) time values into the following sentence:

* **NO:** Pakken ankommer vanligvis mellom kl. X og Y
* **EN:** The parcel usually arrives between X and Y

Together with the expected delivery date, we recommend the following implementation:

* **NO:** Forventet levert XX.XX.20XX. Pakken ankommer vanligvis mellom kl. X og Y
* **EN:** Expected delivered XX.XX.20XX. The parcel usually arrives between X and Y

Note that Bring cannot guarantee the arrival time for a specific parcel. The estimated arrival time indicates when, based on historical scanning data, the parcel normally will become available for pickup at a specific pickup point on that specific date.
