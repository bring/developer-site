<%@ tag language="java" pageEncoding="UTF-8"%>
<p>The API lets you view your customers purchacorders for you and register transport booking, delivery notice on this orders. This is a step-by-step guide on how to use the API.
</p>

<div class="information-box">ALPHA! This API is currently in ALPHA, changes will be made in the future that can break code relying on this specific version.</div>
<p>
  Purchase Order has several interfaces (SOAP and XML/JSON).
  Choose the option that fits your needs best (see table below).
  The SOAP interface is the core interface with complete functionality.
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
            <td>The XML API is an easy way to integrate with the Purchase Order using plain HTTP clients. It is also the best API to use when exploring the service using a web browser.
            </td>
            <td>Web browsers can (using JavaScript) retrieve information from external sites if the data are made available in JSONP
                format. The purpose is that you can paste HTML / Javascript on your web page and easily use data
                from the Purchase Order without server components on your web page.</a>.
            </td>
            <td>The SOAP API requires a SOAP client and the use of our <a href="/additionalresources/wsdl-xml-schema.html?from=purchaseorder">WSDL</a>.
            </td>

        </tr>
    </tbody>
</table>


