---
title: Modify Delivery API
layout: api
disqus_identifier: https-developer-bring-com-api-modify-delivery
menu:
  apidocs:
    identifier: modifydelivery
    title: Modify Delivery API
    url: /api/modify-delivery
    parent: track
weight: 23

introduction:
  The Modify Delivery API can be used to modify shipments that are on
  their way to the recipient. Shipments can be stopped and returned to
  the sender, they can be rerouted to a new delivery address and it is
  possible to change the cash on delivery amount. We support all sender 
  countries with recipients in Norway, Sweden and Denmark for Stop Delivery 
  and Change Address. Detailed overview of our services can be found below.

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

documentation:
  - title: Common criteria
    content: |
      There are some events or value added services that will make Modify Delivery services unavailable.

      Any of the following events should **not** already be present on the shipment:
        - Damaged
        - Deviation
        - Returned
        - Delivered
        - Lost
        - Partly delivered
        - Stop shipment
        - In transit (to final destination)
        - Home Delivery ordered

      Any of the following value added services (VAS) should **not** already be present on the shipment:
        - Optional pickup point (0010)
        - Parcel locker (0011)
        - Home delivery from pickup point (1158)
        - Home delivery redirect (1159)
        - Parcel locker Norway (1298)
        - Ibox Sweden (1337)
        - Parcel locker same day (1373)

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
             <td>Bedriftspakke dør - dør innland</td>
             <td>1000</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Bedriftspakke Ekspress over natten</td>
             <td>1002</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Servicepakke</td>
             <td>1202</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>På døren</td>
             <td>1736</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Bedriftspakke flerkolli</td>
             <td>1988</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Bedriftspakke standard</td>
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
          <tr>
             <td>Parcel Locker</td>
             <td>5801</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Business parcel</td>
             <td>0330</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Business parcel bulk</td>
             <td>0332</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Business pallet</td>
             <td>0336</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pickup parcel</td>
             <td>0340</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pickup parcel bulk</td>
             <td>0342</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Home delivery parcel</td>
             <td>0349</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
        </tbody>
      </table>

  - title: Limitations
    content: |
      - Service codes 03XX is **not** supported for shipments addressed within Norway (domestic Norway shipments).
      - Bulk services 0332 and 0342 are **not** valid domestically in Denmark.
      - Modify cash on delivery is only available for recipients in Norway.
      
oas: https://www.qa.mybring.com/modify-delivery/api-docs
---
