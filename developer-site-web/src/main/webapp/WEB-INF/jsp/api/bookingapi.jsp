<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Booking API"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

<misc:header_v2 selected_tab="developer"/>

<div id="page">
<section id="content">
<div class="row-fluid">

<div class="span9">

<div class="box">
    <h1>Booking API (BETA)</h1>
</div>

<%--Introduction--%>
<div class="box">
    <h2><a name="introduction"></a>Introduction</h2>

    <p>
        The Bring Booking API is a logged-in service that lets mybring-users (customers of mybring.com) programmatically
        create a booking by invoking a Web Service over SOAP or by posting XML/JSON over HTTP. The API uses the same
        backend as Bring Booking web (beta.bring.no/booking) and the same PDF labels. </p>

    <p>
        We support two types of integration with the Booking API. <b>XML/JSON over HTTP</b> and <b>SOAP (over HTTP)</b>.
    </p>

    <p>
        The currently supported products include Bring Parcel products (domestic Norway), Courier Services for Nordic
        cities, and the QuickPack product line for international express shipments. </p>

    <p>
        Bring Booking uses Bring Fraktguide as the source for price and availability for the different products. We
        advise clients of the Booking API to use Fraktguiden for getting the list price and checking availability before
        sending a booking request. Note that invoice payment is the only available payment option for the Booking API.
        This means that the mybring user ID used in the booking request must have access to the customer number
        specified as payer of the booking. </p>


    <div class="information-box">BETA! This API is currently in BETA, which means that even though the code is in production and fully functional,
                                 changes might be made in the future that can break code relying on this specific version. An early beta-version of the API is available now as of january 2012, this beta will
                                 lead to a final stable v1 of the API during Q1 2012.</div>
</div>

<%--How to Use--%>


<div class="multitabs">

<ul class="tab-group">
    <li><a href="#xml" data-tab="xml">XML</a></li>
    <li><a href="#json" data-tab="json">JSON</a></li>
    <li><a href="#soap" data-tab="soap">SOAP</a></li>
</ul>


<div class="box">
<h2><a name="HTU"></a>How to Use</h2>

<p>The Booking API is a logged-in service and you need to get an API-key and authenticate before being able to use the
    API. Read more about <a href="/additionalresources/getting-api-keys.html?from=booking">how to get an API-key</a>,
    and how to use it for authentication. </p>

<h4>Authorization - by customer numbers (per specialist)</h4>

<p>
    In addition to authentication, you need to be authorized with the BUYER role in order to perform bookings.
    Read about <a href="/additionalresources/getting-api-keys.html?from=booking#buyer">how to get authorized with the buyer role</a>.
    The authorization is currently handled with customer numbers on a per specialist basis. </p>

<p>
    To perform a booking, you must specify which customer number to use. For your convenience, there is an API for
    getting the customer numbers associated with your mybring user (the customer numbers your mybring user has access
    to). The Customer number API also links customer numbers with the products the customer number is valid for. </p>


    <div data-tab="soap">For the SOAP API, the Customer number API is included as an operation in the WSDL.</div>

<div data-tab="xml">

<h4>Technical information</h4>

<ul>
    <li>
        XSD: <a href="https://beta.bring.com/booking/api/schema/booking-v1.xsd">https://beta.bring.com/booking/api/schema/booking-v1.xsd</a>
    </li>

    <li>
        Endpoint: <a href="https://www.mybring.com/booking/api/ws">https://www.mybring.com/booking/api/ws</a>
    </li>
</ul>

<h4>Versioning strategy</h4>

<p>
    Each request has a schemaVersion element indicating which release of the schema is being used in the request and
    expected schema format in the response. Important: All clients must accept new (unknown) elements in the response.
    E.g. unknown elements should be ignored. The client framework used by client must thus not crash when unknown
    elements are encountered. Note that this requirement excludes the (old, but still widely used) Apache Axis 1.x Web
    Service client framework. </p>

<h4>Testing</h4>

<p>
    This service will send actual production orders unless it is set to testing mode. </p>

<p>
    To use the test mode, you need to set the testIndicator flag on the root node. </p>

<div class="codetabs LightBorder">
    <ul class="tab-group minimal" data-tabs="tabs">
        <li><a href="#xml"></a>Example:</li>
    </ul>
    <div class="tab" data-tab="xml"><pre class="code-box">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;bookingRequest xmlns="http://www.bring.no/booking/" testIndicator="true"&gt;
    ...
&lt;/bookingRequest&gt;
</pre>
    </div>
</div>

<div>
    <h4>Content-type negotiation</h4>

    <p>The XML API uses two headers to specify request and response format.</p>
    <table>
        <thead>
        <tr>
            <th>Header name</th>
            <th>Possible header values</th>
            <th>Comment</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Content-Type</td>
            <td>application/xml</td>
            <td>This specifies the request format</td>
        </tr>
        <tr>
            <td>Accept</td>
            <td>application/xml</td>
            <td>This specifies the desired response format</td>
        </tr>
        </tbody>
    </table>
</div>

<div>
    <h4>Examples</h4>

    <p>
        All requests for the API must include the content type and authentication headers. Use HTTP POST to create new
        bookings. </p>

    <h5>HTTP-Headers</h5>

    <pre class="code-box">POST /booking/api/booking HTTP/1.1
Content-Type: application/xml
Accept: application/xml
X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
Host: www.mybring.com
</pre>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#xml"></a></li>
        </ul>
        <div data-tab="xml" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/validRequest.xml"
                   data-internal="/proxy/booking/api/bookingExamples/validRequest.xml">http://beta.bring.com/booking/api/bookingExamples/validRequest.xml </a>
                
                <p>Example response:</p>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>
        </div>
    </div>

    <h5>EXAMPLE RESPONSE: SUCCESFUL REQUEST</h5>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#xml"></a></li>
        </ul>
        <div data-tab="xml" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/successfulResponse.xml"
                   data-internal="/proxy/booking/api/bookingExamples/successfulResponse.xml">
                    http://beta.bring.com/booking/api/bookingExamples/successfulResponse.xml</a>
                
                <p>Example response:</p>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>
        </div>
    </div>

    <div>
        <h4>Shipment Labels</h4>

        <p>
            The Booking API generates and sends all necessary EDI messages to carry out the shipment. A URL to a PDF
            label is returned in responses. This label must be printed and be attached to the shipment. A URL that
            points to tracking information is also returned. </p>

        <p>
            A GET to the label URL will result in a HTTP 302 redirect to the concrete storage facility (e.g. redirect to
            Amazon S3). Ensure that your client follows these redirects. </p></div>
    <h5>EXAMPLE RESPONSE: FAILED REQUEST</h5>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#xml"></a></li>
        </ul>
        <div data-tab="xml" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/failedResponse.xml"
                   data-internal="/proxy/booking/api/bookingExamples/failedResponse.xml">
                    http://beta.bring.com/booking/api/bookingExamples/failedResponse.xml </a>
                
                <p>Example response:</p>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>
        </div>
    </div>

</div>

<div>

    <h4>Error Handling</h4>

    <p>
        If an error occurs, the following will be provided: </p>
    <table>
        <tbody>
        <tr>
            <td>uniqueId</td>
            <td>A unique log ID (UUID) that can be used as a reference for the error</td>
        </tr>
        <tr>
            <td>code</td>
            <td>An error code describing the error</td>
        </tr>
        <tr>
            <td>message</td>
            <td>
                Internationalized messages (with &lt;message lang="”xx”"&gt; elements). First version will be with
                lang=”en” (English) only. &lt;/message&gt;
            </td>
        </tr>
        </tbody>
    </table>
    <p>
        See table below for the current enumeration of error codes. A value of "true" for the attribute "suffixable"
        means that the error code is suffixed with "-SENDER" if the error is for the sending party data and "-RECIPIENT"
        if the error is for the recipient party data. </p>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#xml"></a></li>
        </ul>
        <div data-tab="xml" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request" href="http://beta.bring.com/booking/api/errors.xml"
                   data-internal="/proxy/booking/api/errors.xml"> http://beta.bring.com/booking/api/errors.xml </a>
                
                <p>Example response:</p>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>
        </div>
    </div>
</div>

<div>

    <h4>How to use the Customer API</h4>

    <p>
        You must be logged in to mybring to use the Customer API. You can test it as a normal mybring user using a web
        browser, or you can use the mybring API-key to be authenticated to use the service programmatically. </p>

    <p>
        The customer numbers are prefixed with the specialist, followed by the number. For Courier and Bring
        Express-products, we use a UUID to identify users. </p>
    <table>
        <thead>
        <tr>
            <th>Specialist</th>
            <th>Example products</th>
            <th>Example customerNumber</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Bring Parcels, Norway</td>
            <td>BPAKKE_DOR-DOR, PA_DOREN, EKSPRESS09</td>
            <td>PARCELS_NORWAY-10001123123</td>
        </tr>
        <tr>
            <td>Bring Express, Norway</td>
            <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
            <td>EXPRESS_NORWAY-2caedf20-27da-012f-3858-58b0357c4f66</td>
        </tr>
        <tr>
            <td>Bring Express, Sweden</td>
            <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
            <td>EXPRESS_SWEDEN-406077f0-27da-012f-3859-58b0357c4f66</td>
        </tr>
        </tbody>
    </table>
    <h5>How to set customer numbers in Booking API</h5>

    <p>"customerNumber" is a value returned from the Customer number API. </p>

    <div class="codetabs">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#xml"></a></li>
        </ul>

        <div class="tab-content tab-minimal">
            <div class="tab" data-tab="xml">
            <pre class="code-box">...
&lt;product&gt;
    &lt;id&gt;QUICKPACK_DAY_CERTAIN&lt;/id&gt;
    &lt;customerNumber&gt;EXPRESS_NORWAY-2caedf20-27da-012f-3858-58b0357c4f66&lt;/customerNumber&gt;
&lt;/product&gt;
...
</pre>
            </div>
        </div>
    </div>

    <h5>Customer API - Sample XML API Request</h5>
                <pre class="code-box">GET /booking/api/customers HTTP/1.1
Content-Type: application/xml
Accept: application/xml
X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
Host: www.mybring.com
</pre>
    <h5>Getting customers when logged into mybring</h5>

    <p>
        You can also suffix the resource with a supported file name extension (.xml) to force the response. This
        enables testing in a web browser that is logged in to mybring. </p>
                <pre class="code-box">GET <a href="http://www.mybring.com/booking/api/customers.xml">http://www.mybring.com/booking/api/customers.xml</a>
</pre>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#xml"></a></li>
        </ul>
        <div data-tab="xml" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/customers.xml"
                   data-internal="/proxy/booking/api/bookingExamples/customers.xml">
                    http://beta.bring.com/booking/api/bookingExamples/customers.xml </a>
                
                <p>Example response:</p>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>
        </div>
    </div>
</div>
</div>
<div data-tab="json">

<h4>Technical information</h4>

<ul>
    <li>
        XSD: <a href="https://beta.bring.com/booking/api/schema/booking-v1.xsd">https://beta.bring.com/booking/api/schema/booking-v1.xsd</a>
    </li>

    <li>
        Endpoint: <a href="https://www.mybring.com/booking/api/ws">https://www.mybring.com/booking/api/ws</a>
    </li>
</ul>

<h4>Versioning strategy</h4>

<p>
    Each request has a schemaVersion element indicating which release of the schema is being used in the request and
    expected schema format in the response. Important: All clients must accept new (unknown) elements in the response.
    E.g. unknown elements should be ignored. The client framework used by client must thus not crash when unknown
    elements are encountered. Note that this requirement excludes the (old, but still widely used) Apache Axis 1.x Web
    Service client framework. </p>

<h4>Testing</h4>

<p>
    This service will send actual production orders unless it is set to testing mode. </p>

<p>
    To use the test mode, you need to set the testIndicator flag on the root node. </p>

<div class="codetabs LightBorder">
    <ul class="tab-group minimal" data-tabs="tabs">
        <li><a href="#json"></a>Example:</li>
    </ul>

    <div class="tab" data-tab="json"><pre class="code-box">{
    "testIndicator": true,
    "schemaVersion": "1",
    ...
}
</pre>
    </div>
</div>

<div>
    <h4>Content-type negotiation</h4>

    <p>The JSON API uses two headers to specify request and response format.</p>
    <table>
        <thead>
        <tr>
            <th>Header name</th>
            <th>Possible header values</th>
            <th>Comment</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Content-Type</td>
            <td>application/json</td>
            <td>This specifies the request format</td>
        </tr>
        <tr>
            <td>Accept</td>
            <td>application/json</td>
            <td>This specifies the desired response format</td>
        </tr>
        </tbody>
    </table>
</div>

<div>
    <h4>Examples</h4>

    <p>
        All requests for the API must include the content type and authentication headers. Use HTTP POST to create new
        bookings. </p>

    <h5>HTTP-Headers</h5>

    <pre class="code-box">POST /booking/api/booking HTTP/1.1
Content-Type: application/json
Accept: application/json
X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
Host: www.mybring.com
</pre>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#json"></a></li>
        </ul>
        <div data-tab="json" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/validRequest.json"
                   data-internal="/proxy/booking/api/bookingExamples/validRequest.json">
                    http://beta.bring.com/booking/api/bookingExamples/validRequest.json </a>
                
                <p>Example response:</p>
                <pre class="code-box json response delay-snippet"></pre>
            </div>
        </div>
    </div>

    <h5>EXAMPLE RESPONSE: SUCCESFUL REQUEST</h5>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#json"></a></li>
        </ul>
        <div data-tab="json" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/successfulResponse.json"
                   data-internal="/proxy/booking/api/bookingExamples/successfulResponse.json">
                    http://beta.bring.com/booking/api/bookingExamples/successfulResponse.json </a>
                
                <p>Example response:</p>
                <pre class="code-box json response delay-snippet"></pre>
            </div>
        </div>
    </div>

    <div>
        <h4>Shipment Labels</h4>

        <p>
            The Booking API generates and sends all necessary EDI messages to carry out the shipment. A URL to a PDF
            label is returned in responses. This label must be printed and be attached to the shipment. A URL that
            points to tracking information is also returned. </p>

        <p>
            A GET to the label URL will result in a HTTP 302 redirect to the concrete storage facility (e.g. redirect to
            Amazon S3). Ensure that your client follows these redirects. </p></div>
    <h5>EXAMPLE RESPONSE: FAILED REQUEST</h5>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#json"></a></li>
        </ul>
        <div data-tab="json" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/failedResponse.json"
                   data-internal="/proxy/booking/api/bookingExamples/failedResponse.json">
                    http://beta.bring.com/booking/api/bookingExamples/failedResponse.json </a>
                
                <p>Example response:</p>
                <pre class="code-box json response delay-snippet"></pre>
            </div>
        </div>
    </div>

</div>

<div>

    <h4>Error Handling</h4>

    <p>
        If an error occurs, the following will be provided: </p>
    <table>
        <tbody>
        <tr>
            <td>uniqueId</td>
            <td>A unique log ID (UUID) that can be used as a reference for the error</td>
        </tr>
        <tr>
            <td>code</td>
            <td>An error code describing the error</td>
        </tr>
        <tr>
            <td>message</td>
            <td>
                Internationalized messages (with &lt;message lang="”xx”"&gt; elements). First version will be with
                lang=”en” (English) only. &lt;/message&gt;
            </td>
        </tr>
        </tbody>
    </table>
    <p>
        See table below for the current enumeration of error codes. A value of "true" for the attribute "suffixable"
        means that the error code is suffixed with "-SENDER" if the error is for the sending party data and "-RECIPIENT"
        if the error is for the recipient party data. </p>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#json"></a></li>
        </ul>
        <div data-tab="json" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request" href="http://beta.bring.com/booking/api/errors.json"
                   data-internal="/proxy/booking/api/errors.json"> http://beta.bring.com/booking/api/errors.json </a>
                
                <p>Example response:</p>
                <pre class="code-box json response delay-snippet"></pre>
            </div>
        </div>
    </div>
</div>

<div>

    <h4>How to use the Customer API</h4>

    <p>
        You must be logged in to mybring to use the Customer API. You can test it as a normal mybring user using a web
        browser, or you can use the mybring API-key to be authenticated to use the service programmatically. </p>

    <p>
        The customer numbers are prefixed with the specialist, followed by the number. For Courier and Bring
        Express-products, we use a UUID to identify users. </p>
    <table>
        <thead>
        <tr>
            <th>Specialist</th>
            <th>Example products</th>
            <th>Example customerNumber</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Bring Parcels, Norway</td>
            <td>BPAKKE_DOR-DOR, PA_DOREN, EKSPRESS09</td>
            <td>PARCELS_NORWAY-10001123123</td>
        </tr>
        <tr>
            <td>Bring Express, Norway</td>
            <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
            <td>EXPRESS_NORWAY-2caedf20-27da-012f-3858-58b0357c4f66</td>
        </tr>
        <tr>
            <td>Bring Express, Sweden</td>
            <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
            <td>EXPRESS_SWEDEN-406077f0-27da-012f-3859-58b0357c4f66</td>
        </tr>
        </tbody>
    </table>
    <h5>How to set customer numbers in Booking API</h5>

    <p>"customerNumber" is a value returned from the Customer number API. </p>

    <div class="codetabs">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#json"></a></li>
        </ul>

        <div class="tab-content tab-minimal">
            <div class="tab" data-tab="json">
             <pre class="code-box">...
"product": {
    "id": "BPAKKE_DOR-DOR",
    "customerNumber": "PARCELS_NORWAY-00001234567",
}
...
</pre>
            </div>
        </div>
    </div>

    <h5>Customer API - Sample JSON API Request</h5>
                <pre class="code-box">GET /booking/api/customers HTTP/1.1
Content-Type: application/json
Accept: application/json
X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
Host: www.mybring.com
</pre>
    <h5>Getting customers when logged into mybring</h5>

    <p>
        You can also suffix the resource with a supported file name extension (.json) to force the response. This
        enables testing in a web browser that is logged in to mybring. </p>
                <pre class="code-box">  GET <a href="http://www.mybring.com/booking/api/customers.json">http://www.mybring.com/booking/api/customers.json</a>
</pre>

    <div class="codetabs lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li><a href="#json"></a></li>
        </ul>
        <div data-tab="json" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/customers.json"
                   data-internal="/proxy/booking/api/bookingExamples/customers.json">
                    http://beta.bring.com/booking/api/bookingExamples/customers.json </a>
                
                <p>Example response:</p>
                <pre class="code-box json response delay-snippet"></pre>
            </div>
        </div>
    </div>
</div>
</div>
<div data-tab="soap">

    <div>
        <h4>Technical information</h4>

        <p>
            WSDL: <a href="https://beta.bring.com/booking/api/ws/booking-v1.wsdl">https://beta.bring.com/booking/api/ws/booking-v1.wsdl</a>
        </p>

        <p>
            XSD: <a href="http://beta.bring.com/booking/api/schema/booking-v1.xsd">http://beta.bring.com/booking/api/schema/booking-v1.xsd</a>
        </p>

        <p>
            Booking endpoint (use HTTP POST): <a href="https://www.mybring.com/booking/api/booking">https://www.mybring.com/booking/api/booking</a>
        </p>

        <p>
            Customer number endpoint (use HTTP GET): <a href="https://www.mybring.com/booking/api/customers">https://www.mybring.com/booking/api/booking</a>
        </p><h4>Versioning strategy</h4>

        <p>
            Each request has a schemaVersion element indicating which release of the schema is being used in the request
            and expected schema format in the response. Important: All clients must accept new (unknown) elements in the
            response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash
            when unknown elements are encountered. Note that this requirement excludes the (old, but still widely used)
            Apache Axis 1.x Web Service client framework. </p><h4>How to use the Customer API</h4>

        <p>

            You must be logged in to mybring to use the Customer API. You can test it as a normal mybring user using a
            web browser, or you can use the mybring API-key to be authenticated to use the service

            programmatically. </p>

        <p>For the SOAP API, the Customer number API is included as an operation in the <a
                href="https://beta.bring.com/booking/api/ws/booking-v1.wsdl">WSDL.</a></p>

        <p>

            The customer numbers are prefixed with the specialist, followed by the number. For Courier and Bring
            Express-products, we use a UUID to identify users. </p>

        <table>
            <thead>
            <tr>
                <th>Specialist</th>
                <th>Example products</th>
                <th>Example customerNumber</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Bring Parcels, Norway</td>
                <td>BPAKKE_DOR-DOR, PA_DOREN, EKSPRESS09</td>
                <td>PARCELS_NORWAY-10001123123</td>
            </tr>
            <tr>
                <td>Bring Express, Norway</td>
                <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
                <td>EXPRESS_NORWAY-2caedf20-27da-012f-3858-58b0357c4f66</td>
            </tr>
            <tr>
                <td>Bring Express, Sweden</td>
                <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
                <td>EXPRESS_SWEDEN-406077f0-27da-012f-3859-58b0357c4f66</td>
            </tr>
            </tbody>
        </table>

    </div>

    <div>
        <h4>Examples</h4>

        <p>
            The SOAP Body follows the same XML Schema Definition (XSD) as the XML API. </p>

        <h5>Example authentication header</h5>

        <pre class="code-box">X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
</pre>

        <h5>Sample SOAP request header</h5>

        <pre class="code-box">&lt;soapenv:Envelope
            xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
            xmlns="http://www.bring.no/booking/"&gt;
&lt;soapenv:Header/&gt;
&lt;soapenv:Body&gt;
</pre>

        <div data-tab="xml" class="tab api-call">
            <h5>Sample SOAP request body</h5>
            <a target="_blank" class="request" href="http://beta.bring.com/booking/api/bookingExamples/validRequest.xml"
               data-internal="/proxy/booking/api/bookingExamples/validRequest.xml"> </a>

            <pre class="code-box xml response delay-snippet"></pre>
        </div>
        <h5>Sample SOAP request tail</h5>
        <pre class="code-box">&lt;/soapenv:Body&gt;
&lt;/soapenv:Envelope&gt;
</pre>
        <h4>Shipment Labels</h4>

        <p>
            The Booking API generates and sends all necessary EDI messages to carry out the shipment. A URL to a PDF
            label is returned in responses. This label must be printed and be attached to the shipment. A URL that
            points to tracking information is also returned. </p>

        <p>
            A GET to the label URL will result in a HTTP 302 redirect to the concrete storage facility (e.g. redirect to
            Amazon S3). Ensure that your client follows these redirects. </p>
    </div>
</div>


</div>

</div>

</div>

<div class="span3">
    <div id="sidebar">
        <sidebar:booking-sidebar/>
    </div>
</div>
</div>
</section>
</div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>