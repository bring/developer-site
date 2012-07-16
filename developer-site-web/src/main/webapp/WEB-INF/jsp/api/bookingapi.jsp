<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
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
    <h1>Booking API</h1>
</div>

<div class="box">
    <h2><a name="introduction"></a>Introduction</h2>

    <p>
        The Bring Booking API is a logged-in service that lets mybring-users (customers of mybring.com) programmatically
        create a booking by invoking a Web Service over SOAP or by posting XML/JSON over HTTP. The API uses the same
        backend as Bring Booking web (beta.bring.no/booking) and the same PDF labels. </p>

    <p>
        We support two types of integration with the Booking API. XML/JSON over HTTP, and SOAP (over HTTP). </p>

    <p>
        The currently supported products include Bring Parcel products (domestic Norway), Courier Services for Nordic
        cities, and the QuickPack product line for international express shipments. </p>

    <p>
        Bring Booking uses <a href="../shipping-guide/apireference.html">Bring Fraktguide</a> as the source for price
        and availability for the different products. We advise clients of the Booking API to use Fraktguiden for getting
        the list price and checking availability before sending a booking request. </p>

    <h4>Billing and Payment</h4>
    <p>
        Note that invoice payment is the only available payment option for the Booking API. This means that the mybring
        user ID used in the booking request must have access to the customer number specified as payer of the
        booking. </p>

    <p>
        The API is currently under development and will have multiple releases, each extending the available
        functionality and products. An early beta-version of the API is available now as of january 2012, this beta will
        lead to a final stable v1 of the API during Q1 2012. </p>

</div>

<div class="box">
    <h2><a name="reference"></a>Reference</h2>

    <p>Request prefix: <br/><code></code></p>

    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><a href="//beta.bring.com/booking/api/bookingExamples/validRequest.xml">../api/ws/booking-v1.wsdl</a></td>
            <td>
                This is an example of how an XML request may look like.
            </td>
        </tr>
        <tr>
            <td><a href="//beta.bring.com/booking/api/bookingExamples/validRequest.json">../api/bookingExamples/validRequest.json</a></td>
            <td>This is an example of how a JSON request may look like.
            </td>
        </tr>
        <tr>
            <td><a href="https://beta.bring.com/booking/api/ws/booking-v1.wsdl">../api/ws/booking-v1.wsdl</a></td>
            <td>The WSDL for the SOAP API.
            </td>
        </tr>
        <tr>
            <td><a href="https://www.mybring.com/booking/api/booking">mybring.com/booking/api/booking</a></td>
            <td>The endpoint for Booking and Customer.</td>
        </tr>
        </tbody>
    </table>
</div>

<div class="box">
<h2><a name="HTU"></a>How to Use</h2>

<p>There are several things you have to do before you can start using the Booking API.

<ol>
    <li>First you have to become a my bring user.</li>
    <li>Authentication. Get access to the APi through receiving a Beta API-key from the developer team and then setting two HTTP-headers.</li>
    <li>Authorization. Get your customer number through the customer api.</li>
    <li>Set the service to be in test mode with the test indicator flag.</li>
</ol>
Each step is covered in detail in the following tutorial.</p>

<h4>Authentication - API login with mybring</h4>

<p>
    We use the mybring authentication framework. This is a proprietary single-sign on solution that uses two HTTP
    Headers for authentication to the API. Only users with a mybring user (with attached customer numbers) can use the
    Booking API. In the Booking Web Service and XML/JSON API request, you must set two HTTP headers to access the
    API. </p>

<p>
    To become a mybring customer, <a href="http://www.mybring.com/useradmin/open/signup/new">signup to mybring</a>. The
    API key is currently only visible to organization administrators. Please contact the development team
    (developer@bring.com) to receive a Beta API-key. </p>

<table>
    <tbody>
    <tr>
        <th>Header name</th>
        <th>Example header value</th>
        <th>Comment</th>
    </tr>
    <tr>
        <td>X-MyBring-API-Uid</td>
        <td>booking@customer.com</td>
        <td>This is the mybring login ID.</td>
    </tr>
    <tr>
        <td>X-MyBring-API-Key</td>
        <td>1234abc-abcd-1234-5678-abcd1234abcd</td>
        <td>This is the API key of the mybring user.</td>
    </tr>
    </tbody>
</table>

<h4>Authorization - by customer numbers (per specialist)</h4>

<p>
    In addition to authentication, you need to be authorized with the BUYER role in order to perform bookings. The
    authorization is currently handled with customer numbers on a per specialist basis. </p>

<p>
    To perform a booking, you must specify which customer number to use. For your convenience, there is an API for
    getting the customer numbers of your mybring user (the customer numbers your mybring user has access to). The
    Customer number API also links customer numbers with the products the customer number is valid for. </p>

<p>
    For the SOAP API, the Customer number API is included as an operation in the WSDL. For the XML/JSON API, see
    endpoint definition above and the instructions below. </p>

<br>
<hr>
<p>You can now choose whether you want to see the tutorial for the XML/JSON API or the SOAP API.</p>
<ul class="tab-group minimal" data-tabs="tabs">
    <li class="active"><a href="#tab1">XML/JSON</a></li>
    <li><a href="#tab2">SOAP</a></li>
</ul>

<div class="tab-content tab-minimal">

<div class="tab-pane active" id="tab1">
<h4>Technical information</h4><br/>

<div>
    <p>
        XSD: <a href="https://beta.bring.com/booking/api/schema/booking-v1.xsd">https://beta.bring.com/booking/api/schema/booking-v1.xsd</a>
    </p>

    <p>
        Endpoint: <a href="https://www.mybring.com/booking/api/ws">https://www.mybring.com/booking/api/ws</a>
    </p>

    <h4>Versioning strategy</h4>

    <p>
        Each request has a schemaVersion element indicating which release of the schema is being used in the request and
        expected schema format in the response. Important: All clients must accept new (unknown) elements in the
        response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash when
        unknown elements are encountered. Note that this requirement excludes the (old, but still widely used) Apache
        Axis 1.x Web Service client framework. </p>

</div>
<br/>
<h4>Testing</h4>

<p>
    This service will send actual production orders unless it is set to testing mode. </p>

<p>
    To use the test mode, you need to set the testIndicator flag on the root node. </p>

<ul class="tab-group minimal" data-tabs="tabs">
    <li class="active"><a href="#tab100">XML</a></li>
    <li><a href="#tab200">JSON</a></li>
</ul>

<div class="tab-content tab-minimal">
    <div class="tab-pane active" id="tab100"><pre class="code-box">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;bookingRequest xmlns="http://www.bring.no/booking/" testIndicator="true"&gt;
    ...
&lt;/bookingRequest&gt;
</pre>
    </div>
    <div class="tab-pane" id="tab200"><pre class="code-box">{
    "testIndicator": true,
    "schemaVersion": "1",
    ...
}
</pre>
    </div>
</div>

<br/>

<div>
    <h4>Content-type negotiation</h4>

    <p>The XML/JSON API uses two headers to specify request and response format.</p>
    <table>
        <tbody>
        <tr>
            <th>Header name</th>
            <th>Possible header values</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td>Content-Type</td>
            <td>application/xml or application/json</td>
            <td>This specifies the request format</td>
        </tr>
        <tr>
            <td>Accept</td>
            <td>application/xml or application/json</td>
            <td>This specifies the desired response format</td>
        </tr>
        </tbody>
    </table>
</div>
<br/>

<div>
    <h4>Example</h4>

    <p>
        All requests for the API must include the content type and authentication headers documented in the API docs.
        Use HTTP POST to create new bookings. </p>

    <h5>HTTP-Headers</h5>

    <pre class="code-box">POST /booking/api/booking HTTP/1.1
Content-Type: application/xml
Accept: application/xml
X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
Host: www.mybring.com
</pre>

    <div class="box lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li class="active"><a href="#tab221">XML</a></li>
            <li><a href="#tab222">JSON</a></li>
        </ul>
        <div class="tab-content tab-minimal">

            <div class="tab-pane active" id="tab221">
                <div data-tab="xml" class="tab api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/validRequest.xml"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/validRequest.xml">
                        http://beta.bring.com/booking/api/bookingExamples/validRequest.xml </a>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>

            <div class="tab-pane" id="tab222">
                <div data-tab="json" class="tab api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/validRequest.json"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/validRequest.json">
                        http://beta.bring.com/booking/api/bookingExamples/validRequest.json </a>
                    <pre class="code-box json response delay-snippet"></pre>
                </div>
            </div>
        </div>
    </div>

    <h5>EXAMPLE RESPONSE: SUCCESFUL REQUEST</h5>

    <div class="box lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li class="active"><a href="#tab2221">XML</a></li>
            <li><a href="#tab2222">JSON</a></li>
        </ul>
        <div class="tab-content tab-minimal">

            <div class="tab-pane active" id="tab2221">
                <div data-tab="xml" class="tab api-call">
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/successfulResponse.xml"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/successfulResponse.xml"> Example
                        response </a>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>

            <div class="tab-pane" id="tab2222">
                <div data-tab="json" class="tab api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/successfulResponse.json"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/successfulResponse.json">
                        Example response </a>
                    <pre class="code-box json response delay-snippet"></pre>
                </div>
            </div>
        </div>
    </div>

    <h5>EXAMPLE RESPONSE: FAILED REQUEST</h5>

    <div class="box lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li class="active"><a href="#tab991">XML</a></li>
            <li><a href="#tab992">JSON</a></li>
        </ul>
        <div class="tab-content tab-minimal">

            <div class="tab-pane active" id="tab991">
                <div data-tab="xml" class="tab api-call">
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/failedResponse.xml"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/failedResponse.xml"> Example
                        response </a>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>

            <div class="tab-pane" id="tab992">
                <div data-tab="json" class="tab api-call">
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/failedResponse.json"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/failedResponse.json"> Example
                        response </a>
                    <pre class="code-box json response delay-snippet"></pre>
                </div>
            </div>
        </div>
    </div>


    <div><h4>Shipment Labels</h4>

        <p>
            The Booking API generates and sends all necessary EDI messages to carry out the shipment. A URL to a PDF
            label is returned in responses. This label must be printed and be attached to the shipment. A URL that
            points to tracking information is also returned. </p>

        <p>
            A GET to the label URL will result in a HTTP 302 redirect to the concrete storage facility (e.g. redirect to
            Amazon S3). Ensure that your client follows these redirects. </p></div>

</div>

<div>
    <br/>

    <h3>Error Handling</h3>

    <p>
        If an error occurs, the following will be provided: </p>
    <table>
        <tbody>
        <tr class="even">
            <td>uniqueId</td>
            <td>A unique log ID (UUID) that can be used as a reference for the error</td>
        </tr>
        <tr>
            <td>code</td>
            <td>An error code describing the error</td>
        </tr>
        <tr class="even">
            <td>message</td>
            <td>
                Internationalized messages (with
                <message lang="”xx”"> elements). First version will be with lang=”en” (English) only.
                </message>
            </td>
        </tr>
        </tbody>
    </table>
    <p>
        See table below for the current enumeration of error codes. A value of "true" for the attribute "suffixable"
        means that the error code is suffixed with "-SENDER" if the error is for the sending party data and "-RECIPIENT"
        if the error is for the recipient party data. </p>

    <div class="box lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li class="active"><a href="#tab11">XML</a></li>
            <li><a href="#tab12">JSON</a></li>
        </ul>
        <div class="tab-content tab-minimal">

            <div class="tab-pane active" id="tab11">
                <div data-tab="xml" class="tab api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request" href="http://beta.bring.com/booking/api/errors.xml"
                       data-internal="http://beta.bring.com/booking/api/errors.xml">
                        http://beta.bring.com/booking/api/errors.xml </a>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>

            <div class="tab-pane" id="tab12">
                <div data-tab="json" class="tab api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request" href="http://beta.bring.com/booking/api/errors.json"
                       data-internal="http://beta.bring.com/booking/api/errors.json">
                        http://beta.bring.com/booking/api/errors.json </a>
                    <pre class="code-box json response delay-snippet"></pre>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <br/>

    <h3>How to use the Customer API</h3>

    <p>
        You must be logged in to mybring to use the Customer API. You can test the resource as a normal mybring user
        using a web browser, or you can use the mybring API-key to be authenticated to use the service
        programmatically. </p>

    <p>
        The customer numbers are prefixed with the specialist, and then the customer number. For Courier and Bring
        Express-products, we use a UUID to identify users. </p>
    <table>
        <tbody>
        <tr>
            <th>Specialist</th>
            <th>Example products</th>
            <th>Example customerNumber</th>
        </tr>
        <tr class="even">
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

    <p>"customerNumber" is value returned from the Customer number API. </p>

    <ul class="tab-group minimal" data-tabs="tabs">
        <li class="active"><a href="#tab10">XML</a></li>
        <li><a href="#tab20">JSON</a></li>
    </ul>

    <div class="tab-content tab-minimal">
        <div class="tab-pane active" id="tab10">
            <pre class="code-box">...
&lt;product&gt;
    &lt;id&gt;QUICKPACK_DAY_CERTAIN&lt;/id&gt;
    &lt;customerNumber&gt;EXPRESS_NORWAY-2caedf20-27da-012f-3858-58b0357c4f66&lt;/customerNumber&gt;
&lt;/product&gt;
...
</pre>
        </div>
        <div class="tab-pane" id="tab20">
             <pre class="code-box">...
"product": {
    "id": "BPAKKE_DOR-DOR",
    "customerNumber": "PARCELS_NORWAY-00001234567",
}
...
</pre>
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
        You can also suffix the resource with a supported file name extension (.xml / .json) to force the response. This
        enables testing in a web browser that is logged in to mybring. </p>
                <pre class="code-box">  GET <a href="http://www.mybring.com/booking/api/customers.json">http://www.mybring.com/booking/api/customers.json</a>
  GET <a href="http://www.mybring.com/booking/api/customers.xml">http://www.mybring.com/booking/api/customers.xml</a>
</pre>
    <h5>Example:</h5>

    <div class="box lightBorder">
        <ul class="tab-group minimal" data-tabs="tabs">
            <li class="active"><a href="#tab21">XML</a></li>
            <li><a href="#tab22">JSON</a></li>
        </ul>
        <div class="tab-content tab-minimal">

            <div class="tab-pane active" id="tab21">
                <div data-tab="xml" class="tab api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/customers.xml"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/customers.xml">
                        http://beta.bring.com/booking/api/bookingExamples/customers.xml </a>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>

            <div class="tab-pane" id="tab22">
                <div data-tab="json" class="tab api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://beta.bring.com/booking/api/bookingExamples/customers.json"
                       data-internal="http://beta.bring.com/booking/api/bookingExamples/customers.json">
                        http://beta.bring.com/booking/api/bookingExamples/customers.json </a>
                    <pre class="code-box json response delay-snippet"></pre>
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<div class="tab-pane" id="tab2">

    <div>
        <h4>How to use the Customer API</h4>

        <p>
            You must be logged in to mybring to use the Customer API. You can test the resource as a normal mybring user
            using a web browser, or you can use the mybring API-key to be authenticated to use the service
            programmatically. </p>

        <p>For the SOAP API, the Customer number API is included as an operation in the <a
                href="https://beta.bring.com/booking/api/ws/booking-v1.wsdl">WSDL.</a></p>

        <p>
            The customer numbers are prefixed with the specialist, and then the customer number. For Courier and Bring
            Express-products, we use a UUID to identify users. </p>
        <table>
            <tbody>
            <tr>
                <th>Specialist</th>
                <th>Example products</th>
                <th>Example customerNumber</th>
            </tr>
            <tr class="even">
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
    </p>

    <h4>Versioning strategy</h4>

    <p>
        Each request has a schemaVersion element indicating which release of the schema is being used in the request and
        expected schema format in the response. Important: All clients must accept new (unknown) elements in the
        response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash when
        unknown elements are encountered. Note that this requirement excludes the (old, but still widely used) Apache
        Axis 1.x Web Service client framework. </p>

    <div>
        <p>
            The SOAP Body follow the same XML Schema Definition (XSD) as the XML API. </p>

        <h5>Example authentication header</h5>

        <pre class="code-box">X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
</pre>

        <h5>Sample SOAP request header, body, tail</h5>

        <pre class="code-box">&lt;soapenv:Envelope
            xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
            xmlns="http://www.bring.no/booking/"&gt;
&lt;soapenv:Header/&gt;
&lt;soapenv:Body&gt;
</pre>


        <div data-tab="xml" class="tab api-call">
            <a target="_blank" class="request" href="http://beta.bring.com/booking/api/bookingExamples/validRequest.xml" data-internal="/proxy/booking/api/bookingExamples/validRequest.xml">
                Example Soap Body Request XML
            </a>
            <div class="box lightBorder">
                <pre class="code-box xml response delay-snippet"></pre>
            </div>

        </div>

        <pre class="code-box">&lt;/soapenv:Body&gt;
&lt;/soapenv:Envelope&gt;
</pre>

    </div>


    <div><h4>Shipment Labels</h4>

        <p>
            The Booking API generates and sends all necessary EDI messages to carry out the shipment. A URL to a PDF
            label is returned in responses. This label must be printed and be attached to the shipment. A URL that
            points to tracking information is also returned. </p>

        <p>
            A GET to the label URL will result in a HTTP 302 redirect to the concrete storage facility (e.g. redirect to
            Amazon S3). Ensure that your client follows these redirects. </p></div>


</div>
</div>
</div>

</div>

<div class="span3">
    <div class="box">
        <a class="black" href="/api/bookingapi.html">
            <h4>Booking API</h4>
        </a>
        <ol>
            <li><a href="#introduction">Introduction</a></li>
            <li><a href="#reference">Reference</a></li>
            <li><a href="#HTU">How to Use</a></li>
        </ol>
    </div>
    <div class="box">
        <h2>Additonal Resources</h2>
        <ul>
            <li><a href="https://beta.bring.com/booking/api/schema/booking-v1.xsd">XSD</a></li>
            <li><a href="http://www.mybring.com/useradmin/open/signup/new">Signup to mybring</a></li>
        </ul>
        <h5>XML/JSON API</h5>
        <ul>
            <li><a href="https://www.mybring.com/booking/api/booking">Booking endpoint (use HTTP POST)</a></li>
            <li><a href="https://www.mybring.com/booking/api/customers">Customer number endpoint (use HTTP GET)</a></li>
        </ul>
        <h5>SOAP API</h5>
        <ul>
            <li><a href="https://beta.bring.com/booking/api/ws/booking-v1.wsdl">WSDL</a></li>
            <li><a href="https://www.mybring.com/booking/api/ws">Endpoint</a></li>
        </ul>
    </div>
</div>
</div>
</section>
</div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>