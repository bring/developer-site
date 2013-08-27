<%@ tag language="java" pageEncoding="UTF-8"%>
<pre class="code-box">Request prefix:
https://api.mybring.com/easy-return-service/api</pre>

<table>
    <thead>
    <tr>
        <th>Header</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <code>X-MyBring-API-Uid: &lt;user@email.com&gt;</code>
        </td>
        <td><p>Specify your email address.</p>
            <ul>
                <li>
                    <code>&lt;user@email.com&gt;</code> = the users email address.
                </li>
            </ul>
        </td>
    </tr>
    <tr >
        <td>
            <code>X-MyBring-API-Key: &lt;api_key&gt;</code>
        </td>
        <td><p>Specify your API-key.</p>
            <ul>
                <li><code>&lt;api_key&gt;</code> = a valid api-key
                    such as <code>a141879d-608e-4ee4-95bd-8a083e04b599</code>. Read <a href="/additionalresources/getting-api-keys.html?from=reports">Getting and using API-keys</a> for a full explanation.</li>
            </ul>
        </td>
    </tr>

    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th class="httpmethod">Method</th>
        <th>REST URI</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><code>POST</code></td>
        <td><code>/label</code></td>
        <td>
            <p>Create a new return label. Remember to set the correct headers
                (<code>X-MyBring-API-Uid</code> and <code>X-MyBring-API-Key</code>)
                before performing this call</p>

        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td><code>/label</code></td>
        <td>
            <p>Get a list of all previously created labels.</p>
        </td>
    </tr>
    </tbody>
</table>