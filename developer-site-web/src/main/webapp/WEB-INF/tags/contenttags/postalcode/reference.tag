<%@ tag language="java" pageEncoding="UTF-8"%>
  <pre class="code-box">Request prefix:
http://fraktguide.bring.no/fraktguide</pre>
<div data-tab="xml">
    <table>
    <thead>
    <tr>
        <th>Field</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><code>/postalCode.&lt;extension&gt;?country=&lt;country&gt;&amp;&lt;postalcode&gt;</code></td>
        <td>Returns the location based on the postal code.<br/>
            <li><code>&lt;postalcode&gt;</code> = A valid zip-code</li>
            <li><code>&lt;extension&gt;</code> = <code>xml</code>, <code>json</code> or <code>html</code></li>
            <li><code>&lt;country&gt;</code> = The ISO 3166-1-alpha-2 country code.</li>
        </td>
    </tr>
    <tr >
        <td><code>//Response/@valid</code></td>
        <td>XPath for checking if the response is valid <br/>
        </td>
    </tr>
    </tbody>
    </table>
</div>

<div data-tab="json html">
    <table>
        <thead>
            <tr>
                <th>Field</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><code>/postalCode.&lt;extension&gt;?country=&lt;country&gt;&amp;&lt;postalcode&gt;</code></td>
                <td>Returns the location based on the postal code.<br/>
                    <li><code>&lt;postalcode&gt;</code> = A valid zip-code</li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code>, <code>json</code> or <code>html</code></li>
                    <li><code>&lt;country&gt;</code> = The ISO 3166-1-alpha-2 country code.</li>
                </td>
            </tr>
        </tbody>
    </table>
</div>
