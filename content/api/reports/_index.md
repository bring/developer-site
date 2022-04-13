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

important:
  - type: warn
    title:
      The Preliminary freight calculation report for Parcel Norway customer was
      disabled from 21.06.2021
    message: |
      The Preliminary freight calculation report for Parcel Norway customers fetched using API id PARCELS-CURRENT_CALCULATED_SHIPPING today was disabled from 21.06.2021. Historical data will be available for one year. You will find the same information in Detailed freight calculation report using API id PARCELS-ECONOMY_AND_STATISTICS instead.
  - type: info
    title: API changes after your company is converted to use new services
    message: |
      Bring is revising the service portfolio. Some of our services have been given new service names, service codes and pricing models.

      If you are existing user of Reports API, you will need to make some changes in the API after your company is converted to use new services. Please read for <a href="/api/reports/agreement_conversion">details</a>

introduction: |
  The Reports API can be used as a tool for analyzing your logistics with Bring. The API lets you generate reports within the categories _status_, _quality and deviation_, _economy_ and _environment_. Supported report formats are XML and Excel.

information:
  - title: Authentication
    content: |
      To make API requests, you will need an API key from Mybring. Steps for getting a key and description of headers can be found on the general API [Getting Started / Authentication](/api/#authentication) page.

  - title: Formats
    content: |
      REST XML/JSON over HTTP.

documentation:
  - title: Fetching reports
    content: |
      The first two steps in the process is only necessary to find customer numbers and report types for the user. You can save these IDs, and perform the generation-step without verifying the IDs. The response may get added information, so implementation should ignore new elements added to the response.

      1. Get the customers IDs
      2. Get the list of report types available for the customer
      3. Initiate report creation and get the report ID. The Report ID is initially used to monitor reports creation progress, later to get the actual report (XML or Excel file).
      4. After initiating report creation, you can check the status, if it’s in-progress, completed or failed. When completed, a URL to the actual report is returned.
      5. Download report
      6. Get list of invoice numbers for given customer or group

  - title: Invoice sources
    content: |
      For specified invoice reports, four different report types can be returned depending on the invoice source:

      ### Cargo Domestic and Sea
        - AMPHORA_DOMESTIC
        - AMPHORA_SEA

      ### Cargo International and Sysped
        - AMPHORA_BCI
        - SYSPED

      ### Parcels
        - PARCEL_DOMESTIC
---
