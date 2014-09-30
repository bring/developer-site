<%@ tag language="java" pageEncoding="UTF-8"%>
<p>The Reports API is a logged-in service and you need to get an API-key and authenticate before being able to use the API.
       Read more about <a href="/additionalresources/getting-api-keys.html?from=reports">how to get an API-key</a>, and how to use it for authentication. </p>
    <div>
        <p>The two first steps in the process is only necessary to find customer numbers and report types for the user.
           You can save these IDs, and perform the generation-step without verifying the IDs. The response may get added information,
           so implementation should ignore new elements added to the response.</p>
    </div>
    <div>
        <ol>
            <li><h4>GET CUSTOMER IDS</h4>

            <div>The first step is to get a list of available customers. Note that we are requesting output in json format.
                <div><h5>REQUEST</h5>
                    <pre class="code-box">https://www.mybring.com/reports/api/generate.json</pre></div>
                <div><h5>EXAMPLE RESPONSE</h5></div>

                <div><pre class="prettyprint">{"customers":[
    {
        "id":"PARCELS_NORWAY-00012341234",
        "name":"TEST CUSTOMER",
        "fullName":"TEST CUSTOMER (00012341234)",
        "reports":"https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234/"
    }

]}</pre></div></div>

            <li><h4>GET LIST OF AVAILABLE REPORTS</h4>
            <div><div>Each customer has a set of reports available. Now lets search reports for customer with id: <i>PARCELS_NORWAY-00012341234</i>.</div>
                <div><h5>REQUEST</h5>
                    <pre class="code-box"> https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234.json</pre></div>
                <div><h5>EXAMPLE RESPONSE</h5></div>

                <div><pre class="prettyprint">{"reports":[
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

]}</pre></div></div></li>

            <li><h4>GENERATE REPORT</h4>

            <div><div>To generate a report do a GET to the supplied URL, and include the parameters described in the previous response.

                      You need not invoke the two first steps for every report generation if customer id and report type are known.
                      This is asynchronous request. So the GET-call will return 202, telling the caller the that the request for a report is put on the queue.
                      The url to query to get the status for the request if provided as an HTTP header and also in the response.
                </div>
                <div>
                    Now lets generate report for customer id: PARCELS_NORWAY-00012341234 and report: PARCELS-DELIVERED from 01.07.2014 to 01.08.2014:
                </div>
                <div><h5>REQUEST</h5>

                    <pre class="code-box">https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234/PARCELS-DELIVERED.json?fromDate=01.07.2014&toDate=01.08.2014</pre></div>
                <div><h5>EXAMPLE RESPONSE</h5></div>
                <div><pre class="prettyprint">{
    "statusUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73/status/"
}</pre></div></div>

            <li><h4>CHECK STATUS OF REPORT</h4>

            <div>Since the generation of reports may take several minutes, we supply a status address to check the status of the report generation.
                      The status page will display NOT_DONE, until the report is ready to be downloaded. When the report is ready, URLs to download the report will be in the response.

                <div><h5>REQUEST</h5>
                    <pre class="code-box"> https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73/status.json</pre>
                </div>


                <div><h5>REPORT NOT FINISHED RESPONSE</h5></div>
                <div><pre class="prettyprint">{
"status":"NOT_DONE"
}</pre></div>

                <div><h5>REPORT AVAILABLE RESPONSE</h5></div>

                <div><pre class="prettyprint">{
"status":"DONE",
"xmlUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xml",
"xlsUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xls"

}</pre></div></div>

            <div>
                <h5>REPORT FAILED RESPONSE</h5>
                <div><pre class="prettyprint">{
"status":"FAILED"
}</pre></div></div></li>


            <li><h4>DOWNLOAD REPORT</h4>

            <div>The reports are available in XML or Excel format. Please use the link with .xml or .xls extension to download the report.


                <div><h5>XML-REQUEST</h5>
                    <pre class="code-box">https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xml</pre>
                </div>

                <div><h5>EXCEL-REQUEST</h5>
                </div>
                <div><pre class="code-box"> https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73.xls</pre>
                </div>
            </div>
            </li>

            <li>
                <h4>GET LIST OF INVOICE NUMBERS FOR GIVEN CUSTOMER OR GROUP</h4>
                <div>Customer or group has list of invoice numbers.</div>
                <h5>REQUEST</h5>
                <div><pre class="code-box"> https://www.mybring.com/reports/api/invoices/PARCELS_NORWAY-10001041234.json</pre></div>
                <h5>EXAMPLE RESPONSE</h5>
                <div>
                    <pre class="prettyprint">
                        {
                            customerId: "PARCELS_NORWAY-10001041234"
                            invoiceNumbers: [2]
                            0:  {
                                label: "702414111 (6/16/2014)"
                                id: "702414111"
                                year: 2014
                                month: 6
                                day: 16
                            }
                            -
                            1:  {
                                label: "702383222 (5/25/2014)"
                                id: "702383222"
                                year: 2014
                                month: 5
                                day: 25
                            }
                            -
                            -
                        }
                    </pre>
               </div>
           </li>
        </ol>
    </div>