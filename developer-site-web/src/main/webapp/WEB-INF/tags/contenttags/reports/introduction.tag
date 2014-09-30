<%@ tag language="java" pageEncoding="UTF-8"%>
<p>
    The Reports API is used to generate shipment reports, the same set of reports that are available in mybring.
</p>
<p>
    Each Mybring user is associated with a set of customers and has access to specific set of report types for which they can generate a report.<br/>
</p>
<p>
    The following steps (which will be API calls) enables you to generate a report:
    <ol>
        <li>
            Get the customers associated with the mybring user.
        </li>
        <li>
            Get the report types allowed for a customer.
        </li>
        <li>
            Initiate report creation and get report ID.<br/>
            The Report ID is initially used to monitor reports creation progress, later to get the actual report (XML or Excel file).
        </li>
        <li>
            After initiating report creation, you can check the status if the job. I.e. if it is in progress, completed or failed.<br/>
            When status is completed, a URL for fetching the actual report is returned.
        </li>
        <li>
            The report can then be downloaded.
        </li>
    </ol>

    For all the above APIs we need to identify and authenticate the user. This is done by passing the following header information. These are described in Reference section:
    <ul>
        <li>
            Mybring username (email address)
        </li>
        <li>
            API Key
        </li>
    </ul>

    All these APIs are available in json and xml formats.
</p>

