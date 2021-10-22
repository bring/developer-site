---
title: Tracking API
layout: api
disqus_identifier: https-developer-bring-com-api-tracking
menu:
  apidocs:
    parent: track
    identifier: tracking
    title: Tracking API
    url: /api/tracking
weight: 31

important:
  - type: warn
    title: The Tracking API changes from 01.01.2021 and 01.03.2021
    message: |
      We have done a recent change in Tracking, where if the user have specified the wanted delivery date, then that date is set in the field for the estimated delivery date as well, as there is no point having to set estimation date which is different from the configured wanted delivery date.

      With reference to the change, the existing field "dateOfEstimatedDelivery" will have the correct information regarding delivery date and therefore, the field "dateOfDelivery" in the open as well as logged in Tracking API versions will be set to Blank from 01.Jan.2021 for backward compatibility and gradually be removed effective from date 01.Mar.2021.

documentation:
  - title: Introduction
    content: |
      The Tracking API provides the opportunity to track shipments by reference, package or shipment number.
      It is an easy way to display details and the status of shipments.
      The information available in this API is the same that is publically available from the [Tracking web site](http://tracking.bring.com/).

  - title: Versioning
    content: |
      Latest Tracking API version: `v2`

      We encourage you to use the latest version of our API all time.  Of course, we keep the previous version for some time so that you will get enough time to convert your application. This API supports versioning by two means.

      ### Select version by request-header
      Use the normal URL but add the following request-header:

      | Header | Example |
      |:-------|:--------|
      | `api-version` | `2` |

      #### Example request
      ```
      curl -H "api-version: 2" https://tracking.bring.com/api/tracking.json?q=TESTPACKAGE-AT-PICKUPPOINT
      ```

      ### Select version by URL
      Use the normal URL, but add `{v1, v2}` to the URL. Example:

      | Application | URL example |
      |:-------|:--------|
      | Open tracking | https://tracking.bring.com/api/**v2**/tracking.json?q=TESTPACKAGE-AT-PICKUPPOINT |
      | Logged-in tracking | https://api.bring.com/tracking/api/**v2**/tracking.json?q=TESTPACKAGE-AT-PICKUPPOINT |

      You can verify that your request were used correctly by certifying that the response contains an element based on the request type:

      | URI request | Response type | Example |
      |:-------|:--------|:--------|
      | tracking.json | `application/json; charset=utf-8` | `{"apiVersion": "2"}` |
      | tracking.xml | `application/xml;charset=utf-8` | `<ApiVersion>2</ApiVersion>` |

      #### Example request
      ```
      curl -v https://tracking.bring.com/api/v2/tracking.json?q=TESTPACKAGE-AT-PICKUPPOINT
      ```

  - title: Authentication
    content: |
      If you have a Mybring user, you can perform authenticated requests. They have the following benefits:
      - More information about parcels:
        - Price
        - Name
        - Address
        - Signatures for proof of delivery
      - Less strict rate limits

      To make authenticated Tracking API requests, you will have to use the endpoint [https://api.bring.com/tracking/api/](https://api.bring.com/tracking/api/). You also need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      The Tracking API generates the following formats:
      - XML
      - JSON
      - JSONP

  - title: JSON API
    content: |
      We follow the [JSON API specification](http://jsonapi.org/) with one
      exception: we allow media type to be specified as `application/json`
      instead of `application/vnd.api+json`.
---
