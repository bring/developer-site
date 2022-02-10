---
title: Pickup Point API
layout: api
oasapi: true
disqus_identifier: https-developer-bring-com-api-pickup-point
menu:
  apidocs:
    identifier: pickuppoint
    title: Pickup Point API
    url: /api/pickup-point
    parent: checkout
weight: 12

important:
  - type: info
    title: Max parcel dimensions for Pakkeboks pickup points
    message: |
      Max parcel dimensions for Pakkeboks (parcel lockers in Norway) pickup points can now be used to filter out pickup points based on parcel size on the client side, and thus preventing failed bookings during checkout. JSON field:
      <code>
      "maxParcelDimensions": {
        "length": 44.5,
        "width": 50.5,
        "height": 60.0
      }
      </code>

introduction: |
  The Pickup Point API provides a list of pickup points that are nearest to a given location, in order for end customers to choose their preferred pickup point in your checkout. The API supports both manned pickup points and parcel lockers in Norway, Sweden, Denmark and Finland. Pickup points are sorted by driving time by car (source: Google). When driving times are unavailable (e.g. due to separation by sea), they are sorted by aerial distance. For precise results, we strongly recommend to use the end customer's complete address when using the API.

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
  - title: Filtering results
    content: |
      The list of pickup points can be narrowed down by using `searchForText=<texts>`, where the pickup points will have at least a partial match with the search string given in `<texts>`. This can be the name of the pickup point, its address, city, county, municipality or location. See the examples for more information.

  - title: Postbox and visiting address
    content: |
      There are two sets of addresses in the response, postbox (`address` and `postalCode`) and visiting address (`visitingAddress` and `visitingPostalCode`). Postbox address is required to get a package produced correctly, use this AS RECIPIENT address on label. Visiting address is more appropriate for user interface (Street address of the PIB).

  - title: Pickup point types
    content: |
      A pickup point is any location delivering shipments on behalf of Bring and Posten, such as post offices, selected grocery stores, lockers.

      ### PickupPointType

      #### Norway
        - Type 4: Post i Butikk (manned)
        - Type 19: Posten pakkeutlevering (manned)
        - Type 21: Postkontor (manned)
        - Type 32: Postpunkt (manned)
        - Type 37: Pakkeboks (unmanned)

      #### Sweden
        - Type 34: Manned
        - Type 38: Locker

      #### Denmark
        - Type 85: Manned
        - Type 86: Locker

      #### Finland
        - Type SmartPOST: Finland Smart Post Pickup
        - Type Posti: Finland Posti Pickup Point
        - Type Noutopiste: Finland Pickup Point
        - Type LOCKER: Finland Locker Pickup Point

swagger:
  - title: Swagger API Documentation
    url: https://api.qa.bring.com/pickuppoint/openapi.json
oas: https://api.qa.bring.com/pickuppoint/openapi.json
---
