---
title: Pickup Point API
layout: api
menu:
  apidocs:
    identifier: pickuppoint
    title: Pickup Point API
    url: /api/pickup-point
    parent: checkout
weight: 12
aliases:
  - pickuppointapi.html
params:
  disqus_identifier: https-developer-bring-com-api-pickup-point
  oas: https://api.bring.com/pickuppoint/openapi

  introduction: |
    The Pickup Point API provides a list of pickup points that are nearest to a given location, in order for end customers to choose their preferred pickup point in your checkout. The API supports both manned pickup points and parcel lockers in Norway, Sweden, Denmark and Finland. Pickup points are sorted by driving time by car (source: ESRI). When driving times are unavailable (e.g. due to separation by sea), they are sorted by aerial distance.

  guides:
    - title: Always provide an address
      content: |
        For the most accurate results when querying for pickup points close to a postal code, we **STRONGLY** recommend providing the recipient's address when using the API. This is achieved by adding the following query parameters to the request:
        - `street`
        - `streetNumber`

        **Example**
        ```
        /api/pickuppoint/{countryCode}/postalCode/{postalCode}?street=dronningens gate&streetNumber=10
        ```
    - title: Max parcel dimensions for Pakkeboks pickup points
      content: |
        Max parcel dimensions for Pakkeboks (parcel lockers in Norway) pickup points can now be used to filter out pickup points based on parcel size on the client side, and thus preventing failed bookings during checkout. JSON field:

        ```json
          "maxParcelDimensions": {
            "length": 44.5,
            "width": 50.5,
            "height": 60.0
          }
        ```
    - title: Ensure daily update of offline pickup point data
      content: |
        If you use the Pickup Point API to store pickup locations locally (offline), we recommend updating your data at least once every 24 hours. Pickup points may be added, moved, or removed regularly, and keeping your data updated ensures accurate information for your customers.

  information:
    - title: Authentication
      content: |
        To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).

    - title: Rate limiting
      content: |
        Clients exceeding 80 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

    - title: Formats
      content: |
        REST XML/JSON over HTTP.

  documentation:
    - title: Pickup point types
      content: |
        A pickup point is any location delivering shipments on behalf of Bring and Posten, such as post offices, selected grocery stores, lockers.

        ### PickupPointType

        #### Norway
          - Type 1: Bedriftssenter (manned) - not to be used for B2C shipments
          - Type 4: Post i Butikk (manned)
          - Type 19: Posten pakkeutlevering (manned)
          - Type 21: Postkontor (manned)
          - Type 32: Postpunkt (manned)
          - Type 37: Pakkeboks (unmanned)

        #### Sweden
          - Type 34: Manned
          - Type 39: Locker (Bring)

        #### Denmark
          - Type 85: Manned
          - Type 43: Locker

        #### Finland
          - Type SmartPOST: Finland Smart Post Pickup
          - Type Posti: Finland Posti Pickup Point
          - Type Noutopiste: Finland Pickup Point
          - Type LOCKER: Finland Locker Pickup Point **_(These lockers are placed inside buildings only accessible to the residents and workers in the building)_**

  subpages:
    title: Special topics
---
