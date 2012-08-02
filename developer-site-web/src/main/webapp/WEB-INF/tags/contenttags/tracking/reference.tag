<%@ tag language="java" pageEncoding="UTF-8"%>
<pre class="code-box">Request prefix:
http://sporing.bring.no</pre>

    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>/sporing.&lt;extension&gt;?q=&lt;tracking number&gt;</code></td>
            <td>Returns information about the shipment such as the weight, volume and status.
                <ul>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                    <li><code>&lt;tracking number&gt;</code> = reference, shipment or package number</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>