<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head></head>
<body>
<h1>Pickup Point API</h1>
<h2>Introduction</h2>
<p>The Pickup point API provides a list of the alternative locations for package pickup.
    Based on a specified postal code or a geographical location, the 10 nearest pickup points are returned. Response is available as either XML or JSON.<br/><br>
    A pickup point is defined as any location delivering shipments on behalf of Bring and Posten, such as post offices and selected grocery stores.</p>
<h2>Reference</h2>
<p>Request prefix: <br/><code>http://fraktguide.bring.no/fraktguide/api/pickuppoint</code></p>
<table>
    <thead>
    <tr>
        <th>Field</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><code>/postalcode/&lt;postalcode&gt;.&lt;extension&gt;</code></td>
        <td>Returns the 10 nearest pickup points based on the given postalcode.
            <ul>
                <li><code>&lt;postalcode&gt;</code> = any valid postal code</li>
                <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><code>/location/&lt;latitude&gt;/&lt;longitude&gt;.&lt;extension&gt;</code></td>
        <td>Returns the 10 nearest pickup points based on the given location.<br/>
            <ul>
                <li>
                    <code>&lt;latitude&gt;</code> = geographic coordinate specifying the north-south position.</li>
                <li><code>&lt;longitude&gt;</code> = geographic coordinate specifying the east-west position.</li>
                <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><code>/id/&lt;id&gt;.&lt;extension&gt;</code></td>
        <td>Returns the 10 nearest pickup points based on the pickup point's id.<br/>
            <ul>
                <li>
                    <code>&lt;id&gt;</code> = The pickup point's id.</li>
                <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
            </ul>
        </td>
    </tr>
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th>Optional filter</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><code>?searchForText=&lt;text&gt;</code></td>
        <td>Return only pickup points containing the specified text.
            <ul>
                <li><code>&lt;text&gt;</code> = name, address, city, municipality name, county name or location</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><code>?openingHoursSearchType=&lt;day&gt;</code></td>
        <td>Return only pickup points that are open on the specified day.
            <ul>
                <li><code>&lt;day&gt;</code> = ALL_WEEKDAYS | MONDAY | TUESDAY | WEDNESDAY | THURSDAY | FRIDAY | SATURDAY | SUNDAY</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><code>?openOnOrBefore=&lt;time&gt;</code></td>
        <td>Return only pickup points that are open on or before the specified time.
            <ul>
                <li><code>&lt;time&gt;</code> = format: HHMM</li>
            </ul>
        </td>
    </tr>
    <tr>
        <td><code>?openOnOrAfter=&lt;time&gt;</code></td>
        <td>Return only pickup points that are open on or before the specified time.
            <ul>
                <li><code>&lt;time&gt;</code> = format: HHMM</li>
            </ul>
        </td>
    </tr>
    </tbody>
</table>

<p>
<h2>How to Use</h2>
First you have to choose whether you want to use a postal code or geographical coordinates to find the 10 nearest delivery locations.
The following examples illustrate the different alternatives.
</p>

<p>
    Example: USING THE POSTAL CODE<br/>
    Find pickup points based on the recipient's postal code, 1407 Vinterbro.<br/><br/>
    Request: /api/pickuppoint/postalcode/1407.xml<br/><br/>
    Response: ...
</p>

<p>
    Example: USING GEOGRAPHICAL COORDINATES<br/>
    Find pickup points based on the recipient's geographical coordinates, Bergen city (60.395226, 5.321725)<br/><br/>
    Request: /api/pickuppoint/location/60.395226/5.321725.xml<br/><br/>
    Response: ...
</p><br/>

<p><h4>Using filters</h4>In addition to postal code or location, one or more optional parameters can be added to the request.
These parameters can be perceived as &quot;filters&quot;, adding additional restrictions to the pickup points being returned.
One such parameter is <code>searchForText=q&lt;texts&gt;</code>, resulting in a response where all pickup points have at least a partial match with the search string given in &lt;texts&gt;.
This can be the name of the pickup point, its address, city, county, municipality or location. Go to the reference table or see additional examples for more information
</p>

<div style="border: 1px solid; padding: 2px">
    <b>Note! </b>If you want to add more than one parameter at the end of a request, separate the subsequent parameters using <code>&</code>. For instance: <code>/api/pickuppoint/postalcode/1407.xml?searchForText=&quot;Kiwi&quot;<b>&</b>openOnOrBefore=0800</code>
</div>

<p><h4>Using the pickup point's id</h4>
If you already know the id of the pickup point, you can retrieve more information such as the geographical location, opening hours and county.<br/><br/>
Example: USING ID TO RETRIEVE INFORMATION ABOUT A PICKUP POINT<br/>
Retrieve more information about the pickup point based on its id, 121110<br/><br/>
Request: /api/pickuppoint/id/121110.xml<br/><br/>
Response: ...
</p>

<h2>Additional examples</h2>

<h4>Find pickup points containing a specified string</h4>
<p>If you want to return only the pickup points matching a specified string, you may add <code>?searchForText=&lt;text to match&gt;</code> to the request.
   The string in the <code>&lt;text to match&gt;</code> can be the name of the pickup point, its address, city, county, municipality or location. Partial matches are also allowed.<br><br>
   Example below: FIND THE PICKUP POINTS NEAR POSTAL CODE 1407 CONTAINING &quot;KIWI&quot;.<br><br>
   Request: /api/pickuppoint/postalcode/1407.xml?searchForText=KIWI<br><br>
   Response: ...
</p>

<h4>Find pickup points open on specified days</h4>
<p>If you want to return only the pickup points open on specified days, you may add <code>?openingHoursSearchType=&lt;day&gt;</code> to the request.<br><br>
    <code>&lt;day&gt; = ALL_WEEKDAYS (default) | MONDAY | TUESDAY | WEDNESDAY | THURSDAY | FRIDAY | SATURDAY | SUNDAY</code><br><br>
    If you want you can also add openOnOrBefore and / or openOnOrAfter, to limit the search even more.<br><br>
    Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON SUNDAYS.<br><br>
    Request: /api/pickuppoint/postalcode/1407.xml?openingHoursSearchType=SUNDAY<br><br>
    Response: ...
</p>

<h4>Find pickup points open at specific hours</h4>
<p>If you want to return only the pickup points open on specific hours, you may add <code>?openOnOrBefore=&lt;time&gt;</code> and/or <code>?openOnOrAfter=&lt;time&gt;</code> to the request.<br><br>
    <code>&lt;time&gt; = HHMM</code><br><br>
    Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR BEFORE 08.00<br><br>
    Request: /api/pickuppoint/postalcode/1407.xml?openOnOrBefore=0800<br><br>
    Response: ...
    <br><br>
    Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR AFTER 22.00<br><br>
    Request: /api/pickuppoint/postalcode/1407.xml?openOnOrAfter=2200<br><br>
    Response: ...
</p>
</body>
</html>