---
title: Calling Shipping Guide API
menu:
  apidocs:
    identifier: sgcalling
    title: Calling Shipping Guide API
    parent: sgusing
weight: 3
---
This guide will walk you through getting shipment alternatives for your first consignment. We will be calling the REST interface with a HTTP client and query for the service `5800` and `PA_DOREN` for two packages.

### 1. Add additional headers

For the `POST` requests, Add the following header:

- `Content-type: application/json`

### 2. Add the body to the request
There are several ways you can control the output of your request. The following elements controls what the API will calculate.

| Element name |  Description |
| -------------- | -------------- | -------------- | -------------- |
| `withPrice` | Controls whether prices should be calculated. Default `true` |
| `withExpectedDelivery` | Controls whether lead times should be calculated. Default `true` |
| `withGuiInformation` | Return detailed information about requested service. Default `true` |
| `withEstimatedDeliveryTime` | Extended lead time information, including predicted arrival time at pickup point. Only supported for a limited set of [services](/api/shipping-guide_2/lead-time/#estimated-arrival-time-for-domestic-parcels-and-cargo). Default `false` |
| `numberOfAlternativeDeliveryDates` | Number of alternative delivery dates to be suggested. Default `0`, maximum `9` |
| `withEnvironmentalData`| Return [environmental data](/api/shipping-guide_2/environmentaldata/) about fossil free and electric transportation used on different transport legs |
| `language` | Language in which human readable message should be returned. Supported languages are `NO`, `DK`, `SE` and `EN` |
| `edi` | Should the parcel be registered using EDI when shipped. Note that this flag may affect price and which services are available. Default `true` |
| `postingAtPostoffice` | Will the parcel be delivered at a post office when shipped. Default `false` |

In this request we will query prices and expected delivery time for the service `5800` for a single package being sent from the postal code 0015 to 5518 in Norway.


#### REST (POST)

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
          "id": "5800"
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

### 3. Submit the request


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
              "id": "5800",
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
