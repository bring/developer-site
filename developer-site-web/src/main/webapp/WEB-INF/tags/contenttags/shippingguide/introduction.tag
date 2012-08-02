<%@ tag language="java" pageEncoding="UTF-8"%>
<p>The Shipping Guide (Fraktguiden) is a free service from Bring that is useful for anyone in need of price
   information, service area or estimated delivery times for different shipping alternatives delivered by Bring.
   With the shipping guide it is easy to offer different shipping alternatives to your customers: whether they want
   their products delivered in their mail box, wish to pick them up at the post office or want home delivery in the
   evening. The customers may also choose different shipping methods based on how fast and when they want their
   products delivered. The shipping guide calculates the delivery time and the price based on postal code. Which of
   the different shipping alternatives you want to offer and display in your web shop is up to you..
</p>

<p>
    <a href="http://fraktguide.bring.no/fraktguide/demoVelgFraktalternativ.do?from=7600&amp;to=1473&amp;weightInGrams=1800&amp;length=10&amp;width=20&amp;height=30&amp;product=servicepakke&amp;product=pa_doren&amp;product=bpakke_dor-dor&amp;product=a-post&amp;callbackUrl=http://fraktguide.bring.no/fraktguide/popupCallback.jsp">Demo</a>
    (Norwegian)
</p>

<p>All Shipping Guide services are basically the same service, but there are different methods of integration
   available: XML, JSON and Web Service<sup>1</sup>. Choose the option that fits your need best. Web Services is the
   core service with all functionality. There are some limitations in the XML/JSON API, such as the inability to
   mark a parcel as a specialized goods.
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
            <td>XML API is the easiest way to integrate the Shipping Guide with an online store. The method provides
                access to data from Bring via a single interface.
            </td>
            <td>Web browsers can retrieve information from external sites if the data are made available in JSONP
                format. The purpose is that you can paste HTML / Javascript on your web page and easily use data
                from the Shipping guide without server components on your web page.
            </td>
            <td>With Online Web Services, you can look up price, transportation, area coverage and product
                information for each product as required. For advanced users we recommend the Web Services with
                several options in the query.
            </td>

        </tr>
    </tbody>
</table>

<sup>1 You can also use <a href="../additionalresources/offlinedata.html?from=shipping">Offline data</a> as an
     integration method</sup>

