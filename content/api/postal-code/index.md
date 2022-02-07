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

important:
  - type: warn
    message: |
      Integration with shipping guide for postal code lookup is deprecated (Base url: https://api.bring.com/shippingguide/api). We recommend switching to pickup point if you have not already done so (Base url: https://api.bring.com/pickuppoint/api).

introduction: |
  The Postal Code API can be used to validate postal codes, and to look up the city of a given postal code for a number of countries. The API can also provide a list of all valid postal codes for Norway, Sweden, Denmark and Finland. For Norwegian postal codes, it’s also possible to retrieve the postal code type, e.g. normal or post box.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Rate limiting
    content: |
      Clients exceeding 60 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

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

      The service uses [GeoNames](http://www.geonames.org/) as source for most countries except Norway.

      For unsupported countries (countries not in the list above), all postal codes will be marked as valid with no city name returned. In these cases it is recommended to prompt the user to input the city name themselves.

      For countries that have multiple results (cities) for a given postal code, a list of cities will be returned. See example below.

      ### Postal Code type for Norway

      For Norway, you also get information about the postal code type. This is set in the `postalCodeType` in the response:

      | postalCodeType | Description |
      |:-----------------|:------------|
      | NORMAL | Normal postal code suitable for delivering packages. Contains street addresses or mix of street and other postal code types. |
      | PO_BOX | Postal code contains only P.O. Box addresses. Only certain Bring services can be delivered to these addresses (see the [Shipping Guide](/api/shipping-guide_2/)). |
      | SPECIAL_CUSTOMER | Special, e.g special return postal codes for selected customers. |
      | UNKNOWN | Unknown postal code type. Used for e.g. international postal codes. |

  - title: Support CORS
    content: |
      CORS headers will be added to response only for authenticated requests.
---
