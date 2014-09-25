<%@ tag language="java" pageEncoding="UTF-8"%>
<p>
    Reports API is used to generate reports.
    Each Mybring user is associated with a set of customers and has access to specific set of report types for which they can generate report.<br/>

    Following APIs help you generate reports:
    <ul>
        <li>
            Get the customers associated with the user.
        </li>
        <li>
            Get the report types allowed for a customer.
        </li>
        <li>
            Generate the report for a customer and report type to get report id.
        </li>
        <li>
            On initiating generate report which is asynchronous call, you can check the status of report if it is not done yet/completed/failed.
        </li>
        <li>
            Once done, the report can be downloaded.
        </li>
        <li>
            Get list of invoice numbers for a customer or customer group. A user can create a group of customers from mybring web app.
        </li>
    </ul>

    For all the above APIs we need to identify and authenticate the user. This is done by passing the following header information. These are described in Reference section:
    <ul>
        <li>
            User email
        </li>
        <li>
            API Key
        </li>
    </ul>

    Note: All these APIs are available in json, xml formats. For example <br/>
    Invoke https://www.mybring.com/reports/api/generate.json to get result in json format.<br/>
    Invoke https://www.mybring.com/reports/api/generate.xml to get result in xml format.
</p>
