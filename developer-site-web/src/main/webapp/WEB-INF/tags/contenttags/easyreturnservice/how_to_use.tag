<%@ tag language="java" pageEncoding="UTF-8"%>
<p>Easy Return Label API is a logged-in service and you need to get an API-key and authenticate before being able to use the API.
    Read more about <a href="/additionalresources/getting-api-keys.html?from=reports">how to get an API-key</a>, and how to use it for authentication.</p>

<div>
    <ol>
        <li>
            <h4>CREATE RETURN LABEL</h4>

            <div>Request a return label by POSTing a Return Label Request XML
                <div><h5>REQUEST</h5>
                    <pre class="code-box">https://api.bring.com/easy-return-service/label</pre>
                    <pre class="prettyprint">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;LabelRequest&gt;
  &lt;CustomerId&gt;&lt;/CustomerId&gt;
  &lt;OrderDate&gt;2013-08-26T09:30&lt;/OrderDate&gt;
  &lt;Sender&gt;
    ...
  &lt;/Sender&gt;
  &lt;Recipient&gt;
    ...
  &lt;/Recipient&gt;
  &lt;Shipment&gt;
    ...
  &lt;/Shipment&gt;
&lt;/LabelRequest&gt;

                    </pre>
                </div>
                <div><h5>EXAMPLE RESPONSE</h5></div>

                <div><pre class="prettyprint"></pre>
                </div>
            </div>
        </li>
    </ol>
</div>