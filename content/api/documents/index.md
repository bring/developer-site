---
title: Documents API
layout: api
support: true
menu:
  apidocs:
    identifier: documents
    title: Documents API
    url: /api/document-search
    parent: rni
weight: 52

Introduction: |
  The Documents API can be used to fetch documents related to your shipments. 

information:
  - title: Authentication
    content: |
      To integrate with the Bring APIs, you will need a Mybring user account with an API key. Information about prerequisites and authentication headers can be found on the general API [Getting Started page](/api/).

  - title: Format
    content: |
      REST JSON over HTTP when searching for documents. The documents contains JSON or PDF. 
      
oas: https://www.mybring.com/document-search/v3/api-docs

documentation:
  - title: Document types
    content: |
      The only type of documents that are currently available in the API are customs documents. These are the same that can be found customs document section in Mybring web. 
      There exists both JSON and PDF variants of most customs declaration documents.
    
---
