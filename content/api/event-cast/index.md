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
  The Event Cast API can be used to subscribe to tracking events for a given shipment using webhooks. Event notifications are automatically pushed to the subscriber as they happen, which makes it unnecessary to repeatedly poll statuses calling the Tracking API. You define an endpoint that accepts HTTP POST, and whenever an event is registered for a subscribed shipment, we send it to the URL.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Limitations
    content: |
      The API allows a maximum of _50 concurrent requests_ per user. The maximum amount of shipments that can be batch created is limited to _100 per request_. The test endpoint allows a maximum of _10 concurrent requests_ per user.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

documentation:
  - title: Events
    content: |
      When registering for a Webhook you can choose between a range of different event groups that you can subscribe for.
      It is recommended to limit the amount of events to subscribe for. Bring will send an event on each of the events occurred which in result may send quite a few HTTP-requests to your server.
      So, as a good practise, keep the list of event groups as small as possible.

      Each of the event groups corresponds to a certain set of actions that can happen to the package/shipment you subscribe for. For instance, if you subscribe to `DELIVERED`, all internal Bring-events
      will trigger a request to your defined callback URL.

      ### Event groups

      Default set of subscribeable event groups. Notice that this list is subject for change.

      | Event | Description |
      |:-------|:--------|
      | `ARRIVED_DELIVERY` | Arrived Delivery point - This is when a container arrives at recipients address, and can start unloading. |
      | `ARRIVED_COLLECTION` | Arrived for collection at pickup point |
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

      There is also a specific set of events that will be sent if something deviates from the normal event flow:

      | Event | Description |
      |:-------|:--------|
      | `NOT_REGISTERED` | Webhook not registered. This might be due to the parcel-/shipment-number not being found with Bring' systems and can trigger after up to two - 2 - days |
      | `EXPIRED` | Webhook expired |

      #### Subscribing to multiple event groups

      The Webhook API supports the possibility to subscribe to multiple event groups at the same time.
      Doing so requires that groups are separated with comma and is defined as an array.
      Example:

      ```
      ['IN_TRANSIT', 'NOTIFICATION_SENT', 'TERMINAL', .., ..]
      ```

      Need more examples? See the "Create Webhook" section below.

  - title: Receiving Callbacks
    content: |
      In order to receive requests from Bring, your callback URL must be accessible on the internet and able to receive requests from Bring IPs.
      Additionally, to minimize risk, you should also provide HTTPS-enabled endpoints and use some kind of authentication mechanism.
      For HTTPS, please do not use self-signed certificates, as requests may fail from Bring' side and you'll receive no requests.

      If you need a simple authentication whilst receiving requests from Bring, we recommend utilizing the header functionality provided by the Webhook configuration.

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
  - title: Q & A
    content: |

      **Can I have multiple Webhooks for the same parcel?**<br>
      You can register for multiple Webhooks on the same parcel/shipment, as long as the event groups are different for each registration.

      **How many active Webhooks can I have simultaneously?**<br>
      Currently there is no limitation.

      **Is the expiration duration configurable?**<br>
      No.

      **Can I get a history of events that were sent for a subscription?**<br>
      Not in this version. It may be available in the future. Please note that you may use the [Tracking API](/api/tracking) if you'd like the entire list of events that has happened for a lifecycle related to a shipment.

      **Will I be able to see my previous/expired Webhooks (active and inactive)?**<br>
      No.

      **What happens if our endpoint is down and a callback is being sent?**<br>
      We'll try issuing a request to your defined endpoint up to three - 3 - times with a delay on 30 minutes for the two first, then wait an hour for the last retry.
      After this, callbacks will not be retried.

      **Do you support wildcard events/event groups (e.g `*` or `ALL`)?**<br>
      No.

      **Do you support modifying existing active webhooks?**<br>
      No.

      **My shipment is not yet registered with Bring, will registering for Webhook work related to that tracking number?**<br>
      Yes.

      When you subscribe for a parcel that does not yet exist in Bring' systems, a retry mechanism will try for up to two - 2 - days to ensure that the Webhook will be registered when the parcel is found internally.
      Eventually, if the package was not found with Bring within this timeframe - a notification will be sent on the callback URL configured for that Webhook which notifies this.

      **Note**: Retry-timing is non-configurable.
---
