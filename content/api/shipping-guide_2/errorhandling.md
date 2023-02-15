---
title: Error handling
layout: api
notanapi: true
menu:
  apidocs:
    identifier: sgerrorhandling
    title: Error handling
    parent: shippingguide_2
weight: 4
---
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
