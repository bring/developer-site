<p>The Reports API is a logged-in service and you need to get an API-key and authenticate before being able to use the API.
       Read more about <a href="/additionalresources/getting-api-keys.html?from=reports">how to get an API-key</a>, and how to use it for authentication. </p>
    <div>
        <p>The two first steps in the process is only necessary to find the correct IDs for the customer account and report.
           You can save these IDs, and perform the generation-step without verifying the IDs. The response may get added information,
           so implementation should ignore new elements added to the response.</p>
    </div>
    <div>
        <ol>
            <li><h4>GET CUSTOMER ACCOUNTS</h4>

            <div>The first step is to get a list of available customer accounts.
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
            <div><div>Each customer has a set of reports available.</div>
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

            <div><div>To generate a report do a GET to the supplied URL, and include the parameters described in the response.

                      These parameters are considered to be static, so it should not be necessary to do the two first steps for every report generation.
                      The GET-call will return 202, telling the caller the that the request for a report is put on the queue.
                      The url to query to get the status for the request if provided as an HTTP header and also in the response.
                </div>
                <div><h5>REQUEST</h5>

                    <pre class="code-box">https://www.mybring.com/reports/api/generate/PARCELS_NORWAY-00012341234.json?DELIVEREDfromDate=01.07.2011&amp;toDate=01.07.2011</pre></div>
                <div><h5>EXAMPLE RESPONSE</h5></div>
                <div><pre class="prettyprint">{
    "statusMessage":"The report is now beeing processed. Please use the statusUrl to check when the report is ready. Reloading this page will generate a new report.",
    "statusUrl":"https://www.mybring.com/reports/api/report/db285042-6e8d-4563-94ca-eb1100706a73/status/",
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
        </ol>
    </div>