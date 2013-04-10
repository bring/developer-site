<%@ tag import="org.joda.time.LocalDate" %>
<%@ tag language="java" pageEncoding="UTF-8"%>
<p>
  The Shipping Guide (Fraktguiden) is a free service from Bring that&mdash;for most shipping alternatives offered by Bring&mdash;provides
  <ul>
    <li>price information,</li>
    <li>service area (norwegian: dekningsområde), and</li>
    <li>estimated delivery times.</li>
  </ul>
</p>
<p>
  With the Shipping Guide it is easy to offer different shipping alternatives to your end customers. Whether they want to
  <ul>
    <li>get delivery to the door (daytime or evening),</li>
    <li>pick up the shipment at a post office, or</li>
    <li>get the shipment delivered to the mailbox</li>
  </ul>
  The Shipping Guide returns the recommended way to present these shipping alternatives, as well as prices and delivery times.
</p>
<p>
    <b>
      <a target="_blank" href="http://fraktguide.bring.no/fraktguide/demoVelgFraktalternativ.do?from=0484&amp;to=0470&amp;weightInGrams=1800&amp;length=10&amp;width=20&amp;height=30&amp;product=servicepakke&amp;product=pa_doren&amp;product=bpakke_dor-dor&amp;product=a-post&amp;product=ekspress09&amp;product=b-post&amp;product=courier_1h&amp;callbackUrl=http://fraktguide.bring.no/fraktguide/popupCallback.jsp&amp;date=<%=new LocalDate()%>">Demo shipping alternatives form</a>
    </b>
    (Norwegian)
</p>
<p>
  The demo shows that the Shipping Guide returns product categories for each request, making a shipping alternatives-page easy to set up.
  The focus is on delivery methods to the end customer, not product names.
</p>
<p>
  The Shipping Guide has several interfaces (SOAP and XML/JSON).
  Choose the option that fits your needs best (see table below).
  The SOAP interface is the core interface with complete functionality.
  There are some limitations in the XML/JSON API, such as the inability to mark a parcel as a specialized goods.
</p>
<p>
  There is also a <a href="/additionalresources/offlinedata.html?from=shipping">Offline SOAP service</a> for retrieving data for offline use (get complete prices, service area and delivery times based on a fixed sender postal code).
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


