<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Reports API"/>
    <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">

                <div class="span9">

                    <div class="box">
                        <h1>Reports API</h1>
                    </div>

                    <div class="box">
                        <h2><a name="introduction"></a>Introduction</h2>
                        <p>The API lets you view customer accounts associated with your account, find available reports for those accounts and generate and download reports. This is a step-by-step guide on how to use the API.
                        </p>

                        <div class="information-box"><p><b>Note!</b> The Reports API is currently in closed BETA testing. Please contact us at fraktguide@posten.no if you are interested in testing this service.</p>
                        </div>

                    </div>

                    <div class="box">
                        <h2><a name="reference"></a>Reference</h2>

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
                                <td><code>Accept: application/&lt;extension&gt;</code></td>
                                <td><p>Choose response format.</p>
                                    <ul>
                                        <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="even">
                                <td>
                                    <code>Accept-Language: &lt;lang_code&gt;,&lt;lang_code&gt;</code>
                                </td>
                                <td><p>Choose language for text-fields in the responses.</p>
                                    <ul>
                                        <li><code>&lt;lang_code&gt;</code> = a language code such as <code>no</code> for norwegian and <code>en</code> for english.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <code>X-MyBring-API-Uid: &lt;user@email.com&gt;</code>
                                </td>
                                <td><p>Specify your email adress.</p>
                                    <ul>
                                        <li>
                                            <code>&lt;user@email.com&gt;</code> = the users email address.
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="even">
                                <td>
                                    <code>X-MyBring-API-Key: &lt;api_key&gt;</code>
                                </td>
                                <td><p>Specify your API-key.</p>
                                    <ul>
                                        <li><code>&lt;api_key&gt;</code> = a valid api-key
                                            such as <code>a141879d-608e-4ee4-95bd-8a083e04b599</code>.</li>
                                    </ul>
                                </td>
                            </tr>

                            </tbody>
                        </table>

                        <table>
                            <thead>
                            <tr>
                                <th>Field</th>
                                <th>Description</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><code>.../generate/</code></td>
                                <td>
                                    <p>Get a list of available customer accounts. Rememeber to set the correct headers
                                    (<code>Accept, Accept-Language, X-MyBring-API-Uid</code> and <code>X-MyBring-API-Key</code>)
                                    before performing this call</p>
                                </td>
                            </tr>
                            <tr class="even">
                                <td><code>.../generate/&lt;customer_account_id&gt;/</code></td>
                                <td> Get a list of all available reports for the customer with customer id given
                                    by <code>&lt;customer_account_id&gt;</code>.
                                    <ul>
                                        <li><code>&lt;customer_account_id&gt;</code> = one of the customer account ids
                                            returned by a call to <code>.../generate/</code>.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td><code>.../generate/&lt;customer_account_id&gt;/&lt;report_type&gt;?&lt;parameter1&gt;&amp;&lt;parameter2&gt;</code></td>
                                <td><p>Order the specified report_type to be generated for the given customer account id.
                                    This call will return the HTTP status code 202, and the response body will contain
                                    a url for monitoring the status of the report generation.</p>
                                    <ul>
                                        <li><code>&lt;customer_account_id&gt;</code> = one of the customer account ids
                                            returned by a call to <code>.../generate/</code>.</li>
                                        <li><code>&lt;report_type&gt;</code> = one of the report types returned by a call
                                            to <code>.../generate/&lt;customer_account_id&gt;/</code> (ie. <code>PARCELS-DELIVERED</code>)</li>
                                        <li><code>&lt;parameters&gt;</code> = parameters specific for the given <code>report_type</code>. The available parameters can be found in the response from <code>.../generate/&lt;customer_account_id&gt;/</code></li>
                                    </ul></td>
                            </tr>
                            <tr class="even">
                                <td><code>.../report/&lt;report_id&gt;</a>/status/</code></td>
                                <td><p>View the status of the report generation for the report specified by <code>report_id</code>.</p>
                                    <ul>
                                        <li><code>&lt;report_id&gt;</code> = the id for the report you are waiting for.
                                            This id is returned by the call to <code>.../generate/&lt;customer_account_id&gt;/&lt;report_type&gt;</code></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td><code>.../report/&lt;report_id&gt;.&lt;extension&gt;</code></td>
                                <td>
                                    <p>Get the actual report with <code>report_id</code> in the file format given by <code>extension</code>.</p>
                                    <ul>
                                        <li><code>&lt;report_id&gt;</code> = the id for the report, as given by the call to <code>.../report/&lt;report_id&gt;</a>/status/</code></li>
                                        <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>xls</code> (excel)</li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>

                    <div class="box">
                        <h2><a name="HTU"></a>How to Use</h2>
                        <p>The API uses two headers to customize the answers. One header is for choosing between XML and JSON responses,
                            and the second header is to choose language in text-fields in the responses. Every call can return both JSON and XML,
                            except the call to get a report. The report is available in XML and Excel.
                        </p> <br/>

                        <div>
                            <h5>XML-RESPONSE</h5>
                            <code><pre class="code-box">Accept: application/xml</pre></code>
                            <h5>JSON-RESPONSE</h5>
                            <code><pre class="code-box">Accept: application/json</pre></code>
                            <h5>LANGUAGE</h5>
                            <code><pre class="code-box">Accept-Language: no,en</pre></code>
                        </div>

                        <div>
                            <p>The two first steps in the process is only necessary to find the correct IDs for the customer account and report.
                                You can save these IDs, and perform the generation-step without verifying the IDs. The response may get added information,
                                so implementation should ignore new elements added to the response.</p>
                        </div>
                             <br/>
                        <div>
                            <H4>AUTHENTICATION</H4>
                            <P>Since reports are a logged in service, you need to authenticate to use the API.
                                All mybring-APIs use a simple authentication-scheme. By adding two headers to all requests,
                                you will authenticate your request. The API-Key is currently available to pilot customers.
                                Please contact us at fraktguide@posten.no if you are interested in using this API.
                            </P>
                            <h5>Authentication header example</h5>
                            <div><code><pre class="code-box">X-MyBring-API-Uid: user@email.com<br/>X-MyBring-API-Key: a141879d-608e-4ee4-95bd-8a083e04b599</pre>
                            </code></div>
                        </div>
                              <br/><br/>
                        <div>
                            <ol>
                                <li><h4>GET CUSTOMER ACCOUNTS</h4></li>
                                <div>The first step is to get a list of available customer accounts.<br/><br/>
                                    <div><h5>REQUEST</h5>
                                        <pre class="code-box">https://www.mybring.com/reports/api/generate/</pre></div>
                                    <div><h5>EXAMPLE RESPONSE</h5></div>
                                    <div><code><pre class="prettyprint">{"customers":[
    {
        "id":"PARCELS_NORWAY-00012341234",
        "name":"TEST CUSTOMER",
        "fullName":"TEST CUSTOMER (00012341234)",
        "reports":"https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234/"
    }
]}</pre></code></div></div>

                                <li><h4>GET LIST OF AVAILABLE REPORTS</h4></li>
                                <div><div>Each customer has a set of reports available.</div><br/><br/>
                                    <div><h5>REQUEST</h5>
                                        <pre class="code-box"> https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234/</pre></div>
                                    <div><h5>EXAMPLE RESPONSE</h5></div>
                                    <div><code><pre class="prettyprint">{"reports":[
    {
        "id":"PARCELS-DELIVERED",
        "name":"Delivered to recipient",
        "description":"Overview of parcels which are delivered to the recipient.",
        "url":"http://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341324/PARCELS-DELIVERED/",
        "parameters":[
            {
                "name":"fromDate",
                "type":"date",
                "description":"Startdate of the report. Format: DD.MM.YYYY"
            },
            {
                "name":"toDate",
                "type":"date",
                "description":"Enddate of the report. Format: DD.MM.YYYY"
            }
        ]
    }
]}</pre></code></div></div>

                                <li><h4>GENERATE REPORT</h4></li>

                                <div><div>To generate a report do a GET to the supplied URL, and include the parameters described in the response.
                                    These parameters are considered to be static, so it should not be necessary to do the two first steps for every report generation.
                                    The GET-call will return 202, telling the caller the that the request for a report is put on the queue.
                                    The url to query to get the status for the request if provided as an HTTP header and also in the response.</div><br/>
                                    <div><h5>REQUEST</h5>
                                        <pre class="code-box">https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234/DELIVEREDfromDate=01.07.2011&toDate=01.07.2011</pre></div>
                                    <div><h5>EXAMPLE RESPONSE</h5></div>
                                    <div><code><pre class="prettyprint">{
    "statusMessage":"The report is now beeing processed. Please use the statusUrl to check when the report is ready. Reloading this page will generate a new report.",
    "statusUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73/status/",
}</pre></code></div></div>

                                <li><h4>CHECK STATUS OF REPORT</h4></li>

                                <div><div>TSince the generation of reports may take several minutes, we supply a status address to check the status of the report generation.
                                    The status page will display NOT_DONE, until the report is ready to be downloaded. When the report is ready, URLs to download the report will be in the response.<br/><br/>
                                    <div><h5>REQUEST</h5>
                                        <pre class="code-box"> https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73/status/</pre></div>

                                    <div><h5>REPORT NOT FINISHED RESPONSE</h5></div>
                                    <div><code><pre class="prettyprint">{
"status":"NOT_DONE"
}</pre></code></div></div>

                                    <div><h5>REPORT AVAILABLE RESPONSE</h5></div>
                                    <div><code><pre class="prettyprint">{
"status":"DONE",
"xmlUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xml",
"xlsUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xls"
}</pre></code></div></div>
                                <div><h5>REPORT FAILED RESPONSE</h5>
                                    <div><code><pre class="prettyprint">{
"status":"FAILED"
}</pre></code></div></div>

                                <li><h4>DOWNLOAD REPORT</h4></li>

                                <div>The reports are available in XML or Excel format. Please use the link with .xml or .xls extension to download the report.<br/><br/>

                                    <div><h5>XML-REQUEST</h5>
                                        <pre class="code-box">https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xml</pre></div>

                                    <div><h5>EXCEL-REQUEST</h5></div>
                                    <div><pre class="code-box"> https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xls</pre></div>
                                </div>
                            </ol>
                        </div>
                    </div>
                </div>

                <div class="span3" id="additional-resources">

                    <div class="box">
                        <a class="black" href="/api/reportsapi.html">
                            <h4>Reports API</h4>
                        </a>
                        <ol>
                            <li><a href="#introduction">Introduction</a></li>
                            <li><a href="#reference">Reference</a></li>
                            <li><a href="#HTU">How to Use</a></li>
                        </ol>

                    </div>

                </div>

            </div>
        </section>
    </div>
</div>

<misc:footer_v2/>
<misc:jqueryblob_v2/>


</body>
</html>
