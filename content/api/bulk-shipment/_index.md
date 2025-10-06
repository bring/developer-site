---
title: Bulk Shipment API
layout: api
menu:
  apidocs:
    identifier: bulkshipment
    title: Bulk Shipment API
    url: /api/bulk-shipment
    parent: book
weight: 21
params:
  oas: https://api.bring.com/bulk-shipment/openapi

  introduction: |
    The Bulk Shipment API provides an API for reserving CMR IDs. These CMR IDs
    can then be provided when booking individual shipments in order to connect
    them to the bulk shipment. When a bulk shipment is ready this API can then
    be used to order collection which will produce a waybill and routing
    labels for each of the registered pallets (or other load carriers).

  information:
    - title: Authentication
      content: |
        To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/). In addition to authentication, you need to be [authorized](./authorization).

  subpages:
    title: Special topics

  documentation:
    - title: Workflow
      content: |
        When working with the Bulk Shipment API the process is as follows:

        ### 1. Reserve a CMR ID

        Use the `/shipment-numbers` endpoint to reserve an identifier for use on the CMR documentation for the bulk shipment.

        ### 2. Book the shipping for the individual parcels/letters contained in the bulk shipment

        Using the booking-api book shipping for the individual parcels or letters contained in this bulk shipment placing the reserved CMR ID into the `consignments[0].references.consolidatedShipmentId` field.
        
        ### 3. Book collection of the bulk-shipment and produce labels

        Use the `/shipments/{bulk-shipment-id}` endpoint to book collection of the bulk-shipment providing all the necessary metadata to fill out the Waybill and Routing labels for each of the pallets, the API response contains links to the PDF
        representation of these labels.
---
