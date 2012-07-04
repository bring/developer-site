<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Tracking API"/>
</head>

<body>
<div>
    <h1>Tracking API</h1>

    <div id="additional-resources">
        <h2>Additonal Resources</h2>
        <ul>
            <li><a href="../additionalresources/xmlSchemaDefinition.html">XML Schema Definition</a></li>
        </ul>
    </div>


    <h2>Introduction</h2>

    <p>The tracking API provides the opportunity to track shipments by reference, package or shipment number. It is an
        easy way to display details and the status of shipments. The information available in this API is the same information available from the <a href="http://tracking.bring.com" target="_blank">Tracking web site</a>.
        Response is available as either XML or JSON.
    </p>

    <div style="border: 1px solid; padding: 2px">
        <b>Note! </b> We are using our Sporing beta environment to provide testdata for the examples. In production you
        should use http://sporing.bring.no/sporing.xml
    </div>

    <h2>Reference</h2>

    <p>Request prefix: <br/><code>http://beta.bring.no/sporing</code></p>

    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>.&lt;extension&gt;?q=&lt;tracking number&gt;</code></td>
            <td>Returns information about the shipment such as the weight, volume and status. <br>
                <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                <li><code>&lt;tracking number&gt;</code> = reference, shipment or package number</li>
            </td>
        </tr>

        </tbody>
    </table>

    <h2>How to Use</h2>
    For testing you can use "TESTPACKAGE-AT-PICKUPPOINT" as the tracking number to generate test results. For real
    tracking this must be a valid number.

    <p>
        Example: TRACK A SHIPMENT<br/>
        This example is showing a package waiting to be collected at the pickup point .<br/><br/>
        Request: /sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT<br/><br/>
        Response: ...
    </p>





    <h2>Additional examples</h2>
    The parcel numbers used in the examples are static identifiers, and will always return the same result. These examples are recommended to use for integration testing.<br>
    <h4>Package - notification received</h4>
    <p>The example below is showing a package that have been EDI notified, but is not received by Bring</p><br>
    Request: /sporing.xml?q=TESTPACKAGE-EDI
    Response: ...

    <h4>Package - waiting at pickup point</h4>
    <p>The example below is showing a package waiting for the recipient to collect it at a pickup point</p><br>
    Request: /sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT
    Response: ...

    <h4>Package - loaded for delivery</h4>
    <p>The example below is showing a package that has been loaded on a distribution car for delivery to the reciepient</p><br>
    Request: /sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY
    Response: ...

    <h4>Package - delivered</h4>
    <p>The example below is showing a package that has been delivered to the reciepient</p><br>
    Request: /sporing.xml?q=TESTPACKAGE-DELIVERED
    Response: ...



</div>

</body>
</html>
