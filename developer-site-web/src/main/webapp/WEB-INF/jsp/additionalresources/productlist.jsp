<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=2012-07-10"><code>SERVICEPAKKE</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>På Døren</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/PA_DOREN/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=2012-07-10"><code>PA_DOREN</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/PA_DOREN/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/PA_DOREN/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr>
        <td>Bedriftspakke</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/BPAKKE_DOR-DOR/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=2012-07-10"><code>BPAKKE_DOR-DOR</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/BPAKKE_DOR-DOR/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/BPAKKE_DOR-DOR/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>Bedriftspakke Ekspress-Over natten 07</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS07/all.xml?weightInGrams=1500&amp;from=1407&amp;to=9007&amp;date=2012-07-10"><code>EKSPRESS07</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS07/price.xml?weightInGrams=1500&amp;from=1407&amp;to=9007&amp;date=2012-07-10">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS07/expectedDelivery.xml?from=1407&amp;to=9007&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr>
        <td>Bedriftspakke Ekspress-Over natten 09</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=2012-07-10"><code>EKSPRESS09</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=2012-07-10">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>A-Prioritert <sup>1</sup></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/A-POST/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=2012-07-10"><code>A-POST</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/A-POST/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/A-POST/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=2011-08-30">Yes</a>
        </td>
    </tr>

    <tr>
        <td>B-Økonomi <sup>2</sup></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/B-POST/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;date=2012-07-10"><code>B-POST</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/B-POST/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/B-POST/expectedDelivery.xml?from=7600&amp;to=1407&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>QuickPack SameDay <sup>3</sup></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_SAMEDAY/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35"><code>QUICKPACK_SAMEDAY</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_SAMEDAY/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_SAMEDAY/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr>
        <td>Quickpack Over Night 0900</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_0900/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35"><code>QUICKPACK_OVER_NIGHT_0900</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_0900/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_0900/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>Quickpack Over Night 1200</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_1200/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35"><code>QUICKPACK_OVER_NIGHT_1200</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_1200/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_OVER_NIGHT_1200/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr>
        <td>Quickpack Day Certain</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35"><code>QUICKPACK_DAY_CERTAIN</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>Quickpack Express Economy</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_EXPRESS_ECONOMY/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35"><code>QUICKPACK_EXPRESS_ECONOMY</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_EXPRESS_ECONOMY/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_EXPRESS_ECONOMY/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=57240&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr>
        <td>CarryOn Business Norway</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_NORWAY/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            BUSINESS NORWAY</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_NORWAY/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_NORWAY/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>CarryOn Business Sweden</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_SWEDEN/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=FR&amp;to=14400&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            BUSINESS SWEDEN</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_SWEDEN/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=FR&amp;to=14400&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_SWEDEN/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=FR&amp;to=14400&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr>
        <td>CarryOn Business Denmark</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_DENMARK/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=DK&amp;from=2100&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            BUSINESS DENMARK</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_DENMARK/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=DK&amp;from=2100&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_DENMARK/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=DK&amp;from=2100&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>CarryOn Business Finland</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_FINLAND/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=FI&amp;from=17220&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            BUSINESS FINLAND</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_FINLAND/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=FI&amp;from=17220&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_BUSINESS_FINLAND/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=FI&amp;from=17220&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr>
        <td>CarryOn Homeshopping Norway</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_NORWAY/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            HOMESHOPPING NORWAY</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_NORWAY/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_NORWAY/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=DK&amp;to=1407&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>CarryOn Homeshopping Sweden</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_SWEDEN/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=FR&amp;to=14400&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            HOMESHOPPING SWEDEN</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_SWEDEN/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=FR&amp;to=14400&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_SWEDEN/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=SE&amp;from=11446&amp;toCountry=FR&amp;to=14400&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr>
        <td>CarryOn Homeshopping Denmark</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_DENMARK/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=DK&amp;from=2100&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            HOMESHOPPING DENMARK</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_DENMARK/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=DK&amp;from=2100&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_DENMARK/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=DK&amp;from=2100&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>CarryOn Homeshopping Finland</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_FINLAND/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=FI&amp;from=17220&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35"><code>CARRYON
            HOMESHOPPING FINLAND</code></a></td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_FINLAND/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=FI&amp;from=17220&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_FINLAND/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=FI&amp;from=17220&amp;toCountry=BR&amp;to=123453&amp;date=2012-07-10&amp;time=11:35">Yes</a>
        </td>
    </tr>

    <tr>
        <td>HomeDelivery CurbSide</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/HOMEDELIVERY_CURBSIDE_DAG/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10"><code>HOMEDELIVERY_CURBSIDE_DAG</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/HOMEDELIVERY_CURBSIDE_DAG/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10">No</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/HOMEDELIVERY_CURBSIDE_DAG/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=1407&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>Bud VIP</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_VIP/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10"><code>COURIER_VIP</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_VIP/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_VIP/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr>
        <td>Bud 1 time</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_1H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10"><code>COURIER_1H</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_1H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_1H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>Bud 2 timer</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_2H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10"><code>COURIER_2H</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_2H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_2H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr>
        <td>Bud 4 timer</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_4H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10"><code>COURIER_4H</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_4H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_4H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    <tr class="even">
        <td>Bud 6 timer</td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_6H/all.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10"><code>COURIER_6H</code></a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_6H/price.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/COURIER_6H/expectedDelivery.xml?weightInGrams=1500&amp;volume=100&amp;fromCountry=NO&amp;from=1068&amp;toCountry=NO&amp;to=0150&amp;date=2012-07-10">Yes</a>
        </td>
    </tr>

    </tbody>
</table>

<sup>1 Requests for expected delivery has longer response time.</sup><br/> <sup>2 B-Økonomi is intended for bulk sendings
    and has a mimimum requirement of 20 parcels, however, if weight exceeds 100g this limit is ignored.</sup><br/> <sup>3
    Due to look-up in flight schedules, a request for this product has longer response time than for other
    products.</sup>

<h4>Additional Services</h4>

<p>The Shipping Guide offers some functionality regarding additional services. Please use the provided codes below when
    accessing the service. The links are to examples using XML API.</p>

<table class="productlist">
    <thead>
    <tr>
        <th>Additional Service Code</th>
        <th>Applies to</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>

    <tr>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;additional=EVARSLING">EVARSLING</a>
        </td>
        <td>BPAKKE_DOR-DOR<br/> SERVICEPAKKE<br/> EKSPRESS07<br/> EKSPRESS09<br/></td>
        <td>eVarsling</td>
    </tr>

    <tr class="even">
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;additional=POSTOPPKRAV">POSTOPPKRAV</a>
        </td>
        <td>A-POST<br/> B-POST<br/> BPAKKE_DOR-DOR<br/> SERVICEPAKKE<br/> PA_DOREN<br/> EKSPRESS07<br/> EKSPRESS09<br/></td>
        <td>Postoppkrav</td>
    </tr>

    <tr>
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/EKSPRESS09/price.xml?weightInGrams=1500&amp;from=7600&amp;to=1407&amp;additional=LORDAGSUTKJORING">LORDAGSUTKJORING</a>
        </td>
        <td>EKSPRESS09<br/></td>
        <td>Lørdagsutkjøring</td>
    </tr>

    <tr class="even">
        <td><a target="_blank"
               href="http://fraktguide.bring.no/fraktguide/products/QUICKPACK_DAY_CERTAIN/price.xml?weightInGrams=1500&amp;length=10&amp;width=10&amp;height=10&amp;from=0150&amp;fromCountry=NO&amp;to=80339&amp;toCountry=DE&amp;additional=ENVELOPE">ENVELOPE</a>
        </td>
        <td>QUICKPACK_OVER_NIGHT_0900<br/> QUICKPACK_OVER_NIGHT_1200<br/> QUICKPACK_DAY_CERTAIN<br/></td>
        <td>Envelope</td>
    </tr>

    </tbody>
</table>

</div>
<div>

</div>
</div>
<div class="span3">
    <div class="box">
        <a class="black" href="/api/shippingguideapi.html">
            <h4>Shipping Guide API</h4>
        </a>
        <ol>
            <li>
                <a href="/api/shippingguideapi.html#introduction"> Introduction </a>
            </li>

            <li>
                <a href="/api/shippingguideapi.html#reference"> Reference </a>
            </li>

            <li>
                <a href="/api/shippingguideapi.html#HTU"> How to Use </a>
            </li>

            <li>
                <a href="/api/shippingguideapi.html#additionalExamples"> Additional Examples </a>
            </li>
        </ol>

    </div>

    <div class="box">
        <h2>Additonal Resources</h2>
        <ul>
            <li><a href="../additionalresources/errorhandling.html">Error handling</a></li>
            <li><a href="../additionalresources/wsdl-xml-schema.html">WSDL/XML SCHEMA</a></li>
            <li><a href="../additionalresources/productlist.html">Product list</a></li>
            <li><a href="../additionalresources/offlinedata.html">Offline data</a></li>
        </ul>
        <h4>Widgets</h4>
        <ul>
            <li><a href="../widget/displayshippingguideinformationusingjsonp.html">Display shipping guide information
                                                                                   using jsonp</a></li>
            <li><a href="../widget/productselectionashtml.html">Product selection as html</a></li>
        </ul>
        <h4>Plugins</h4>
        <ul>
            <li><a href="../plugin/joomla-virtuemart-fraktpriser.html">Fraktguide for Joomla! Virtuemart</a></li>
            <li><a href="../plugin/oscommerce-fraktpriser.html">Fraktguide for osCommerce</a></li>
            <li><a href="../plugin/prestashop-fraktguide.html">Fraktguide for Prestashop</a></li>
            <li><a href="../plugin/wordpress-e-commerce-fraktguide.html">Fraktguide for Wordpress e-commerce</a></li>
            <li><a href="../plugin/zencart-fraktguide.html">Fraktguide for ZenCart</a></li>
        </ul>
    </div>

</div>
</div>
</section>
</div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>

</html>