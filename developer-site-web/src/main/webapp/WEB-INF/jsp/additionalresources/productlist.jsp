<%@ page import="org.joda.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="shippingguide" tagdir="/WEB-INF/tags/contenttags/shippingguide" %>

<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/> <misc:title value="Product List"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

<misc:header_v2 selected_tab="developer"/>

<div id="page">
<section id="content">
<div class="row-fluid">
<div class="span9">
<div class="box">
    <h1>Product list</h1>
</div>

<div class="box">
<p>The Shipping Guide offers a broad range of products by Bring. We will gradually increase the number of products and
    functionality available in the service.</p>

<p>The table below shows currently available products and which information that is available. The links are to examples
    using XML API.</p>

<table class="productlist">
<thead>
<tr>
    <th>Product</th>
    <th>Product code</th>
    <th>Price</th>
    <th>Expected Delivery</th>
</tr>
</thead>
<tbody>

<tr>
    <td>Klimanøytral Servicepakke</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>SERVICEPAKKE</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr >
    <td>På Døren</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/PA_DOREN/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>PA_DOREN</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/PA_DOREN/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/PA_DOREN/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr>
    <td>Bedriftspakke</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/BPAKKE_DOR-DOR/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>BPAKKE_DOR-DOR</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/BPAKKE_DOR-DOR/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/BPAKKE_DOR-DOR/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr>
    <td>Bedriftspakke Ekspress-Over natten 09</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>EKSPRESS09</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr>
    <td>Minipakken</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/MINIPAKKE/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>MINIPAKKE</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/MINIPAKKE/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td>
        <a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/MINIPAKKE/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr >
    <td>A-Prioritert <sup>1</sup></td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/A-POST/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>A-POST</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/A-POST/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td>
        No
    </td>
</tr>

<tr>
    <td>B-Økonomi <sup>2</sup></td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/B-POST/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>B-POST</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/B-POST/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/B-POST/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr >
    <td>Småpakke A-Post</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SMAAPAKKER_A-POST/all.xml?weightInGrams=200&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>SMAAPAKKER_A-POST</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SMAAPAKKER_A-POST/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SMAAPAKKER_A-POST/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>
<tr >
    <td>Småpakke B-Økonomi</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SMAAPAKKER_B-POST/all.xml?weightInGrams=200&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>SMAAPAKKER_B-POST</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SMAAPAKKER_B-POST/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/SMAAPAKKER_B-POST/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr >
    <td>QuickPack SameDay <sup>3</sup></td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_SAMEDAY/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35"><code>QUICKPACK_SAMEDAY</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_SAMEDAY/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_SAMEDAY/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
</tr>

<tr>
    <td>Quickpack Over Night 0900</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_0900/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35"><code>QUICKPACK_OVER_NIGHT_0900</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_0900/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_0900/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
</tr>

<tr >
    <td>Quickpack Over Night 1200</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_1200/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35"><code>QUICKPACK_OVER_NIGHT_1200</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_1200/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_1200/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
</tr>

<tr>
    <td>Quickpack Day Certain</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35"><code>QUICKPACK_DAY_CERTAIN</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
</tr>

<tr >
    <td>Quickpack Express Economy</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_EXPRESS_ECONOMY/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35"><code>QUICKPACK_EXPRESS_ECONOMY</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_EXPRESS_ECONOMY/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_EXPRESS_ECONOMY/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
</tr>

<tr>
  <td>Cargo</td>
  <td><a target="_blank"
         href="http://fraktguide.bring.no/fraktguide/products/CARGO_GROUPAGE/all.xml?weightInGrams=44000&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>CARGO_GROUPAGE</code></a>
  </td>
  <td><a target="_blank"
         href="http://fraktguide.bring.no/fraktguide/products/CARGO_GROUPAGE/price.xml?weightInGrams=44000&amp;from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
  </td>
  <td><a target="_blank"
         href="http://fraktguide.bring.no/fraktguide/products/CARGO_GROUPAGE/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
  </td>
</tr>

<tr>
    <td>CarryOn Business <sup>4</sup></td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35"><code>CARRYON
        BUSINESS</code></a></td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
</tr>

<tr>
    <td>CarryOn Homeshopping <sup>4</sup> <sup>5</sup></td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35"><code>CARRYON
        HOMESHOPPING</code></a></td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=<%=new LocalDate()%>&amp;time=11:35">Yes</a>
    </td>
</tr>

<tr>
    <td>HomeDelivery CurbSide</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/HOMEDELIVERY_CURBSIDE_DAG/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>"><code>HOMEDELIVERY_CURBSIDE_DAG</code></a>
    </td>
    <td>
      No
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/HOMEDELIVERY_CURBSIDE_DAG/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=1407&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr >
    <td>Bud VIP</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_VIP/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>"><code>COURIER_VIP</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_VIP/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_VIP/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr>
    <td>Bud 1 time</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_1H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>"><code>COURIER_1H</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_1H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_1H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr >
    <td>Bud 2 timer</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_2H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>"><code>COURIER_2H</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_2H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_2H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr>
    <td>Bud 4 timer</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_4H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>"><code>COURIER_4H</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_4H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_4H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

<tr >
    <td>Bud 6 timer</td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_6H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>"><code>COURIER_6H</code></a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_6H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
    <td><a target="_blank"
           href="http://fraktguide.bring.no/fraktguide/products/COURIER_6H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=<%=new LocalDate()%>">Yes</a>
    </td>
</tr>

</tbody>
</table>

<sup>
1 Requests for expected delivery has longer response time.<br/>

2 B-Økonomi is intended for bulk sendings and has a mimimum requirement of 20 parcels, however, if weight
    exceeds 100g this limit is ignored.<br/>

3 Due to look-up in flight schedules, a request for this product has longer response time than for other
    products.<br/>

4 <a href="http://www.bring.no/hele-bring/produkter-og-tjenester/pakker/produkt/_attachment/9000" target="_blank">Fuel surcharge</a> is not included in the price returned from the ShippingGuide and must be calculated / added manually.
  Bring Parcels is entitled to change this charge without notice to the customer. Any fuel surcharge applied will be detailed on the invoice.<br/>

5 For shipments to Denmark, CARRYON_HOMESHOPPING needs to be ordered with the “PICKUP_POINT” additional service to send as a low-cost delivery from Bring’s parcel shops or parcel lockers. Otherwise the shipment will be sent as a more expensive home delivery.
</sup>

<h3><a name="additionalServices"></a>Additional Services</h3>

<p>The Shipping Guide supports the additional services listed in the table below.
   The value in the column "additional service code" is used when accessing the service.
</p>
<p>
  The links are to examples using XML API. See the <a href="/additionalresources/wsdl-xml-schema.html?from=shipping">WSDL/XML Schema page</a>
   for how to set these additional services in a SOAP request.
</p>
<div class="information-box">
  Some additional services get their own price in the response from the Shipping Guide, others are included (and change) the base package price.
   See column below 'Affects base package price?'.
</div>

<shippingguide:evarsling_notice/>

<table class="productlist">
    <thead>
    <tr>
        <th>Additional Service Code</th>
        <th>Additional Service</th>
        <th>Applies to</th>
        <th>Affects base package price?</th>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;additional=EVARSLING">EVARSLING</a>
        </td>
        <td>Recipient notification over SMS or E-Mail</td>
        <td>BPAKKE_DOR-DOR, SERVICEPAKKE, EKSPRESS09</td>
        <td>Yes, causes lower base package price from 2013-01-01</td>
    </tr>

    <tr>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;additional=POSTOPPKRAV">POSTOPPKRAV</a>
        </td>
        <td>Cash on Delivery</td>
        <td>A-POST, B-POST, BPAKKE_DOR-DOR, SERVICEPAKKE, PA_DOREN, EKSPRESS09</td>
        <td>No, is a stand-alone price</td>
    </tr>

    <tr>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;additional=LORDAGSUTKJORING">LORDAGSUTKJORING</a>
        </td>
        <td>Delivery on Saturdays</td>
        <td>EKSPRESS09</td>
        <td>No, is a stand-alone price</td>
    </tr>

    <tr>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/price.xml?weightInGrams=1500&amp;length=10&amp;width=10&amp;height=10&amp;from=0150&amp;fromCountry=NO&amp;to=80339&amp;toCountry=DE&amp;additional=ENVELOPE">ENVELOPE</a>
        </td>
        <td>QuickPack Envelope</td>
        <td>QUICKPACK_OVER_NIGHT_0900, QUICKPACK_OVER_NIGHT_1200, QUICKPACK_DAY_CERTAIN</td>
        <td>Yes, causes lower base package price</td>
    </tr>

    <tr>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARGO_GROUPAGE/price.xml?weightInGrams=150000&amp;length=100&amp;width=100&amp;height=100&amp;from=0150&amp;to=0484&amp;additional=ADVISERING">ADVISERING</a>
        </td>
        <td>Bring contacts recipient</td>
        <td>CARGO_GROUPAGE</td>
        <td>No, is a stand-alone price</td>
    </tr>

    <tr>
      <td><a target="_blank"
             href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING/price.xml?weightInGrams=1500&amp;length=60&amp;width=60&amp;height=60&amp;from=2000&amp;to=2000&amp;fromCountry=DK&amp;toCountry=DK&amp;additional=PICKUP_POINT">PICKUP_POINT</a>
      </td>
      <td>Delivery to pickup point</td>
      <td>CARRYON_HOMESHOPPING, CARRYON_HOMESHOPPING_BULKSPLIT</td>
      <td>Yes, causes lower base package price</td>
    </tr>

    </tbody>
</table>

</div>
<div>

</div>
</div>
<div class="span3">
    <div id="sidebar">
        <misc:sidebar/>
    </div>
</div>
</div>
</section>
</div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>

</html>