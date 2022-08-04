---
title: Warehousing API
layout: api
disqus_identifier: https-developer-bring-com-api-warehousing
menu:
  apidocs:
    identifier: warehousing
    title: Warehousing API
    url: /api/warehousing
    parent: warehouse
weight: 41

important:
  - type: warn
    message: |
      **Please note:** Our Warehousing APIs are changing. Please contact our sales department <a
      href="mailto:bwsalg@bring.com">bwsalg@bring.com</a> for a correct documentation version

introduction: |
  The Warehousing API is used to submit order and article information to Bring's warehouses. Users are also able to extract detailed order information from our warehouse while the orders are being processed. Further, the API provides information about articles in stock, with methods for retrieving information about single items or configurable list of items.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON and SOAP over HTTP. This API doesn't support JSON for all methods yet. Look in the example section to see which are supported.

documentation:
  - title: Introduction
    content: |
      A typical usage pattern for an Warehousing customer type is to create an order in Order Management that will go to the correct warehouse for picking, packing and sending. Then follow up with creating a packing list from the warehouse with transport information. All steps can be followed in Mybring Order Management.

      Warehousing API has several interfaces (SOAP and XML/JSON). Choose the option that fits your needs best (see table below). The XML/JSON interface is the core interface with complete functionality.

      Please note that this API currently doesn't support json on all of its methods yet. Look in the example section to see which are supported.

  - title: Versioning
    content: |
      Warehousing API makes an effort to always be backwards compatible regarding data format for requests and responses of the Web Service. To achieve this, a SchemaVersion element is used in the request, indicating which version the client is on and what data-format the client expects in the result.

      We make an effort not to return new elements in the response when an old schema version is specified. When changes in the schema are made, the SchemaVersion is incremented by one. The new schema is used at the same endpoint URL as before and uses the same namespace for its XML elements. A TraceMessage element (info message) in the response is added to inform the client that its schema should be updated. Old schema versions might in the future be unsupported.

      Regarding the XML API (not Web Services), an XML Schema is not used at all. Therefore, clients of the XML API are expected to handle new elements that appear. Nevertheless, the response will be backwards compatible in the sense that elements are not renamed or deleted.

  - title: SOAP
    content: |
      ### WSDL

      [https://api.bring.com/warehousing/api/ws/purchaseorder-v1.wsdl](https://api.bring.com/warehousing/api/ws/purchaseorder-v1.wsdl)

      [https://api.bring.com/warehousing/api/ws/om-order-v1.wsdl](https://api.bring.com/warehousing/api/ws/om-order-v1.wsdl)

  - title: Error handling
    content: |
      When using the Warehousing API, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use timeouts and other error handling techniques when making requests to the service.

      How you handle errors depends on the nature of your application, but one strategy for handling such situations is by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).

      See [the list of error codes](#list-error-codes) for hints on how to implement error handling.
---
