---
title: Calling Shipping Guide API
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgcalling
    title: Calling Shipping Guide API
    parent: shippingguide_2
weight: 1
---
This guide will walk you through getting shipment alternatives for your first consignment. We will be calling the SOAP interface with a HTTP client and query for the service `SERVICEPAKKE` and `PA_DOREN` for two packages.

## 1. Add additional headers

### SOAP
Since we're using the SOAP (1.1) interface we'll have to add the following header:

- `Content-type: text/xml`

Most SOAP libraries will do this for you.

### REST
For the REST `POST` interfaces:

  `Content-type: application/json`

## 2. Add the body to the request
There are several ways you can control the output of your request. The following elements controls what the API will calculate.

| SOAP name | REST (POST) name |  Description |
| -------------- | -------------- | -------------- | -------------- |
| `WithPrice` | `withPrice` | Controls whether prices should be calculated. Default `true` |
| `WithExpectedDelivery` | `withExpectedDelivery` | Controls whether lead times should be calculated. Default `true` |
| `WithGuiInformation` | `withGuiInformation` | Return detailed information about requested service. Default `true` |
| `WithEstimatedDeliveryTime` | `withEstimatedDeliveryTime` | Extended lead time information, including predicted arrival time at pickup point. Only supported for a limited set of [services](#estimated-arrival-time-for-domestic-parcels-and-cargo). Default `false` |
| `NumberOfAlternativeDeliveryDates` | `numberOfAlternativeDeliveryDates` | Number of alternative delivery dates to be suggested. Default `0`, maximum `9` |
| `WithEnvironmentalData`| `withEnvironmentalData`| Return [environmental data](#shipment-environmental-data) about fossil free and electric transportation used on different transport legs |
| `Language` | `language` | Language in which human readable message should be returned. Supported languages are `NO`, `DK`, `SE` and `EN` |
| `EDI` | `edi` | Should the parcel be registered using EDI when shipped. Note that this flag may affect price and which services are available. Default `true` |
| `PostingAtPostoffice` | `postingAtPostoffice` | Will the parcel be delivered at a post office when shipped. Default `false` |
| `Trace` | `trace` | Should trace messages should be returned or not. Refer TraceType description in response. Default `false` |

In this request we will query prices and expected delivery time for the service `SERVICEPAKKE` for a single package being sent from the postal code 0015 to 5518 in Norway.

### SOAP

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                  xmlns:ns="http://www.bring.no/logistics/shippingguide/2.0">
    <soapenv:Header/>
    <soapenv:Body>
        <ns:ShippingGuideRequest xmlns:ns="http://www.bring.no/logistics/shippingguide/2.0">
            <ns:Language>no</ns:Language>
            <ns:WithPrice>true</ns:WithPrice>
            <ns:WithExpectedDelivery>false</ns:WithExpectedDelivery>
            <ns:WithGuiInformation>true</ns:WithGuiInformation>
            <ns:NumberOfAlternativeDeliveryDates>0</ns:NumberOfAlternativeDeliveryDates>
            <ns:EDI>true</ns:EDI>
            <ns:PostingAtPostoffice>true</ns:PostingAtPostoffice>
            <ns:Trace>true</ns:Trace>
            <ns:Consignments>
              <ns:Consignment id="101">
                  <ns:Products>
                      <ns:Product>
                          <ns:Id>SERVICEPAKKE</ns:Id>
                      </ns:Product>
                  </ns:Products>
                  <ns:FromCountryCode>NO</ns:FromCountryCode>
                  <ns:FromPostalCode>0015</ns:FromPostalCode>
                  <ns:ToCountryCode>NO</ns:ToCountryCode>
                  <ns:ToPostalCode>5518</ns:ToPostalCode>
                  <ns:AddressLine>Testsvingen 12</ns:AddressLine>
                  <ns:ShippingDate>
                      <ns:Year>2016</ns:Year>
                      <ns:Month>10</ns:Month>
                      <ns:Day>10</ns:Day>
                      <ns:Hour>10</ns:Hour>
                      <ns:Minute>0</ns:Minute>
                  </ns:ShippingDate>
                  <ns:AdditionalServices>
                      <ns:AdditionalService>
                          <ns:Id>EVARSLING</ns:Id>
                      </ns:AdditionalService>
                      <ns:AdditionalService>
                          <ns:Id>POSTOPPKRAV</ns:Id>
                      </ns:AdditionalService>
                  </ns:AdditionalServices>
                  <ns:Packages>
                      <ns:Package id="10">
                          <ns:Height>10</ns:Height>
                          <ns:Width>10</ns:Width>
                          <ns:Length>10</ns:Length>
                          <ns:GrossWeight>50</ns:GrossWeight>
                      </ns:Package>
                      <ns:Package id="11">
                          <ns:Height>10</ns:Height>
                          <ns:Width>10</ns:Width>
                          <ns:Length>10</ns:Length>
                          <ns:GrossWeight>50</ns:GrossWeight>
                      </ns:Package>
                      <ns:Package id="12">
                          <ns:Height>11</ns:Height>
                          <ns:Width>10</ns:Width>
                          <ns:Length>10</ns:Length>
                          <ns:GrossWeight>50</ns:GrossWeight>
                      </ns:Package>
                  </ns:Packages>
              </ns:Consignment>
            </ns:Consignments>
        </ns:ShippingGuideRequest>
    </soapenv:Body>
</soapenv:Envelope>
``` 

### REST (POST)

```json
{  
  "language": "no",
  "withPrice": true,
  "withExpectedDelivery": false,
  "withGuiInformation": true,
  "numberOfAlternativeDeliveryDates": 0,
  "edi": true,
  "postingAtPostOffice": true,
  "trace": true,
  "consignments": [
    {
      "id": 101,
      "products": [
        {
          "id": "SERVICEPAKKE"
        }
      ],
      "fromCountryCode": "NO",
      "toCountryCode": "NO",
      "fromPostalCode": "0015",
      "toPostalCode": "5518",
      "addressLine": "Testsvingen 2",
      "shippingDate": {
        "day": "10",
        "hour": "10",
        "minute": "0",
        "month": "10",
        "year": "2016"
      },
      "packages": [
        {
          "id": "10",
          "length": 10,
          "width": 10,
          "height": 10,
          "grossWeight": 50
        },
        {
          "id": "11",
          "length": 10,
          "width": 10,
          "height": 10,
          "grossWeight": 50
        },
        {
          "id": "12",
          "length": 11,
          "width": 10,
          "height": 10,
          "grossWeight": 50
        }        
      ],
      "additionalServices": [
        {
          "id": "EVARSLING"
        },
        {
          "id": "POSTOPPKRAV"
        }       
      ]
    }
  ]
}
```

## 3. Submit the request

### SOAP
Post your request to

```
https://api.bring.com/shippingguide/api/ws
```

The response may have changed since it was documented but you will get a response that looks something like this:

```xml
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Header/>
    <SOAP-ENV:Body>
        <ns2:ShippingGuideResponse xmlns:ns2="http://www.bring.no/logistics/shippingguide/2.0">
            <ns2:Consignments>
                <ns2:Consignment consignmentId="101">
                    <ns2:Products>
                        <ns2:Product>
                            <ns2:Id>SERVICEPAKKE</ns2:Id>
                            <ns2:ProductionCode>1202</ns2:ProductionCode>
                            <ns2:GuiInformation>
                                <ns2:SortOrder>11</ns2:SortOrder>
                                <ns2:MainDisplayCategory>Pakke</ns2:MainDisplayCategory>
                                <ns2:SubDisplayCategory>Til private</ns2:SubDisplayCategory>
                                <ns2:Trackable>false</ns2:Trackable>
                                <ns2:Logo>BRING</ns2:Logo>
                                <ns2:LogoUrl>https://www.mybring.com/shipping-guide/assets/img/Bring_logo.svg</ns2:LogoUrl>
                                <ns2:DisplayName>Servicepakke</ns2:DisplayName>
                                <ns2:ProductName>Servicepakke</ns2:ProductName>
                                <ns2:DescriptionText>Pakken kan spores og utleveres på ditt lokale hentested.</ns2:DescriptionText>
                                <ns2:HelpText>Servicepakke leveres til mottakers lokale hentested (postkontor eller Post i Butikk). Mottaker kan velge å hente sendingen på et annet hentested enn sitt lokale. Mottaker varsles om at sendingen er ankommet via SMS, e-post eller hentemelding i postkassen. Sendingen kan spores ved hjelp av sporingsnummeret.</ns2:HelpText>
                                <ns2:ShortName>Servicepakke</ns2:ShortName>
                                <ns2:ProductURL>http://www.bring.no/sende/pakker/private-i-norge/hentes-pa-posten</ns2:ProductURL>
                                <ns2:DeliveryType>Hentested</ns2:DeliveryType>
                                <ns2:MaxWeightInKgs>35</ns2:MaxWeightInKgs>
                            </ns2:GuiInformation>
                            <ns2:Price>
                                <ns2:ListPrice currencyCode="NOK">
                                    <ns2:PriceWithoutAdditionalServices>
                                        <ns2:AmountWithoutVAT>239.00</ns2:AmountWithoutVAT>
                                        <ns2:VAT>59.75</ns2:VAT>
                                        <ns2:AmountWithVAT>298.75</ns2:AmountWithVAT>
                                    </ns2:PriceWithoutAdditionalServices>
                                    <ns2:PriceWithAdditionalServices>
                                        <ns2:AmountWithoutVAT>239.00</ns2:AmountWithoutVAT>
                                        <ns2:VAT>59.75</ns2:VAT>
                                        <ns2:AmountWithVAT>298.75</ns2:AmountWithVAT>
                                    </ns2:PriceWithAdditionalServices>
                                </ns2:ListPrice>
                            </ns2:Price>
                            <ns2:ExpectedDelivery>
                                <ns2:WorkingDays>2</ns2:WorkingDays>
                                <ns2:UserMessage/>
                                <ns2:FormattedExpectedDeliveryDate>12.10.2018</ns2:FormattedExpectedDeliveryDate>
                                <ns2:ExpectedDeliveryDate>
                                    <ns2:Year>2018</ns2:Year>
                                    <ns2:Month>10</ns2:Month>
                                    <ns2:Day>12</ns2:Day>
                                </ns2:ExpectedDeliveryDate>
                                <ns2:AlternativeDeliveryDates/>
                            </ns2:ExpectedDelivery>
                        </ns2:Product>
                        <ns2:Product>
                            <ns2:Id>PA_DOREN</ns2:Id>
                            <ns2:ProductionCode>1736</ns2:ProductionCode>
                            <ns2:GuiInformation>
                                <ns2:SortOrder>41</ns2:SortOrder>
                                <ns2:MainDisplayCategory>Pakke</ns2:MainDisplayCategory>
                                <ns2:SubDisplayCategory>Til private</ns2:SubDisplayCategory>
                                <ns2:Trackable>false</ns2:Trackable>
                                <ns2:Logo>BRING</ns2:Logo>
                                <ns2:LogoUrl>https://www.mybring.com/shipping-guide/assets/img/Bring_logo.svg</ns2:LogoUrl>    
                                <ns2:DisplayName>På Døren</ns2:DisplayName>
                                <ns2:ProductName>På Døren</ns2:ProductName>
                                <ns2:DescriptionText>Pakken kan spores og leveres hjem til deg mellom kl. 17-21. Sjåføren ringer 30-60 min før ankomst.</ns2:DescriptionText>
                                <ns2:HelpText>På Døren leveres hjem til mottaker mellom kl. 17 og 21. Mottaker varsles i god tid om forventet utleveringsdag via SMS eller e-post, i tillegg til nytt varsel når sendingen er lastet på bil for utkjøring samme kveld. Sjåføren ringer mottaker 30-60 minutter før ankomst. Mottaker kan endre leveringsdag når pakken spores (gjelder ikke lokalpakker). Dersom sendingen ikke kan leveres, blir den sendt til mottakers lokale hentested (postkontor eller Post i Butikk). Sendingen kan spores ved hjelp av sporingsnummeret.</ns2:HelpText>
                                <ns2:ShortName>På Døren</ns2:ShortName>
                                <ns2:ProductURL>http://www.bring.no/sende/pakker/private-i-norge/hjemlevering</ns2:ProductURL>
                                <ns2:DeliveryType>Dør</ns2:DeliveryType>
                                <ns2:MaxWeightInKgs>35</ns2:MaxWeightInKgs>
                            </ns2:GuiInformation>
                            <ns2:Price>
                                <ns2:ListPrice currencyCode="NOK">
                                    <ns2:PriceWithoutAdditionalServices>
                                        <ns2:AmountWithoutVAT>270.00</ns2:AmountWithoutVAT>
                                        <ns2:VAT>67.50</ns2:VAT>
                                        <ns2:AmountWithVAT>337.50</ns2:AmountWithVAT>
                                    </ns2:PriceWithoutAdditionalServices>
                                    <ns2:PriceWithAdditionalServices>
                                        <ns2:AmountWithoutVAT>270.00</ns2:AmountWithoutVAT>
                                        <ns2:VAT>67.50</ns2:VAT>
                                        <ns2:AmountWithVAT>337.50</ns2:AmountWithVAT>
                                    </ns2:PriceWithAdditionalServices>
                                </ns2:ListPrice>
                            </ns2:Price>
                            <ns2:Warnings>
                                <ns2:Warning>
                                    <ns2:code>NO_EXPECTED_DELIVERY</ns2:code>
                                    <ns2:description>Expected delivery date is not available</ns2:description>
                                </ns2:Warning>
                            </ns2:Warnings>
                        </ns2:Product>
                    </ns2:Products>
                </ns2:Consignment>
            </ns2:Consignments>
        </ns2:ShippingGuideResponse>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

If you want to know more about the fields you can have a look at the XSD linked from the section [Request and response structure](/api/shipping-guide_2/#request-and-response-structure)

### REST
Post your request to 

```
https://api.bring.com/shippingguide/v2/products
```                     

The response may have changed since it was documented but you will get a response that looks something like this:

```json
{
  "traceMessages": [],
  "consignments": [
    {
      "products": [
          {
              "id": "SERVICEPAKKE",
              "productionCode": "1202",
              "guiInformation": {
                  "sortOrder": "0",
                  "mainDisplayCategory": "Pakke",
                  "subDisplayCategory": "Til privatpersoner",
                  "trackable": false,
                  "logo": "BRING",
                  "logoUrl": "https://www.qa.mybring.com/shipping-guide/assets/img/Bring_logo.svg",
                  "displayName": "Til hentested",
                  "productName": "Servicepakke",
                  "descriptionText": "Pakken kan spores og utleveres på ditt lokale hentested.",
                  "helpText": "Servicepakke leveres til mottakers lokale hentested (postkontor eller Post i Butikk). Mottaker kan velge å hente sendingen på et annet hentested enn sitt lokale. Mottaker varsles om at sendingen er ankommet via SMS, e-post eller hentemelding i postkassen. Sendingen kan spores ved hjelp av sporingsnummeret.",
                  "shortName": "Servicepakke",
                  "productURL": "http://www.bring.no/sende/pakker/private-i-norge/hentes-pa-posten",
                  "deliveryType": "Hentested",
                  "maxWeightInKgs": "35"
              },
              "price": {
                  "listPrice": {
                      "priceWithoutAdditionalServices": {
                          "amountWithoutVAT": "750.96",
                          "vat": "187.74",
                          "amountWithVAT": "938.70"
                      },
                      "additionalServices": [
                          {
                              "additionalServiceId": "EVARSLING",
                              "additionalServiceDescription": "",
                              "additionalServicePrice": {
                                  "amountWithoutVAT": "0.00",
                                  "vat": "0.00",
                                  "amountWithVAT": "0.00"
                              },
                              "additionalServiceCodeFromProductionSystem": "1091"
                          },
                          {
                              "additionalServiceId": "POSTOPPKRAV",
                              "additionalServiceDescription": "",
                              "additionalServicePrice": {
                                  "amountWithoutVAT": "65.00",
                                  "vat": "16.25",
                                  "amountWithVAT": "81.25"
                              },
                              "additionalServiceCodeFromProductionSystem": "2000"
                          }
                      ],
                      "priceWithAdditionalServices": {
                          "amountWithoutVAT": "815.96",
                          "vat": "203.99",
                          "amountWithVAT": "1019.95"
                      },
                      "currencyCode": "NOK"
                  }
              }
          }
      ]
    }
  ],
  "uniqueId": "9944a207-82ee-464f-bb55-b77eb836adc2"
}
```
