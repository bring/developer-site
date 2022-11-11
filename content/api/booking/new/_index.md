---
title: Booking API
layout: api
hidden: true

introduction: |
  The Booking API is used to book shipments and supports more than 60 different services as well as a variety of additional services. Each shipment is booked individually, and shipment number, tracking link, EDI-prenotification, label and other transport documents are created as part of the transaction. Additionally, it's possible to book pickups. The API can also provide a list of supported services and countries based on your agreement with Bring (i.e. the customer numbers attached to your user). The Booking API has similarities with the Shipment API, but there are [differences](/api/booking-shipment/).

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page. In addition to authentication, you need to be [authorized](#authorization).

  - title: Rate limiting
    content: |
      Clients exceeding 18 requests per second will be throttled, and the response will contain http status code 429. If you have a use case requiring rates above the limit, please contact developer-booking@bring.com for assistance.

  - title: Formats
    content: |
      REST XML/JSON over HTTP and SOAP over HTTP.
      Booking endpoints will assume all requests are UTF-8 encoded.

documentation:
  - title: Content
    content:  |
      
      <h4 class="dev-anchored">
        <a href="./new/versioning">Versioning</a>
      </h4>
      <br/>

      <h4 class="dev-anchored">
        <a href="./new/authorization">Authorization</a>
      </h4>
      <br/> 

      <h4 class="dev-anchored">
        <a href="./new/performance">Performance</a>
      </h4>
      <br/>
      
      <h4 class="dev-anchored">
        <a href="./new/price-availability">Checking prices and availability</a>
      </h4>
      <br/>

      <h4 class="dev-anchored">
        <a href="./new/labels">Making labels</a>
      </h4>
      <br/> 

      <h4 class="dev-anchored">
        <a href="./new/rfid">RFID labels for Mailbox Parcel (3570)</a>
      </h4>
      <br/>

      <h4 class="dev-anchored">
        <a href="./new/qr">Generating QR Codes</a>
      </h4>
      <br/>

      <h4 class="dev-anchored">
        <a href="./new/free-return">Free return of parcel(s)</a>
      </h4>
      <br/>

      <h4 class="dev-anchored">
        <a href="./new/customs">Customs Export information</a>
      </h4>
      <br/>

      <h4 class="dev-anchored">
        <a href="./new/lq">LQ - Limited quantities (of dangerous goods)</a>
      </h4>
      <br/>

     
oas: https://www.qa.mybring.com/booking-api/v3/api-docs
---
