---
title: Shipment API
layout: api
disqus_identifier: https-developer-bring-com-api-shipment
menu:
  apidocs:
    identifier: shipment
    title: Shipment API
    url: /api/shipment
    parent: book
weight: 22

introduction: |
  The Shipment API is used to book shipments and send transport instructions to Bring. For customers using EDIFACT today, switching to the Shipment API is a good alternative when implementing new automated order solutions. The API supports the majority of services in Bring's service portfolio and offers options to both create, update and delete bookings and instructions. You may use your own SSCC-compliant labels and your own shipment number series. Using the API requires a good knowledge of Bring's service portfolio and logistics value chain as the level of content validation is low [compared to the Booking API](/api/booking-shipment/).

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON over HTTP. ShipmentAPI endpoints will assume all requests are ISO-8859-1 encoded.

documentation:
  - title:
    content: |
      In addition to the documentation on this pages feel free to check out our [swagger page](https://bapiqa.bring.com/Shipment/swagger) for this API.

  - title: Checking prices and availability
    content: |
      The Shipment API uses Shipping Guide as the source for price and availability (when supported in the Shipping Guide) for the different products. We advise clients of the Shipment API to use [Shipping Guide API](/api/shipping-guide_2/) for getting the list price and checking availability before sending a booking request. Note that invoice payment is the only available payment option for the Shipment API. This means that the Mybring user ID used in the booking request must have access to the customer number specified as payer of the booking.

  - title: Shipment API Instructions
    content: |
      A submission to Shipment API must have a ShipmentType of one of the following
      - [Instruction](/api/shipment/#create-shipment)
      - [Booking](/api/shipment/#create-shipment-booking)
      - Healthcheck

  - title: HealthCheck
    content: |
      This is simply to check if the service is available.

  - title: Unit Codes
    content: |
      A number of different unit codes are used throughout Shipment API. Many of which are listed in the layouts below but the definative list is displayed here for ease of reference.
      #### Cash On Delivery Account Type
      - Bank
      - Bankgiro
      - Plus
      - Post
      - Iban
      - Other
      #### Cash On Delivery Transaction Identifier Type
      - PQ
      - SS
      #### Cash On Delivery Type
      - CashOnDelivery
      - PrePaid
      - CreditCard
      #### Length Unit Code
      - CMT
      - DMT
      - MTR
      #### Party Role
      - DespatchParty
      - DeliveryParty
      - OrderingParty
      - FreightPayer
      - CashOnDeliveryPayee
      - GoodsReturnParty
      - NotifyParty
      - TransportCompany
      #### Temperature Measure Unit Code
      - CEL
      - FAH
      #### Volume Unit Code
      - DMQ
      - MTQ
      #### Weight Unit Code
      - GRM
      - KGM
      #### Dangerous Goods Flashpoint Unit Code
      - CEL
      - FAH
      #### Dangerous Goods Restriction Type
      - Tunnel
      #### Date And Times
      - DocumentDate
      - PickupRequested
      - PickupEarliest
      - PickupLatest
      - DeliveryRequested
      - DeliveryEarliest
      - DeliveryLatest
      #### Delivery Terms Type
      - Incoterms
      - Freightterms
      - Combiterms
      - PrePaid
      - ThirdParty
      #### Exchangeable Equipment Unit Type
      - EFP
      #### Free Text Usage
      - PICKUP_INSTRUCTIONS
      - DELIVERY_INSTRUCTIONS
      - CARRIER_INSTRUCTIONS
      #### Reference Type
      - DESPATCH_ADVICE_NUMBER
      - TRANSPORT_DOCUMENT_NUMBER
      - CUSTOMS_DECLARATION_NUMBER
      - ACCOUNT_NUMBER
      - PROJECT_NUMBER
      - SECONDARY_CUSTOMS_REFERENCE
      - TEMPORARY_IMPORTATION_DOCUMENT_NUMBER
      - SENDERS_REFERENCE
      - AIR_WAYBILL
      - BILL_OF_LADIN
      - BOOKING_REFERENC
      - ROAD_CONSIGNMENT_NOTE
      - SHIPMENT_REFERENCE
      - TRANSPORT_INSTRUCTION
      - GOODS_NUMBE
      - MESSAGE_SENDERS_IDENTITY
      #### Shipment Type
      - Instruction
      - Booking
      - Healthcheck
      #### Tariff Reference
      - COOL_ABERRANT
      - GENERAL_CARGO
      - MINERAL_WATERCHILLED_0_4
      - TIRES
      - COOL_5_8
      - FISH_0_4
      - FROZEN_CARGO
      - FROST_FREE_CARGO
      - EARLY_DELIVERY
      - LATE_DELIVERY
      - SPECIAL_CARGO
      - COOL_0_2
      #### Tariff Reference Values
      - CHLR
      - GNCG
      - BWRG
      - CHLL
      - DEKK
      - COOL
      - FISH
      - FRZE
      - WARM
      - GCED
      - GCLD
      - SPCL
      - CH02
      #### Transport Company
      - BCI
      - BCIOXP
      - BCN
      - BCS
      - BDD
      - BDF
      - BDS
      - BEF
      - BEX
      - BFN
      - BFS
      - BID
      - BPI
      - BPN
      - TIE
      - NPB
      #### Express Sub Transport Company
      - ALY
      - QUI
      - GLW
      #### Cargo Sub Transport Company
      - OXP
      #### Valid Transport Companies
      - BEX
      - BCI
      - BCN
      #### Valid Sub Transport Companies
      - ALY
      - GLW
      - OXP
      #### Update Indicator
      - Original
      - Update
      - Replace
      - Delete
---
