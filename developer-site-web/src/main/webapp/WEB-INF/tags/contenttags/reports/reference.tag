<%@ tag language="java" pageEncoding="UTF-8"%>
<pre class="code-box">Request prefix:
https://www.mybring.com/reports/api</pre>

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
        <tr>
            <td>
                <code>Accept-Language: &lt;lang_code&gt;,&lt;lang_code&gt;</code>
            </td>
            <td><p>Choose language for text-fields in the responses.</p>
                <ul>
                    <li><code>&lt;lang_code&gt;</code> = a language code such as <code>no</code> for norwegian and <code>en</code> for english.</li>
                </ul>
            </td>
        </tr>

        </tbody>
    </table>

    <table>
        <thead>
        <tr>
            <th>REST URI</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>/generate.&lt;extension&gt;</code></td>
            <td>
                <p>Get a list of available customer accounts. Remember to set the correct headers
                   (<code>Accept, X-MyBring-API-Uid</code> and <code>X-MyBring-API-Key</code>)
                   before performing this call</p>
                <ul>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr >
            <td><code>/generate/&lt;customer_account_id&gt;.&lt;extension&gt;</code></td>
            <td> Get a list of all available reports for the customer with customer id given
                 by <code>&lt;customer_account_id&gt;</code>.
                <ul>
                    <li><code>&lt;customer_account_id&gt;</code> = one of the customer account ids
                                                                 returned by a call to <code>.../generate/</code>.</li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/generate/&lt;customer_account_id&gt;/&lt;report_type&gt;?&lt;parameter1&gt;&amp;&lt;parameter2&gt;.&lt;extension&gt;</code></td>
            <td><p>Order the specified report_type to be generated for the given customer account id.
                   This call will return the HTTP status code 202, and the response body will contain
                   a url for monitoring the status of the report generation.</p>
                <ul>
                    <li><code>&lt;customer_account_id&gt;</code> = one of the customer account ids
                                                                 returned by a call to <code>.../generate/</code>.</li>
                    <li><code>&lt;report_type&gt;</code> = one of the report types returned by a call
                                                         to <code>.../generate/&lt;customer_account_id&gt;/</code> (ie. <code>PARCELS-DELIVERED</code>)</li>
                    <li><code>&lt;parameters&gt;</code> = parameters specific for the given <code>report_type</code>. The available parameters can be found in the response from <code>.../generate/&lt;customer_account_id&gt;/</code></li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul></td>
        </tr>
        <tr >
            <td><code>/report/&lt;report_id&gt;/status.&lt;extension&gt;</code></td>
            <td><p>View the status of the report generation for the report specified by <code>report_id</code>.</p>
                <ul>
                    <li><code>&lt;report_id&gt;</code> = the id for the report you are waiting for.
                                                       This id is returned by the call to <code>.../generate/&lt;customer_account_id&gt;/&lt;report_type&gt;</code></li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>

                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/report/&lt;report_id&gt;.&lt;extension&gt;</code></td>
            <td>
                <p>Get the actual report with <code>report_id</code> in the file format given by <code>extension</code>.</p>
                <ul>
                    <li><code>&lt;report_id&gt;</code> = the id for the report, as given by the call to <code>.../report/&lt;report_id&gt;/status/</code></li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>xls</code> (excel)</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>