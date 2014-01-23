<%@ tag language="java" pageEncoding="UTF-8"%>
<p>Easy Return Label API is a logged-in service and you need to get an API-key and authenticate before being able to use the API.
    Read more about <a href="/additionalresources/getting-api-keys.html?from=reports">how to get an API-key</a>, and how to use it for authentication.</p>

<div>
    <ol>
        <li>
            <h4>CREATE RETURN LABEL</h4>

            <div>Request a return label by POSTing a Return Label Request XML
                <div><h5>REQUEST</h5>
                    <pre class="code-box">https://api.bring.com/documents/ipc/ers/label</pre>
                    <pre class="prettyprint">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;LabelRequest&gt;
&lt;CustomerId&gt;99999999999&lt;/CustomerId&gt;
&lt;OrderDate&gt;22.01.2014 11:36:22&lt;/OrderDate&gt;
&lt;Sender&gt;
  &lt;Name&gt;Test sender&lt;/Name&gt;
  &lt;PostalCode&gt;4567&lt;/PostalCode&gt;
  &lt;StateOrRegion&gt;Hamburg&lt;/StateOrRegion&gt;
  &lt;City&gt;Hamburg&lt;/City&gt;
  &lt;CountryCode&gt;DE&lt;/CountryCode&gt;
  &lt;Street&gt;HamburgStrasse 28&lt;/Street&gt;
  &lt;AddressLine&gt;&lt;/AddressLine&gt;
&lt;/Sender&gt;
&lt;Recipient&gt;
  &lt;CustomerId&gt;10000000000&lt;/CustomerId&gt;
  &lt;Name&gt;Test recipient&lt;/Name&gt;
  &lt;PostalCode&gt;1234&lt;/PostalCode&gt;
  &lt;City&gt;Bergen&lt;/City&gt;
  &lt;CountryCode&gt;NO&lt;/CountryCode&gt;
  &lt;Street&gt;Nøstegaten 28&lt;/Street&gt;
  &lt;AddressLine&gt;&lt;/AddressLine&gt;
&lt;/Recipient&gt;
&lt;Shipment&gt;
  &lt;PackageId&gt;AB123456789NO&lt;/PackageId&gt;
  &lt;ShipmentId&gt;70508608105602299&lt;/ShipmentId&gt;
  &lt;CustomerReference&gt;123&lt;/CustomerReference&gt;
  &lt;ProductCode&gt;0341&lt;/ProductCode&gt;
  &lt;Weight&gt;5&lt;/Weight&gt;
&lt;/Shipment&gt;
&lt;/LabelRequest&gt;
                    </pre>
                </div>
                <div><h5>EXAMPLE RESPONSE</h5></div>
                <div>
                  <pre class="prettyprint">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot; standalone="yes"?&gt;
&lt;LabelResponse&gt;
  &lt;Url type=&quot;application/pdf&quot; url=&quot;http://api.bring.com/documents/ipc/ers/label/ac1a538b-c9ac-4192-b6af-b3d387d173a0&quot;/&gt;
&lt;/LabelResponse&gt;
                  </pre>
                </div>
            </div>
        </li>
    </ol>
</div>