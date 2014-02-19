<%@ tag language="java" pageEncoding="UTF-8"%>
<pre class="code-box">
&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;
&lt;LabelRequest&gt;
  &lt;CustomerId&gt;&lt;/CustomerId&gt;
  &lt;OrderDate&gt;&lt;/OrderDate&gt;
  &lt;Sender&gt;
	&lt;Name&gt;&lt;/Name&gt;
	&lt;PostalCode&gt;&lt;/PostalCode&gt;
	&lt;StateOrRegion&gt;&lt;/StateOrRegion&gt;
	&lt;City&gt;&lt;/City&gt;
	&lt;CountryCode&gt;&lt;/CountryCode&gt;
	&lt;Street&gt;&lt;/Street&gt;
	&lt;AddressLine&gt;&lt;/AddressLine&gt;
  &lt;/Sender&gt;
  &lt;Recipient&gt;
	&lt;CustomerId&gt;&lt;/CustomerId&gt;
	&lt;Name&gt;&lt;/Name&gt;
	&lt;PostalCode&gt;&lt;/PostalCode&gt;
	&lt;City&gt;&lt;/City&gt;
	&lt;CountryCode&gt;&lt;/CountryCode&gt;
	&lt;Street&gt;&lt;/Street&gt;
	&lt;AddressLine&gt;&lt;/AddressLine&gt;
  &lt;/Recipient&gt;
  &lt;Shipment&gt;
	&lt;PackageId&gt;&lt;/PackageId&gt;
	&lt;ShipmentId&gt;&lt;/ShipmentId&gt;
	&lt;CustomerReference&gt;&lt;/CustomerReference&gt;
	&lt;ProductCode&gt;&lt;/ProductCode&gt;
	&lt;Weight&gt;&lt;/Weight&gt;
  &lt;/Shipment&gt;
&lt;/LabelRequest&gt;
</pre>
<h2>Validation</h2>
<table>
    <thead>
        <tr>
            <th>Field</th>
            <th>Rules</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>LabelRequest/CustomerId</td>
            <td>
                <ul>
                    <li>Required</li>
                    <li>Must be a valid Mybring customer number</li>
                    <li><a href="http://developer.bring.com/api/bookingapi.html#customers_xml">Read more about Mybring customer numbers</a></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>LabelRequest/Sender</td>
            <td>
                <ul>
                    <li>Required</li>
                    <li>Name, Street, PostalCode, City and CountryCode are required</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>LabelRequest/Recipient</td>
            <td>
                <ul>
                    <li>Required</li>
                    <li>CustomerId, Name, Street, PostalCode, City and CountryCode are required</li>
                    <li>CustomerId must be a valid Mybring customer number</li>
                    <li><a href="http://developer.bring.com/api/bookingapi.html#customers_xml">Read more about Mybring customer numbers</a></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>LabelRequest/Shipment/PackageId</td>
            <td>
                <ul>
                    <li>Required</li>
                    <li>Must be a valid PackageId in the form <i>AB123456789NO</i></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>LabelRequest/Shipment/Weight</td>
            <td>
                <ul>
                    <li>Required</li>
                    <li>Must be an integer between 0 and 20</li>
                    <li>The unit is kilogram</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>