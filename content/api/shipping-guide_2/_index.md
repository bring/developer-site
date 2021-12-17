---
title: Shipping Guide API
layout: api
disqus_identifier: https-developer-bring-com-api-shipping-guide-2
menu:
  apidocs:
    identifier: shippingguide_2
    title: Shipping Guide API
    url: /api/shipping-guide_2
    parent: checkout
weight: 11
aliases:
  - shipping-guide

introduction: |
  The Shipping Guide API provides available services for a given combination of sender and recipient locations, including estimated delivery times, prices and environmental data. It also returns logo and human readable service descriptions that can be shown in your checkout. Available services are based on your agreement with Bring (i.e. the customer numbers attached to your user).

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Rate limiting
    content: |
      Clients exceeding 60 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP and SOAP over HTTP. The REST/GET interface only supports single consignments, while the SOAP and the REST/POST interfaces can be used for multiple consignments.

documentation:
  - title: Versioning
    content: |
      The Shipping Guide makes an effort to always be backwards compatible regarding data format for requests and responses. To achieve this, namespace schema versioning is used in the request for webservices, indicating which version the client is on and what data-format the client expects in the result. For REST, versioning is defined as part of endpoint itself.

      **Important**: All clients must accept **new (unknown) elements** in the response. E.g. unknown elements should be ignored. Also, **new error codes and warning codes** could be added as well. The client framework used by client must not crash when **unknown elements or new code values** are are encountered.

      When incompatible changes in the schema are made (other than addition of new elements), the namespace versioning will be updated accordingly. The new schema is used at the *same endpoint URL* as before for webservices. Old schema versions will be shut down some time in the future, so its recommended always updating to the latest version.

  - title: Performance
    content: |
      To have better performance of the api

      * Request can be limited to have only the services needed since the response time of some services can be slow as compared to others
      * If the request is only to find the lead time / prices of different service, the flag for withExpectedDelivery / withPrices should be set to true and others can be set to false. In case of REST these are different endpoints.
      * For net prices requests should include customer number and correct package details
      * Request can include limited number of consignments in each request for quick response.
      * New shipments request can be part of separate request

  - title: Getting shipment alternatives
    content: |
      This guide will walk you through getting shipment alternatives for your first consignment. We will be calling the SOAP interface with a HTTP client and query for the service `SERVICEPAKKE` and `PA_DOREN` for two packages.

      ### 1. Add additional headers

      #### SOAP
      Since we're using the SOAP (1.1) interface we'll have to add the following header:

      - `Content-type: text/xml`

      Most SOAP libraries will do this for you.

      #### REST
      For the REST `POST` interfaces:

      `Content-type: application/json`

      ### 2. Add the body to the request
      There are several ways you can control the output of your request. The following elements controls what the API will calculate.

      | SOAP name | REST (POST) name | REST (GET) name |  Description |
      | -------------- | -------------- | -------------- | -------------- |
      | `WithPrice` | `withPrice` | N/A | Controls whether prices should be calculated. Default `true` |
      | `WithExpectedDelivery` | `withExpectedDelivery` | N/A | Controls whether lead times should be calculated. Default `true` |
      | `WithGuiInformation` | `withGuiInformation` | N/A | Return detailed information about requested service. Default `true` |
      | `WithEstimatedDeliveryTime` | `withEstimatedDeliveryTime` | `estimateddeliverytime` | Extended lead time information, including predicted arrival time at pickup point. Only supported for a limited set of [services](#estimated-arrival-time-for-domestic-parcels-and-cargo). Default `false` |
      | `NumberOfAlternativeDeliveryDates` | `numberOfAlternativeDeliveryDates` | `numberofdeliverydates` | Number of alternative delivery dates to be suggested. Default `0`, maximum `9` |
      | `WithUniqueAlternateDeliveryDates` | `withUniqueAlternateDeliveryDates` | `uniquealternatedeliverydates` | Return [unique alternative delivery dates](#get-unique-expected-delivery-dates). Default `false` |
      | `WithEnvironmentalData`| `withEnvironmentalData`| `environmentaldata`| Return [environmental data](#shipment-environmental-data) about fossil free and electric transportation used on different transport legs |
      | `Language` | `language` | `language` | Language in which human readable message should be returned. Supported languages are `NO`, `DK`, `SE` and `EN` |
      | `EDI` | `edi` | N/A | Should the parcel be registered using EDI when shipped. Note that this flag may affect price and which services are available. Default `true` |
      | `PostingAtPostoffice` | `postingAtPostoffice` | `postingatpostoffice` | Will the parcel be delivered at a post office when shipped. Default `false` |
      | `Trace` | `trace` | N/A | Shohuld trace messages should be returned or not. Refer TraceType description in response. Default `false` |

      In this request we will query prices and expected delivery time for the service `SERVICEPAKKE` for a single package being sent from the postal code 0015 to 5518 in Norway.

      #### SOAP

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

      #### REST (POST)

      ```json
      {  
        "language": "no",
        "withPrice": true,
        "withExpectedDelivery": false,
        "withGuiInformation": true,
        "numberOfAlternativeDeliveryDates": 0,
        "withUniqueAlternateDeliveryDates": false,
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

      ### 3. Submit the request

      #### SOAP
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
                                      <ns2:DisplayName>Klimanøytral Servicepakke</ns2:DisplayName>
                                      <ns2:ProductName>Klimanøytral Servicepakke</ns2:ProductName>
                                      <ns2:DescriptionText>Pakken kan spores og utleveres på ditt lokale hentested.</ns2:DescriptionText>
                                      <ns2:HelpText>Klimanøytral Servicepakke leveres til mottakers lokale hentested (postkontor eller Post i Butikk). Mottaker kan velge å hente sendingen på et annet hentested enn sitt lokale. Mottaker varsles om at sendingen er ankommet via SMS, e-post eller hentemelding i postkassen. Sendingen kan spores ved hjelp av sporingsnummeret.</ns2:HelpText>
                                      <ns2:ShortName>Klimanøytral Servicepakke</ns2:ShortName>
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

      #### REST
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
                        "productName": "Klimanøytral Servicepakke",
                        "descriptionText": "Pakken kan spores og utleveres på ditt lokale hentested.",
                        "helpText": "Klimanøytral Servicepakke leveres til mottakers lokale hentested (postkontor eller Post i Butikk). Mottaker kan velge å hente sendingen på et annet hentested enn sitt lokale. Mottaker varsles om at sendingen er ankommet via SMS, e-post eller hentemelding i postkassen. Sendingen kan spores ved hjelp av sporingsnummeret.",
                        "shortName": "Klimanøytral Servicepakke",
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

  - title: Error handling
    content: |
      When using the Shipping Guide it is important to handle errors gracefully. Your users should still be able to order even if the Shipping Guide API returns an error or if there is an error establishing a connection to the API.

      The Shipping Guide API return two levels of error information:

      * HTTP error codes or SOAP fault with a message in the body

        For REST we follow general convention of HTTP status codes.
        For SOAP we give out detailed error description along with an error code which can be parsed programmatically.

      ```xml
      <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
          <SOAP-ENV:Header/>
          <SOAP-ENV:Body>
              <SOAP-ENV:Fault>
                  <faultcode>SOAP-ENV:Client</faultcode>
                  <faultstring>FG_INPUT_010 Number of alternative delivery dates must be numeric and less than 10 [errorId 2806bbda-1df0-4b1b-b008-1068f5c57f06]
                  </faultstring>
                  <detail>
                      <code>FG_INPUT_010</code>
                      <description>Error number of alternative deliverydates</description>
                  </detail>
              </SOAP-ENV:Fault>
          </SOAP-ENV:Body>
      </SOAP-ENV:Envelope>
      ```

        [Possible error codes](https://api.bring.com/shippingguide/api/errors?clientUrl=developer.bring.com)


      * An error object in the response that is on service level

        When we are not able to process one of the service requested, we will respond with a error on service level. Details of possible error codes are documented in [XSD](https://api.bring.com/shippingguide/api/ws/shipping-guide-20.xsd) and [WDSL](https://api.bring.com/shippingguide/api/ws/shippingguide-20.wsdl) itself, making it easier for clients to parse it.

  - title: Shipment environmental data
    content: |
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
      * REST GET: environmentaldata
      ```text
      environmentaldata=true
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

      **NOTE**: The API currently only supports environmental data for the `LAST_MILE` leg.

  - title: Estimated arrival time for domestic parcels and cargo
    content: |
      For the following Norwegian domestic parcel and cargo services you can now get extended leadtime information - the estimated arrival time.
      * Bedriftspakke (BPAKKE_DOR-DOR)
      * Pakke til bedrift (5000)
      * Klimanøytral Servicepakke (SERVICEPAKKE)
      * Pakke til hentested (5800)
      * Stykkgods til bedrift (5100)
      * Stykkgods (CARGO)
      * Pall til bedrift (5400)

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
      For the services Klimanøytral Servicepakke (SERVICEPAKKE) and Pakke til hentested (5800), you can now get extended leadtime information - the estimated arrival time for one or more pickup points.

      Earlier, we have just returned the expected delivery **date** when you request our Shipping Guide API to get leadtime for SERVICEPAKKE/5800. Now, based on a machine learning model gathering scanning data from all pickup points in Norway, we are also predicting the **arrival window** - i.e. when the parcel is expected to arrive at a specific pickup point on that specific date. If you are already showing expected delivery date in your checkout, we strongly recomment that you consider increasing the value by also including the predicted arrival window.

      To get the estimaterd arrival time for one or more pickup points, use the following new fields: 
      * SOAP: WithEstimatedDeliveryTime, PickupPoints
      * REST: estimateddeliverytime, pickuppoints

      Note: along with WithEstimatedDeliveryTime, make sure ensure the flag WithExpectedDelivery is also set to true.

      There are two ways of using the functionality for estimated arrival time for pickup points in our Shipping Guide API - with or without the Pickup Point API: 

      #### Estimated arrival time for specified pickup points (w/ Pickup Point API)
      You specify which pickup points you want us to return estimated arrival time for by including the relevant pickup point IDs in the Shipping guide request. Based on that, we return the start and end time of the expected arrival time window for each pickup point ID you have specified in the request. For a best possible customer experience, we strongly recommend that you use the functionality in combination with the Pickup Point API.
      For an example on how to do this, see the example request at the bottom of this page.

      #### Estimated arrival time for the end users default pickup point(s) (w/o Pickup Point API)
      In the absence of specified pickup point IDs, we take care of looking up the recipient´s default pickup point(s), based on its postal code. Based on that, we return the start and end time of the expected arrival time window for the recipient´s default pickup point(s).
      In this case, we will also provide the name of the default pickup point(s). To use the API this way, just omit the `PickupPoints/pickuppoints` element from the example at the page bottom. Please note that in some cases, the recipient´s postal code may have several default pickup points.

      #### How to present the time window data in your checkout
      We recommend to insert the start (X) and end (Y) time values into the following sentence:

      * **NO:** Pakken ankommer vanligvis mellom kl. X og Y
      * **EN:** The parcel usually arrives between X and Y

      Together with the expected delivery date, we recommend the following implementation:

      * **NO:** Forventet levert XX.XX.20XX. Pakken ankommer vanligvis mellom kl. X og Y
      * **EN:** Expected delivered XX.XX.20XX. The parcel usually arrives between X and Y

      Note that Bring cannot guarantee the arrival time for a specific parcel. The estimated arrival time indicates when, based on historical scanning data, the parcel normally will become available for pickup at a specific pickup point on that specific date.

  - title: Get unique expected delivery dates
    content: |
      Customers who want the x next possible delivery dates in the response, can use the **numberOfAlternativeDeliveryDates**. When using this parameter, the same delivery date might be returned several times (as several shipping dates might correspond to the same delivery date). To only get the unique alternative delivery dates use following field:
      * SOAP: WithUniqueAlternateDeliveryDates
      ```xml
      <WithUniqueAlternateDeliveryDates>true</WithUniqueAlternateDeliveryDates>
      <NumberOfAlternativeDeliveryDates>2</NumberOfAlternativeDeliveryDates>
      ```
      * REST GET: uniqueAlternateDeliveryDates
      ```json
      uniqueAlternateDeliveryDates=true&numberofdeliverydates=2
      ```
      * REST POST: withUniqueAlternateDeliveryDates
      ```json
      "withUniqueAlternateDeliveryDates": true,
      "numberOfAlternativeDeliveryDates": 2
      ```

      Note: along with withUniqueAlternateDeliveryDates, make sure the **numberOfAlternativeDeliveryDates** is also set to some positive value. The maximum number of alternative delivery days that can be requested is 9.

  - title:
      Get customer specified leadtimes for Mailbox Parcel (Pakke i postkassen)
    content: |
      Prioritized customers can get their customer specific leadtimes in the response for the outgoing Mailbox Parcel services (3570 and 3584). This is easily done by making sure the **customerNumber** is always set in the requst.
      * SOAP: customerNumber
      ```xml
      <CustomerNumber>2001001000</CustomerNumber>
      ```
      * REST GET: customerNumber
      ```json
      customerNumber=2001001000
      ```
      * REST POST: 2001001000
      ```json
      "customerNumber": "2001001000",
      ```

  - title: Shipping Guide topics
    content: |
      If you want to know more about corner cases/topics/etc, then [Let's talk about Shipping Guide](/api/shipping-guide_2/topics)
---
