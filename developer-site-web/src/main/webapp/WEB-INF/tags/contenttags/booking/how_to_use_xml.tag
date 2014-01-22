<%@ taglib prefix="additionalServices" tagdir="/WEB-INF/tags/contenttags/booking/additionalServices" %>
<%@ taglib prefix="booking" tagdir="/WEB-INF/tags/contenttags/booking" %>

<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="xml">

<h4>Examples</h4>

<h5>How to set customer numbers in Booking API</h5>

<p>"customerNumber" is a value returned from the Customer number API. </p>

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
<div data-tab="xml" class="tab">
  <div class="api-call">
    <p>Example response:</p>
    <pre class="code-box xml response delay-snippet"></pre>
    <a target="_blank" class="request"
       href="https://www.bring.no/booking/api/bookingExamples/customers.xml"
       data-internal="/proxy/booking/api/bookingExamples/customers.xml">
      https://www.bring.no/booking/api/bookingExamples/customers.xml </a>
  </div>
</div>

<h4>Technical information</h4>

<ul>
    <li>
        XSD: <a href="https://www.bring.no/booking/api/schema/booking-v1.xsd" target="_blank">https://www.bring.no/booking/api/schema/booking-v1.xsd</a>
    </li>

    <li>
        Endpoint (use HTTP GET): <a href="https://www.mybring.com/booking/api/booking" target="_blank">https://www.mybring.com/booking/api/booking</a>
    </li>

    <li>
      Customer number endpoint (use HTTP GET): <a href="https://www.mybring.com/booking/api/customers" target="_blank">https://www.mybring.com/booking/api/customers</a>
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

    <div class="tab" data-tab="xml"><pre class="code-box">&lt;?xml version="1.0" encoding="UTF-8" ?&gt;
&lt;bookingRequest xmlns="http://www.bring.no/booking/" testIndicator="true"&gt;
    ...
&lt;/bookingRequest&gt;
</pre>
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

<div class="additional-services">
    <additionalServices:additional_services/>
    <div data-tab="xml" class="tab">
        <div class="api-call">
            <p>XML:</p>
            <pre class="code-box xml response delay-snippet hidden"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/additionalServicesForProduct.xml"
               data-internal="/proxy/booking/api/additionalServicesForProduct.xml">
                https://www.bring.no/booking/api/additionalServicesForProduct.xml</a>

        </div>
    </div>
    <additionalServices:recipient_notification/>
    <div data-tab="xml" class="tab">
        <div class="api-call">
            <p>Example:</p>
            <pre class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/recipientNotificationRequest.xml"
               data-internal="/proxy/booking/api/bookingExamples/recipientNotificationRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/recipientNotificationRequest.xml </a>
        </div>
    </div>

    <additionalServices:cash_on_delivery/>
    <div data-tab="xml" class="tab">
        <div class="api-call">
            <p>Example:</p>
            <pre class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/cashOnDeliveryRequest.xml"
               data-internal="/proxy/booking/api/bookingExamples/cashOnDeliveryRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/cashOnDeliveryRequest.xml </a>
        </div>
    </div>

    <additionalServices:quickpack_envelope/>
    <div data-tab="xml" class="tab">
        <div class="api-call">
            <p>Example:</p>
            <pre class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/quickPackEnvelopeRequest.xml"
               data-internal="/proxy/booking/api/bookingExamples/quickPackEnvelopeRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/quickPackEnvelopeRequest.xml </a>
        </div>
    </div>

    <additionalServices:deliveryOption/>
    <div data-tab="xml" class="tab">
        <div class="api-call">
            <p>Example:</p>
            <pre class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/deliveryOptionRequest.xml"
               data-internal="/proxy/booking/api/bookingExamples/deliveryOptionRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/deliveryOptionRequest.xml </a>
        </div>
    </div>

    <additionalServices:flex_delivery/>
    <div data-tab="xml" class="tab">
        <div class="api-call">
            <p>Request:</p>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/flexDeliveryRequest.xml"
               data-internal="/proxy/booking/api/bookingExamples/flexDeliveryRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/flexDeliveryRequest.xml </a>

            <p>Example response:</p>
            <pre class="code-box xml response delay-snippet"></pre>
        </div>
    </div>
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

    <div data-tab="xml" class="tab">
        <div class="api-call">
            <pre class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/validRequest.xml"
               data-internal="/proxy/booking/api/bookingExamples/validRequest.xml">https://www.bring.no/booking/api/bookingExamples/validRequest.xml </a>
        </div>
    </div>

    <h5>EXAMPLE RESPONSE: SUCCESSFUL REQUEST</h5>

    <div data-tab="xml" class="tab">
        <div class="api-call">
            <pre class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/successfulResponse.xml"
               data-internal="/proxy/booking/api/bookingExamples/successfulResponse.xml">
                https://www.bring.no/booking/api/bookingExamples/successfulResponse.xml</a>
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

    <div data-tab="xml" class="tab">
        <div class="api-call">
            <pre style="min-height: 25px;" class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request"
               href="https://www.bring.no/booking/api/bookingExamples/failedResponse.xml"
               data-internal="/proxy/booking/api/bookingExamples/failedResponse.xml">
                https://www.bring.no/booking/api/bookingExamples/failedResponse.xml </a>
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

    <div data-tab="xml" class="tab">
        <div class="api-call">
            <pre class="code-box xml response delay-snippet"></pre>
            <a target="_blank" class="request" href="https://www.bring.no/booking/api/errors.xml"
               data-internal="/proxy/booking/api/errors.xml"> https://www.bring.no/booking/api/errors.xml </a>
        </div>
    </div>
</div>

<div>

</div>

</div>