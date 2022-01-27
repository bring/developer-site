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
    title: Update deprecated Tracking URLs - 27.01.2022
    message: |
     We have done some technical cleanup in regard to moving Tracking backend to Azure, specifically routing cleanups. For all domains (se, dk, com), please update the tracking link to the following format.
     
     **Old format:**  
     https://tracking.bring.{domain}/tracking.html?q=12345

     **New format:**  
     https://tracking.bring.{domain}/tracking/12345

     **New format .no domain:**  
     https://sporing.bring.no/sporing/12345

  - type: warn
    title: The Tracking API changes from 01.01.2021 and 01.03.2021
    message: |
     We have done a recent change in Tracking, where if the user have specified the wanted delivery date, then that date is set in the field for the estimated delivery date as well, as there is no point having to set estimation date which is different from the configured wanted delivery date.
     
     With reference to the change, the existing field "dateOfEstimatedDelivery" will have the correct information regarding delivery date and therefore, the field "dateOfDelivery" in the open as well as logged in Tracking API versions will be set to Blank from 01.Jan.2021 for backward compatibility and gradually be removed effective from date 01.Mar.2021.

introduction: |
  The Tracking API provides the opportunity to track shipments by reference, package or shipment number. It is an easy way to get shipment details and events and make them available for customers. The information available in this API is the same that is publicly available from the [Tracking website](http://tracking.bring.com/).

information:
  - title: Authentication
    content: |
      By using authenticated requests you can get more information such as price, name, address and signatures for proof of delivery. The rate limits are also less strict.

      To make authenticated Tracking API requests, use the endpoint [https://api.bring.com/tracking/api/](https://api.bring.com/tracking/api/). You also need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON/JSONP over HTTP. We follow the [JSON API specification](http://jsonapi.org/) with one
      exception: we allow media type to be specified as `application/json`
      instead of `application/vnd.api+json`.

documentation:
  - title: Versioning
    content: |
      Latest Tracking API version: `v2`

      We encourage you to always use the latest version of our API. We keep the previous version for some time so that you will get enough time to convert your application. This API supports versioning by two means.

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

      #### Example request
      ```
      curl -v https://tracking.bring.com/api/v2/tracking.json?q=TESTPACKAGE-AT-PICKUPPOINT
      ```

      ### Verification
      You can verify that your request was used correctly by certifying that the response contains an element based on the request type:

      | URI request | Response type | Example |
      |:-------|:--------|:--------|
      | tracking.json | `application/json; charset=utf-8` | `{"apiVersion": "2"}` |
      | tracking.xml | `application/xml;charset=utf-8` | `<ApiVersion>2</ApiVersion>` |
---
