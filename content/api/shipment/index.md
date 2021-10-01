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

documentation:
  - title: Introduction
    content: |
      The Shipment API is a logged-in service that lets Mybring users (customers of Mybring) programatically create a instruction or a booking by invoking a Web Service by posting XML/JSON over HTTP.

      The Shipment API uses Shipping Guide as the source for price and availability (when supported in the Shipping Guide) for the different products. We advise clients of the Shipment API to use Shipping Guide API for getting the list price and checking availability before sending a booking request. Note that invoice payment is the only available payment option for the Shipment API. This means that the Mybring user ID used in the booking request must have access to the customer number specified as payer of the booking.

      We are continually rolling out support for more of Posten / Brings products and aim to support all available products in this API within a short time. In addition to the documentation on this pages feel free to check out our [swagger page](https://bapiqa.bring.com/Shipment/swagger) for this API.

      This API has similarities with the Booking API, but there are differences. Read more about the [differences between the Booking API and the Shipment API](/api/booking-shipment/).

  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: ShipmentAPI Instructions
    content: |
      A submission to ShipmentAPI must have a ShipmentType of one of the following
      - [Instruction](/api/shipment/#create-shipment)
      - [Booking](/api/shipment/#create-shipment-booking)
      - Healthcheck

  - title: HealthCheck
    content: |
      This is simply to check if the service is available.

  - title: Unit Codes
    content: |
      A number of different unit codes are used throughout ShipmentAPI. Many of which are listed in the layouts below but the definative list is displayed here for ease of reference.
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
