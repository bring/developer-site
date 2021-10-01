---
title: Modify Delivery API
layout: api
disqus_identifier: https-developer-bring-com-api-modify-delivery
menu:
  apidocs:
    identifier: modifydelivery
    title: Modify Delivery API
    url: /api/modify-delivery
    parent: book
weight: 23

documentation:
  - title: Introduction
    content: |
      The modify delivery api is used to modify a shipment currently on its way.
      Below are the various modifications (which will be API calls) supported:
        - Stop shipment.
        - Change cash on deivery.
        - Change Address

  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Common Criteria
    content: |
      To successfully modify a delivery, the shipment must have both sender and recipient address located in Norway. Additionally, any of the following events should not be present on the shipment:
        - Damaged
        - Deviation
        - Returned
        - Delivered
        - Lost
        - Partly delivered
        - Stop Shipment

  - title: Service overview
    content: |
      The table shows currently supported services and the corresponding usage for modify delivery APIs.
      <table style = "width 100%">
        <thead>
         <tr>
           <th style="text-align: left">Service</th>
           <th style="text-align: left">Service code</th>
           <th style="text-align: left">Stop shipment</th>
           <th style="text-align: left">Change COD</th>
           <th style="text-align: left">Change Address</th>
         </tr>
        </thead>
        <tbody>
          <tr>
             <td>Bedriftspakke Dør - Dør Innland</td>
             <td>1000</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Bedriftspakke ekspress over natten</td>
             <td>1002</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Klimanøytral Servicepakke</td>
             <td>1202</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>På Døren</td>
             <td>1736</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Konv Bedriftspakke Flerkolli</td>
             <td>1988</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Bedriftspakke Standard</td>
             <td>3500</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Ekspress neste dag</td>
             <td>4850</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Pakke til bedrift</td>
             <td>5000</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pakke levert hjem</td>
             <td>5600</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pakke til hentested</td>
             <td>5800</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>

        </tbody>
      </table>
---
