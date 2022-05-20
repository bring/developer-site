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

introduction:
  The Modify Delivery API can be used to modify shipments that currently are on
  their way to the recipient. Shipments can either be stopped and returned to
  the sender, or they can be rerouted to a new delivery address. It is also
  possible to change the cash on delivery amount. At the moment, Parcel Norway
  domestic services (with the exception of Pakke i postkassen and return
  services) are supported.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

documentation:
  - title: Common criteria
    content: |
      The shipment must have both sender and recipient address located in Norway. Additionally, any of the following events should not already be present on the shipment:
        - Damaged
        - Deviation
        - Returned
        - Delivered
        - Lost
        - Partly delivered
        - Stop shipment

  - title: Supported services
    content: |
      <table>
        <thead>
         <tr>
           <th>Service</th>
           <th>Service code</th>
           <th>Stop shipment</th>
           <th>Change COD</th>
           <th>Change Address</th>
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

oas: https://www.qa.mybring.com/modify-delivery/api-docs
---
