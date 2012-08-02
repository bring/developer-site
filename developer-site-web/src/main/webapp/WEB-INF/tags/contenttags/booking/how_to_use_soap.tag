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