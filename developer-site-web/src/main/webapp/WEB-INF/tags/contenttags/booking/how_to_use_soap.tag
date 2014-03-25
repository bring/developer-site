<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="soap">

  <div>

    <h3 class="with-padding">Booking Endpoint</h3>

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
      <a target="_blank" class="request" href="https://www.bring.no/booking/api/bookingExamples/validRequest.xml"
         data-internal="/proxy/booking/api/bookingExamples/validRequest.xml"> "https://www.bring.no/booking/api/bookingExamples/validRequest.xml</a>

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

    <div>
        <h4>Technical information</h4>

        <ul>
          <li>
              WSDL: <a href="https://api.bring.com/booking/api/ws/booking-v1.wsdl" target="_blank">https://api.bring.com/booking/api/ws/booking-v1.wsdl</a>
          </li>

          <li>
              XSD: <a href="https://api.bring.com/booking/api/schema/booking-v1.xsd" target="_blank">https://api.bring.com/booking/api/schema/booking-v1.xsd</a>
          </li>

          <li>
              Booking endpoint (use HTTP POST): <a href="https://www.mybring.com/booking/api/ws" target="_blank">https://www.mybring.com/booking/api/ws</a>
          </li>
        </ul>

        <p>
            Each request has a schemaVersion element indicating which release of the schema is being used in the request
            and expected schema format in the response. Important: All clients must accept new (unknown) elements in the
            response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash
            when unknown elements are encountered. Note that this requirement excludes the (old, but still widely used)
            Apache Axis 1.x Web Service client framework. </p>

</div>
</div>