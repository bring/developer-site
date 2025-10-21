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
  ## FIXME: Need to update after haproxy tests are runnable
  oas: https://api.bring.com/bulksplit/openapi

  introduction: |
    The Bulksplit API provides three functions:
    
    1. Reserving bulk shipment IDs. These IDs can optionally be provided at
       time of booking the individual shipments to enable a better tracking
       experience.
    2. Producing routing labels for a shipment. This is an optional step if you
       want to create a routing label when you start work on loading a pallet.
    3. Registering the complete shipment. When a pallet or group of pallets is
       ready for shipping the details about final weight and, if necessary,
       customs documentation should now be provided. At this point we can
       produce a CMR waybill for the shipment and routing labels if your
       workflow involves labelling at the end.

  information:
    - title: Authentication
      content: |
        To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](./authorization).

  documentation:
    - title: Workflow
      content: |
        When working with the Bulksplit API the process is as follows:

        ### 1. Reserve a bulk shipment ID

        Use the `/bulk-shipment-ids` endpoint to reserve an identifier for use on the CMR documentation and identifies the bulk shipment.

        ### 2. (Optional) Produce routing labels

        Use the `/bulk-shipments/{bulk-shipment-id}/routing-labels` endpoint to reserve an identifier for use on the routing label and produce a printable PDF.

        If you do not need to print routing labels until the whole shipment is registered this is not necessary.

        ### 3. (Optional) Book the shipping for the individual parcels/letters contained in the bulk shipment

        Using the [booking-api](../booking) book shipping for the individual parcels or letters contained in this bulk shipment placing the reserved CMR ID into the `consignments[0].references.consolidatedShipmentId` field.
        
        ### 4. Register the bulk-shipment and produce labels

        Use the `/bulk-shipments/{bulk-shipment-id}` endpoint to register the bulk-shipment providing all the necessary metadata to fill out the Waybill and Routing labels for each of the pallets, the API response contains links to the PDF
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
