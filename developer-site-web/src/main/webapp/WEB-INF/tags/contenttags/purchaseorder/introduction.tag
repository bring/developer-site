<%@ tag language="java" pageEncoding="UTF-8"%>
<p>The API lets you view customer accounts associated with your account, find available reports for those accounts and generate and download reports. This is a step-by-step guide on how to use the API.
</p>

<div class="information-box">BETA! This API is currently in BETA, which means that even though the code is in production and fully functional,
  changes might be made in the future that can break code relying on this specific version.</div>
<p>
  Purchase Order has several interfaces (SOAP and XML/JSON).
  Choose the option that fits your needs best (see table below).
  The SOAP interface is the core interface with complete functionality.
  There are some limitations in the XML/JSON API, such as the inability to mark a parcel as a specialized goods.
</p>

<table>
    <thead>
        <tr>
            <th>xml</th>
            <th>json/jsonp</th>
            <th>Web Services/SOAP</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>The XML API is an easy way to integrate with the Shipping Guide using plain HTTP clients. It is also the best API to use when exploring the service using a web browser.
            </td>
            <td>Web browsers can (using JavaScript) retrieve information from external sites if the data are made available in JSONP
                format. The purpose is that you can paste HTML / Javascript on your web page and easily use data
                from the Shipping Guide without server components on your web page. See <a href="/widget/displayshippingguideinformationusingjsonp.html?from=shipping">widgets</a>.
            </td>
            <td>The SOAP API has the complete feature set of the Shipping Guide. It requires a SOAP client and the use of our <a href="/additionalresources/wsdl-xml-schema.html?from=shipping">WSDL</a>.
              It has an Online version (one request per shipment) or an offline version (e.g. nightly fetch prices, service area and delivery times based on a fixed consignor postal code).
            </td>

        </tr>
    </tbody>
</table>


