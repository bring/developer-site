---
title: Modify Delivery API
layout: api
support: true
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
  - title: New Service Update Contact Details
    content: |
      In January 2025, we launched a new service for updating the recipient's phone number and email. This service is free to use and can be used more than once per shipment.
      Key notes about Update Contact Details:
        - You can only update contact details on shipments belonging to your customer number.
        - If there are no contact details for the recipient, this service can be used to add them.
        - You must provide either phone number or an email, the request cannot be empty.
        - Existing contact details will not be changed if the request is empty for that field. For example, when sending a query for updating the email, only the email field will be updated, and the existing phone number will remain unchanged.
        - Phone numbers must be prefixed with the area code, and must match the recipient's country. For example, a shipment going to Norway can only be updated with +47 phone numbers.

  - title: Common Invalidating Scenarios
    content: |
      There are scenarios that invalidates the services in Modify Delivery. While we cannot list every specific scenario,
      we will give you insight into some common events and value added services that cause one or more of our services to be unavailable.
      If you are unsure about why your shipment is not qualified for a service, we have an Available Modification endpoint that provides the failure reasons for your shipment.

      Events that may invalidate our services:
        - Damaged
        - Delivered
        - Deviation
        - Returned
        - Home Delivery ordered
        - In transit (for delivery)
        - Lost
        - Partly delivered
        - Stopped shipment
        - Ready for pickup

      Value Added Services that may invalidate our services:
        - Optional pickup point (0010)
        - Parcel locker (0011)
        - Home delivery from pickup point (1158)
        - Home delivery redirect (1159)
        - Parcel locker Norway (1298)
        - Ibox Sweden (1337)
        - Parcel locker same day (1373)
        - Stop Delivery ordered (1220)

  - title: List of Supported Service Codes
    content: |
      <table>
        <thead>
         <tr>
           <th>Service</th>
           <th>Service code</th>
           <th>Stop shipment</th>
           <th>Change COD</th>
           <th>Change Address</th>
           <th>Update Contact Details</th>
         </tr>
        </thead>
        <tbody>
          <tr>
             <td>Bedriftspakke dør - dør innland</td>
             <td>1000</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Bedriftspakke Ekspress over natten</td>
             <td>1002</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Servicepakke</td>
             <td>1202</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>På døren</td>
             <td>1736</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Bedriftspakke flerkolli</td>
             <td>1988</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Bedriftspakke standard</td>
             <td>3500</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Pakke til bedrift ekspress</td>
             <td>4850</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
             <td>No</td>
          </tr>
          <tr>
             <td>Pakke til bedrift</td>
             <td>5000</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pakke hjem pluss</td>
             <td>5600</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pakke til hentested</td>
             <td>5800</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Parcel Locker</td>
             <td>5801</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Business Parcel</td>
             <td>0330</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Business Parcel Bulk</td>
             <td>0332</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Business Pallet</td>
             <td>0336</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pickup Parcel</td>
             <td>0340</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pickup Parcel Bulk</td>
             <td>0342</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Pickup Parcel Box</td>
             <td>0344</td>
             <td>Yes</td>
             <td>No</td>
             <td>No</td>
             <td>Yes</td>
          </tr>
          <tr>
             <td>Home Delivery Parcel</td>
             <td>0349</td>
             <td>Yes</td>
             <td>No</td>
             <td>Yes</td>
             <td>Yes</td>
          </tr>
        </tbody>
      </table>

  - title: Limitations
    content: |
      - Service codes 03XX is **not** supported for shipments addressed within Norway (domestic Norway shipments).
      - Bulk services 0332 and 0342 are **not** valid domestically in Denmark.
      - Change Cash on Delivery is only available for recipients in Norway.
      
oas: https://www.qa.mybring.com/modify-delivery/api-docs
---
