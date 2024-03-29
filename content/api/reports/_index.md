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
    title: API endpoints being removed
    message: |
      The /reports/api/invoices endpoints will be removed from the Mybring Reports application after ___1. September 2023___.
      New endpoint can be found in Invoice Archive with API endpoints /invoicearchive/api/invoices
      The replacement API is [documented here](/api/invoice/#list-of-all-invoices-get)
  - type: info
    title: API changes after your company is converted to use new services
    message: |
      Bring is revising the service portfolio. Some of our services have been given new service names, service codes and pricing models.

      If you are an existing user of Reports API, you will need to make some <a href="/api/reports/agreement_conversion">changes after your company is converted</a> to use new services.

introduction: |
  The Reports API can be used as a tool for analyzing your logistics with Bring. The API lets you generate reports within the categories _status_, _quality and deviation_, _economy_ and _environment_. Supported report formats are XML and Excel.

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).
  - title: Rate limiting
    content: |
      Clients exceeding multiple identical requests in a short time period will be throttled, and the response will contain HTTP status code 429.
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

  - title: Invoice sources
    content: |
      For specified invoice reports, three different report types can be returned depending on the invoice source:

      ### Parcels
        - PARCEL_DOMESTIC
        - PARCEL_INTERNATIONAL

      ### Cargo international or Oil express
        - AMPHORA_BCI
        - SYSPED
        - WINSPED_BCI

      ### Cargo domestic, Sea or Home delivery
        - AMPHORA_DOMESTIC
        - AMPHORA_SEA
        - ALYSTRA

---
