<%@ tag language="java" pageEncoding="UTF-8"%>
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


    <div class="tab" data-tab="json"><pre class="code-box">{
    "testIndicator": true,
    "schemaVersion": "1",
    ...
}
</pre>
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


    <h5>EXAMPLE RESPONSE: SUCCESFUL REQUEST</h5>

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

        <div data-tab="json" class="tab">
            <div class="api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://beta.bring.com/booking/api/bookingExamples/failedResponse.json"
                   data-internal="/proxy/booking/api/bookingExamples/failedResponse.json">
                    http://beta.bring.com/booking/api/bookingExamples/failedResponse.json </a>

                <p>Example response:</p>
                <pre style="min-height: 30px;" class="code-box json response delay-snippet"></pre>
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