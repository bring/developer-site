---
title: Event Cast API
layout: api
disqus_identifier: https-developer-bring-com-api-event-cast
menu:
  apidocs:
    identifier: eventcast
    title: Event Cast API
    url: /api/event-cast
    parent: track
weight: 32

introduction: |
  The Event Cast API can be used to subscribe to tracking events for a given shipment by registering webhooks. Event notifications are automatically pushed to the subscriber as they happen, avoiding repeatedly poll statuses calling the Tracking API. You define an endpoint that accepts HTTP POST, and whenever an event is registered for a subscribed shipment, we send it to the URL.

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).

  - title: Limitations
    content: |
      Maximum _50 concurrent requests_ per user is allowed. Maximum _10 concurrent requests_ per user is allowed on the test endpoint. Maximum 100 shipments can be batch created per request. But there is no limitation on how many webhooks you can have in total.

      Wildcard events and event groups like `*` and `ALL` are not supported.

      The current version doesn’t support event history, you can use the [Tracking API](/api/tracking) to get a shipment’s full history.

      Webhooks cannot be edited after they have been created.

      Expiration duration and retry timing are fixed and cannot be configured.

      Expired webhooks are not available.

      Multiple webhooks for one shipment can only be registered as long as they subscribe to different events.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

documentation:
  - title: Events
    content: |
      We recommend subscribing only to events relevant to you. By keeping the list of events (`event_groups`) as small as possible, you will not get more updates than you need and your server will not get unnecessary HTTP requests from Bring.

      Events are defined as an array with comma separated strings.

      ### Example

      ```
      "event_groups": ['IN_TRANSIT', 'NOTIFICATION_SENT', 'TERMINAL']
      ```

      ### Default events
      The list is subject to change.

      | Event | Description |
      |:-------|:--------|
      | `ATTEMPTED_DELIVERY` | Package has been attempted delivered at the door. Depending on the service it will be tried again or sent to closest pickup point. |
      | `CUSTOMS` | Package is in customs clearance. |
      | `COLLECTED` | Package has been collected at pickup address. |
      | `DELIVERED` | Package has been delivered. |
      | `DELIVERED_SENDER` | Package has been returned to the sender. |
      | `DELIVERY_CANCELLED` | Home delivery has been cancelled by the customer. |
      | `DELIVERY_CHANGED` | Date for Home delivery has been changed by customer. |
      | `DELIVERY_ORDERED` | Home delivery has been ordered. |
      | `DEVIATION` | Deviation in production. Something wrong has happened and there is a probability for delay. |
      | `HANDED_IN` | Package has been handed in to Bring. |
      | `INTERNATIONAL` | Package has been sent from origin country or arrived at destination country. |
      | `IN_TRANSIT` | Package is in transit. |
      | `NOTIFICATION_SENT` | Notification for this package has been sent by sms, push and/or mail. This can be informational and action notifications like pickup notice. |
      | `PRE_NOTIFIED` | EDI message for the package has been received by Bring. |
      | `READY_FOR_PICKUP` | Package has arrived at pickup point. |
      | `RETURN` | Package is on its way back to the sender. |
      | `TRANSPORT_TO_RECIPIENT` | Package has been loaded for delivery to the recipient. |
      | `TERMINAL` | Package is now registered/arrived at inbound/outbound storage terminal. |

      ### Deviation events

      | Event | Description |
      |:-------|:--------|
      | `NOT_REGISTERED` | Webhook not registered. This is typically triggered if the package hasn’t been handed in to Bring within two days. |
      | `EXPIRED` | Webhook expired. |

  - title: Callbacks
    content: |
      In order to receive requests from Bring, your callback URL must be accessible on the internet and able to receive requests from Bring IPs.
      You should also provide HTTPS-enabled endpoints and use some kind of authentication mechanism to minimize risk.
      Do not use self-signed certificates for HTTPS, such requests may fail.

      If you need simple authentication while receiving requests from Bring, we recommend using the header functionality provided by the webhook configuration.

      All received callbacks from Bring will be using UTC as its current timezone and is based on the following format (Java):

      ```
      "yyyy-MM-dd'T'HH:mm:ssZ"
      ```

  - title: Payload
    content: |

      ### Payload delivery headers

      `HTTP POST` payloads that are delivered to your Webhook's configured URL endpoint contains several Bring specific headers:

      | Header | Description |
      |:-------|:--------|
      | `X-Bring-Application` | Identifies the application that sent the request to your endpoint |
      | `X-bring-Correlation` | Correlation Id can be used whilst contacting Bring on error cases |
      | `X-bring-Version` | Indicates the version of application |
      | `<your headers>` | Any headers that were specified in the Webhook configuration will also be appended |

      ### Example

      Requests issued from Bring to your endpoint will look similar to this:

      ```json
      POST /callback/Webhook HTTP/1.1
      host: localhost:80
      Accept: application/json
      User-Agent: Bringcast-Webhook/v1.0.34-SNAPSHOT
      X-Bring-Application: BMEC
      X-bring-Correlation: xA3n7
      X-some-fancy-custom-header: with-some-value-that-I-expect
      Content-Type: application/json
      Content-Length: 188

      {
        "status": "IN_TRANSIT",
        "id": "ad84cbca-2e89-43e0-a301-a8d5d7fe7804",
        "shipment": "SHIPMENTNUMBER",
        "package": "TESTPACKAGEDELIVERED",
        "created": "2019-03-16T14:58:48+0000",
        "pushed": "2019-03-16T14:58:49+0000"
      }
      ```

  - title: Retries and shipments not yet registered
    content: |
      If your endpoint is down and a callback is sent, the API will try to send a request two times with 30 minutes between and a third and final time after another hour.

      If you subscribe to a shipment that hasn’t been registered with Bring, we will retry for up to two days. A notification will be sent on the webhook’s callback URL if the shipment isn’t registered in this timeframe.

oas: https://api.qa.bring.com/event-cast/api-docs
---
