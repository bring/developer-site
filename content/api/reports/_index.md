---
title: Reports API
layout: api
disqus_identifier: https-developer-bring-com-api-reports
menu:
  apidocs:
    identifier: reports
    title: Reports API
    url: /api/reports
    parent: rni
weight: 51

documentation:
  - title: Introduction
    content: |
      The Reports API is used to generate shipment reports, the same set of reports that are available in mybring.

      Each Mybring user is associated with a set of customers and has access to specific set of report types for which they can generate a report.

      The following steps (which will be API calls) enables you to generate a report:

      1. Get the customers associated with the mybring user.
      2. Get the report types allowed for a customer.
      3. Initiate report creation and get report ID. The Report ID is initially used to monitor reports creation progress, later to get the actual report (XML or Excel file).
      4. After initiating report creation, you can check the status if the job. I.e. if it is in progress, completed or failed. When status is completed, a URL for fetching the actual report is returned.
      5. The report can then be downloaded.

      For all the above APIs we need to identify and authenticate the user. This is done by passing the following header information. These are described in Reference section:

      - Mybring username (email address)
      - API Key

      All these APIs are available in json and xml formats.

  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: How to use
    content: |
      The Reports API is a logged-in service and you need to get an API-key and authenticate before being able to use the API.

      The two first steps in the process is only necessary to find customer numbers and report types for the user. You can save these IDs, and perform the generation-step without verifying the IDs. The response may get added information, so implementation should ignore new elements added to the response.

      1. Get customer IDs
      2. Get list of available reports
      3. Generate report
      4. Check status of report
      5. Download report
      6. Get list of invoice numbers for given customer or group

      ### Available invoice sources
      For specified invoice report 4 different types of report can be returned depending on the invoice source. Those are

      #### Cargo Domestic and Sea
        - AMPHORA_DOMESTIC
        - AMPHORA_SEA

      #### Cargo International and Sysped
        - AMPHORA_BCI
        - SYSPED

      #### Parcels
        - PARCEL_DOMESTIC
---

<div class="message--warn maxw48r pam mbl">
  <strong>The Preliminary freight calculation report for Parcel Norway customer was disabled from 21.06.2021</strong>
  <br /><br />
  The Preliminary freight calculation report for Parcel Norway customers fetched using API id PARCELS-CURRENT_CALCULATED_SHIPPING today,
  was disabled from 21.06.2021. Historical data will be available for one year.
  You will find the same information in Detailed freight calculation report using API id PARCELS-ECONOMY_AND_STATISTICS instead.
  <br /><br />
  <strong>API changes after your company is converted to use new services</strong>
  <br /><br />
  Bring is revising the service portfolio. Some of our services have been given
  new service names, service codes and pricing models.
  <br /><br />
  If you are existing user of Reports API, you will need to make some changes in
  the API after your company is converted to use new services. Please read for
  <a href="/api/reports/agreement_conversion">details</a>
</div>
