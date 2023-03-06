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
    title: Deprecating v1 version of Tracking API - 01.08.2022
    message: |
     Starting 1 August 2022, Tracking API version v1 will be deprecated and the requests will be automatically forwarded to the latest version, v2.
     It is not a breaking change. In the new version you will have access to many more fields.
  - type: warn
    title: Removed event statuses from open tracking - 22.06.2022
    message: |
     The event statuses ARRIVED_COLLECTION and ARRIVED_DELIVERY are not valid anymore, and therefore have been removed from the Tracking API.
  
introduction: |
  The Tracking API provides the opportunity to track shipments by reference, package or shipment number. It is an easy way to get shipment details and events and make them available for customers. The information available in this API is the same that is publicly available from the [Tracking website](http://tracking.bring.com/).

information:
  - title: Authentication
    content: |
      By using authenticated requests you can get more information such as price, name, address and signatures for proof of delivery. The rate limits are also less strict.

      To make authenticated Tracking API requests: You will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

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
      curl -H "api-version: 2" https://api.bring.com/tracking/api/tracking.json?q=TESTPACKAGEATPICKUPPOINT
      ```

      ### Select version by URL
      Use the normal URL, but add `{v2}` to the URL. Example:

      | Application | URL example |
      |:-------|:--------|
      | Tracking | https://api.bring.com/tracking/api/**v2**/tracking.json?q=TESTPACKAGEATPICKUPPOINT |

      #### Example request
      ```
      curl -v https://api.bring.com/tracking/api/v2/tracking.json?q=TESTPACKAGEATPICKUPPOINT
      ```
    
      ###  Events Description
      A parcel has a number of events connected to it during its travel. Here are a list of current event statuses that can be returned.

       | Event | Description |
       |:-------|:--------|
       | `ATTEMPTED_DELIVERY` | The package has been attempted delivered at the door. Depending on the service it will be tried again or sent to closest pickup point. |
       | `CUSTOMS` | Package is in customs clearance. |
       | `COLLECTED` | The parcel has been collected at pickup address. |
       | `DELIVERED` | Package has been delivered. |
       | `DELIVERED_SENDER` | Package has been returned to the sender |
       | `DELIVERY_CANCELLED` | Home delivery has been cancelled by the customer. |
       | `DELIVERY_CHANGED` | Date for Home delivery has been changed by customer. |
       | `DELIVERY_ORDERED` | Home delivery has been ordered |
       | `DEVIATION` | Deviation in production. Something wrong has happened and there is a probability for delay. |
       | `HANDED_IN` | Package has been handed in to Bring. |
       | `INTERNATIONAL` | Package has been sent from origin country or arrived at destination country. |
       | `IN_TRANSIT` | Package is in transit. |
       | `NOTIFICATION_SENT` | Notification for this package has been sent by sms, push and/or mail. This can be informational notifications and action notification like pickup notice. |
       | `PRE_NOTIFIED` | EDI message for the package has been received by Bring. |
       | `READY_FOR_PICKUP` | Package has arrived at pickup point. |
       | `RETURN` | The package has been returned to sender. |
       | `TRANSPORT_TO_RECIPIENT` | Package has been loaded for delivery to the recipient. |
       | `TERMINAL` | The package is now registered/arrived at inbound/outbound storage terminal |
       | `UNKNOWN` | Represents unknown / undefined events |

      ### Verification
      You can verify that your request was used correctly by certifying that the response contains an element based on the request type:

      | URI request | Response type | Example |
      |:-------|:--------|:--------|
      | tracking.json | `application/json; charset=utf-8` | `{"apiVersion": "2"}` |
      | tracking.xml | `application/xml;charset=utf-8` | `<ApiVersion>2</ApiVersion>` |


oas: https://api.bring.com/tracking/api-docs/

---
