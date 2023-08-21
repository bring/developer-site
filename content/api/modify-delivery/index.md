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
  The Modify Delivery API can be used to modify shipments that are on
  their way to the recipient. Shipments can be stopped and returned to
  the sender, they can be rerouted to a new delivery address or it is
  possible to change the cash on delivery amount. We support
  domestic and cross border services in Norway, Sweden and Denmark, but
  please note that there are limitations to our services in Sweden and Denmark and that
  Modify COD currently is not supported outside Norway. For full overview of valid service
  and route combinations, see below.

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

      Any of the following events should not already be present on the shipment:
        - Damaged
        - Deviation
        - Returned
        - Delivered
        - Lost
        - Partly delivered
        - Stop shipment
        - In transit (to final destination)
        - Home Delivery ordered

      Any of the following value added services shout not already be present on the shipment:
        - Optional pickup point (0010)
        - Parcel locker (0011)
        - Home delivery from pickup point (1158)
        - Home delivery redirect (1159)
        - Parcel locker Norway (1298)
        - Ibox Sweden (1337)
        - Parcel locker same day (1373)

  - title: Supported services in Norway
    content: |
      These services are available only for domestic Norway shipments, meaning shipments that are going from and to an address in Norway.
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
             <td>Yes</td>
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
             <td>Yes</td>
          </tr>
          <tr>
             <td>På døren</td>
             <td>1736</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Bedriftspakke flerkolli</td>
             <td>1988</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
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
        </tbody>
      </table>

  - title: Supported services outside Norway
    content: |
      Outside Norway we support stop shipment and change address, but with limitations.
      Please see the detailed overview below for each of the Modify Delivery
      services and when they are available.

  - title: Stop shipment outside Norway
    content: |
      These services are available on domestic shipments in Sweden and Denmark, and cross border shipments for Norway, Sweden and Denmark.
      Please verify in the table below the service and from - to country is valid for your shipments.
      <table>
        <thead>
         <tr>
           <th>Service</th>
           <th>Service Code</th>
           <th>NO - NO</th>
           <th>NO - SE</th>
           <th>NO - DK</th>
           <th>SE - NO</th>
           <th>SE - SE</th>
           <th>SE - DK</th>
           <th>DK - NO</th>
           <th>DK - SE</th>
           <th>DK - DK</th>
         </tr>
        </thead>
        <tbody>
          <tr>
             <td>Business parcel</td>
             <td>0330</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Business parcel bulk</td>
             <td>0332</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Business pallet</td>
             <td>0336</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pickup parcel</td>
             <td>0340</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pickup parcel bulk</td>
             <td>0342</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Home delivery parcel</td>
             <td>0349</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
        </tbody>
      </table>

  - title: Change address outside Norway
    content: |
      These services are available **only** on shipments being sent to Norway from Sweden or Denmark.
      <table>
        <thead>
         <tr>
           <th>Service</th>
           <th>Service Code</th>
         </tr>
        </thead>
        <tbody>
          <tr>
             <td>Business parcel</td>
             <td>0330</td>
          </tr>
          <tr>
             <td>Business parcel bulk</td>
             <td>0332</td>
          </tr>
        </tbody>
      </table>
oas: https://www.qa.mybring.com/modify-delivery/api-docs
---
