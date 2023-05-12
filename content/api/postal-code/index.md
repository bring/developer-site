---
title: Postal Code API
layout: api
disqus_identifier: https-developer-bring-com-api-postal-code
menu:
  apidocs:
    identifier: postalcode
    title: Postal Code API
    url: /api/postal-code
    parent: checkout
weight: 14

introduction: |
  The Postal Code API can be used for:
  * postal code validation
  * getting postal code suggestions from prefix based searches
  * fetching postal code details, including city, municipality and county details
  * fetching a list of all valid postal codes for supported countries

  For Norwegian, Danish and Finnish postal codes, it’s also possible to get the postal code type, e.g. normal or post office box.

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).

  - title: Rate limiting
    content: |
      Clients exceeding 120 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

      When response bodies exceed 4kb, response is gzip compressed.

documentation:
  - title: Supported Countries
    content: |
      * NO - Norway
      * DK - Denmark
      * SE - Sweden
      * FI - Finland
      * NL - Netherlands
      * DE - Germany
      * US - United States
      * BE - Belgium
      * FO - Faroe Islands
      * GL - Greenland
      * IS - Iceland
      * SJ - Svalbard and Jan Mayen

      The service uses [GeoNames](http://www.geonames.org/) as source for most countries except Norway, Sweden, Finland.

      For unsupported countries (countries not in the list above) the API will not provide any value. For such cases it is recommended to prompt the user to input the city name themselves.

oas: https://api.bring.com/address/api-docs/postalcode
---
