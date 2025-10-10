---
title: Bulksplit API
layout: api
menu:
  apidocs:
    identifier: bulksplit
    title: Bulksplit API
    url: /api/bulksplit
    parent: book
weight: 21
params:
  oas: https://api.bring.com/bulksplit/openapi

  introduction: |
    The Bulksplit API provides an API for:
    1. reserving an id for use on the Waybill of a bulk-shipment and
    2. registering details of the pallets/load carriers that are involved in the bulk-shipment.
    
    The bulk-shipment-id can be provided when booking the individual shipments in order to support a better tracking experience for the recipient.

  information:
    - title: Authentication
      content: |
        To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](./authorization).
    - title: Formats
      content: |
        REST JSON over HTTP.

  documentation:
    - title: Workflow
      content: |
        When working with the Bulksplit API the process is as follows:

        ### 1. Reserve an id for the bulk-shipment

        Use the `/bulk-shipment-ids` endpoint to reserve an identifier, for use on the CMR waybill documentation and identifies the bulk shipment.

        ### 2. Book the shipping for the individual parcels/letters contained in the bulk shipment

        Using the [booking-api](../booking) book shipping for the individual parcels or letters contained in this bulk shipment placing the reserved CMR ID into the `consignments[0].references.consolidatedShipmentId` field.

        ```json
        {
          "consignments": [
            {
              "references": {
                "consolidatedShipmentId": "your reserved bulk-shipment-id"
              }
            }
          ]
        }
        ```
        
        ### 3. Register the bulk-shipment and produce labels

        Use the `/bulk-shipments/{bulk-shipment-id}` endpoint to register the bulk-shipment providing all the necessary metadata to fill out the CMR waybill and routing labels for each of the pallets, the API response contains links to the PDF
        representation of these labels.
    
    - title: Lifetime of reserved id
      content: |
        Unused bulk-shipment-ids will be deleted after 1 year.

    - title: Pallet types
      content: |
        Valid pallet types are:
        * `EUR_PALLETS`
        * `OTHER_PALLETS`
        * `OTHER_LOAD_CARRIER`
    - title: Service types
      content: |
        Service types are identified by their 4 digit codes:
        * `0332` : Business Parcel Bulk
        * `0334` : Express Nordic 09:00 Bulk
        * `0342` : PickUp Parcel Bulk
        * `0344` : Parcel Locker
        * `0349` : Home Delivery Parcel
        * `0336` : Business Pallet
        * `0370` : Bring Parcel Connect
        * `0345` : Home Delivery Mailbox

        In addition Letter pallet can be registered with the value `LETTER_PALLET`.
---
