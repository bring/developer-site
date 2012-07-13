<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Shipping Guide API"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

<misc:header_v2 selected_tab="developer"/>

<div id="page">

<section id="content">

<div class="row-fluid">

<div class="span9">

<%--Heading--%>
<div class="box">
    <h1>Shipping Guide API</h1>

</div>

<%--Introduction--%>
<div class="box">
    <h2>Introduction</h2>

    <p>The Shipping Guide (Fraktguiden) is a free service from Bring that is useful for anyone in need of price
        information, service area or estimated delivery times for different shipping alternatives delivered by Bring.
        With the shipping guide it is easy to offer different shipping alternatives to your customers: whether they want
        their products delivered in their mail box, wish to pick them up at the post office or want home delivery in the
        evening. The customers may also choose different shipping methods based on how fast and when they want their
        products delivered. <br/><br/>The shipping guide calculates the delivery time and the price based on postal code.
        Which of the different shipping alternatives you want to offer and display in your web shop is up to you.. </p>

    <p>
        <a href="http://fraktguide.bring.no/fraktguide/demoVelgFraktalternativ.do?from=7600&to=1473&weightInGrams=1800&length=10&width=20&height=30&product=servicepakke&product=pa_doren&product=bpakke_dor-dor&product=a-post&callbackUrl=http://fraktguide.bring.no/fraktguide/popupCallback.jsp">Demo</a>
        (Norwegian)</p>

    <p>All Shipping Guide services are basically the same service, but there are different methods of integration
        available: XML, JSON and Web Service. Choose the option that fits your need best. Web Services is the core
        service with all functionality. There are some limitations in the XML/JSON API, such as the inability to mark a
        parcel as a specialized goods. </p>

    <table>
        <thead>
        <tr>
            <th>xml</th>
            <th>json/jsonp</th>
            <th>Web Services</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>XML API is the easiest way to integrate the Shipping Guide to an online store. The method provides
                access to data from Bring via a single interface.
            </td>
            <td>Web browsers can retrieve information from external sites if the data are made available in JSONP
                format. The purpose is that you can paste HTML / Javascript on your web page and easily use data from
                the Shipping guide without server components on your web page.
            </td>
            <td>With Online Web Services, you can look up price, transportation, area coverage and product information
                for each product as required. For advanced users we recommend the Web Services with several options in
                the query.
            </td>

        </tr>
        </tbody>
    </table>

    <sup>You can also use <a href="../additionalresources/offlinedata.html">Offline data</a> as an integration
        method</sup><br/>

</div>

<%--Reference Table--%>
<div class="box">

    <h2>Reference</h2>

    <p>Request prefix: <br/><code>http://fraktguide.bring.no/fraktguide</code></p>
    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td></td>
            <td></td>
        </tr>
        <tr class="even">
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>

</div>

<%--How to use--%>
<div class="box">

<h2>How to Use</h2>

<p>First you have to decide which integration method you want to use for the available data. The Introduction contains a
    comparison of the alternatives, to help you decide.</p>

<ul class="tab-group minimal" data-tabs="tabs">
    <li class="active"><a href="#tab1">XML</a></li>
    <li><a href="#tab2">JSON</a></li>
    <li><a href="#tab3">WEB SERVICES</a></li>
</ul>

<div class="tab-content tab-minimal">

    <div class="tab-pane active" id="tab1">

        <p> The Shipping Guide API is quite complex and supports a number of parameters. Some parameters are mandatory,
            others are optional, but any query to the Shipping Guide API must at least contain the following
            information: </p>
        <ul>
            <li><b>Response type:</b> What do you want in your response? Just the price of the shipment, just an
                estimated delivery time or all available information? By querying <a
                        href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500"
                        target="_blank"><code>price.xml</code></a> you will only get the price of the shipment, while <a
                        href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.xml?from=7600&to=1407&weightInGrams=1500"
                        target="_blank"><code>expectedDelivery.xml</code></a> will only show you an estimated delivery
                time. By querying <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=7600&to=1407&weightInGrams=1500"
                        target="_blank"><code>all.xml</code></a> you will not only get the price and the expected
                delivery time, but some additional information such as an indication of which alternative has the least
                environmental impact.
            </li>
            <li><b>Origin and destination:</b>What is the origin and destination of the shipment? For domestic shipments
                in Norway postal codes are sufficient, but for international shipments country codes must be specified,
                as well as postal codes (or city for countries that are not using postal codes). To specify a postal
                code such as "0361" add <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=0361&to=0361&weightInGrams=1500"
                        target="_blank"><code>&to=0361</code></a> or <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=0361&to=0361&weightInGrams=1500"
                        target="_blank"><code>from=0361</code></a> to your request. For international shipments use
                country codes (such as DK for Denmark) and add <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=0361&to=2100&weightInGrams=1500&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY"
                        target="_blank"><code>&toCountry=DK</code></a> or <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=2100&to=0361&weightInGrams=1500&fromCountry=DK&product=CARRYON_HOMESHOPPING_DENMARK"
                        target="_blank"><code>&fromCountry=DK</code></a> to your request.
            </li>
            <li>
                <b>Package size:</b> How big is the package? This can either be weight of the package in grams, its
                dimensions or volume. A weight of 1500 grams can be specified by <a target="_blank"
                                                                                    href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500"><code>&weightInGrams=1500</code></a>,
                dimensions of 30cm x 40cm x 40cm as <a target="_blank"
                                                       href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&length=30&width=40&height=40">
                <code>&length=30&width=40&height=40</code></a> or volume of 33dm<sup>3</sup> as <a target="_blank"
                                                                                                   href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&volume=33">
                <code>&volume=33</code></a> .
            </li>
        </ul>

        <div class="information-box"> Please add the name of the web-shop to the HTTP header "User-Agent" on each
            request to the service. If available, the name of the web-shop owner should also be added to the request. If
            you have a registered user at fraktguide.bring.no, please also include XML API's Public ID parameter in the
            query. Public ID is your personal Shipping Guide account id. It is a sequence of alphanumeric characters
            after the last dash in your identification. (Please login to see your identification string). If your
            Shipping Guide IE is: 372b269a-4f07-4c4e-92b9-<b>460cb92b0767</b> your pid is <b>460cb92b0767</b>. This
            makes it possible for us to send any relevant messages via the registered e-mail address.
        </div>

        <p><b>Example:</b><br/> Here is an example combining some of the parameters we have covered. The request is for a
            package with <code>weightInGrams=1500</code>, <code>from=7600</code> and <code>to=1407</code>.

        <div class="box lightBorder">
            <div data-tab="xml" class="tab api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://fraktguide.bring.no/fraktguide/products/all.xml?weightInGrams=1500&from=7600&to=1407"
                   data-internal="/proxy/shipping-guide/products/all.xml?weightInGrams=1500&from=7600&to=1407">
                    ../all.xml?weightInGrams=1500&from=7600&to=1407 </a>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>
        </div>

        <p>Please refer to the <a href="../additionalresources/wsdl-xml-schema.html">XML schema</a> for information on
            elements in the response.</p>

        <div class="information-box">When using the Shipping Guide, it is important to handle errors gracefully. Your
            web shop's users should still be able to order, even if the Shipping Guide returns an error or a timeout
            occurs. <a href="../additionalresources/errorhandling.html">Read more about error handling and error
                codes.</a>
        </div>

        <br/>
        <h4>Products</h4>

        <p>One parameter that can be quite useful is <code>&product</code>. This parameter lets you specify which
            product you want to return information about. Strictly speaking this is an optional parameter, but in some
            situations you will need to specify a product to get a sensible response. For instance if you make a query
            for an international shipment, you will have to specify a product that supports this. Use the <a
                    href="/additionalresources/productlist.html"> the product list</a> to find suitable products. </p>

        <p>
            <b>Example:</b><br/> Limit products to only SERVICEPAKKE and PA_DOREN: </p>

        <div class="box lightBorder">
            <div data-tab="xml" class="tab api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=PA_DOREN"
                   data-internal="/proxy/shipping-guide/products/all.xml?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=PA_DOREN">
                    ../all.xml?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=PA_DOREN </a>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>
        </div>

        <div class="information-box">Shipping Guide specifies VAT related to senders country. It's up to the client to
            decide if VAT is applicable to their situation of sale
        </div>

        <br/>
        <h4>Additional Services</h4>

        <p>There are currently 3 additional services that can be specified using this option: <code>additional=postoppkrav</code>,
            <code>additional=evarsling</code>, or <code>additional=lordagsutkjoring</code>. To add multiple services
            simply chain the parameters.</p>

        <p></p>

        <p><b>Example:</b><br/> Using all of the following services: "postoppkrav", "evarsling", and "lordagsutkjoring".
        </p>

        <div class="box lightBorder">
            <div data-tab="xml" class="tab api-call">
                <p>Request:</p>
                <pre><a target="_blank" class="request"
                   href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&date=2009-3-27&additional=postoppkrav&additional=evarslingadditional=lordagsutkjoring"
                   data-internal="/proxy/shipping-guide/products/price.xml?from=7600&to=1407&weightInGrams=1500&date=2009-3-27&additional=postoppkrav&additional=evarsling&additional=lordagsutkjoring">…/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27
                    &amp;additional=postoppkrav
                    &amp;additional=evarsling
                    &amp;additional=lordagsutkjoring</a></pre>

                <pre class="code-box xml response delay-snippet">Running request...</pre>
            </div>
        </div>

        <p>The Shipping Guide API has a lot of optional parameters not covered in this tutorial, and we recommend that
            you get familiar with the reference table and look at all the additional examples for further study.</p>

    </div>

    <div class="tab-pane" id="tab2">
        <p> The Shipping Guide API is quite complex and supports a number of parameters. Some parameters are mandatory,
            others are optional, but any query to the Shipping Guide API must at least contain the following
            information: </p>
        <ul>
            <li><b>Response type:</b> What do you want in your response? Just the price of the shipment, just an
                estimated delivery time or all available information? By querying <a
                        href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500"
                        target="_blank"><code>price.json</code></a> you will only get the price of the shipment, while <a
                        href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.json?from=7600&to=1407&weightInGrams=1500"
                        target="_blank"><code>expectedDelivery.json</code></a> will only show you an estimated delivery
                time. By querying <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&to=1407&weightInGrams=1500"
                        target="_blank"><code>all.json</code></a> you will not only get the price and the expected
                delivery time, but some additional information such as an indication of which alternative has the least
                environmental impact.
            </li>
            <li><b>Origin and destination:</b>What is the origin and destination of the shipment? For domestic shipments
                in Norway postal codes are sufficient, but for international shipments country codes must be specified,
                as well as postal codes (or city for countries that are not using postal codes). To specify a postal
                code such as "0361" add <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.json?from=0361&to=0361&weightInGrams=1500"
                        target="_blank"><code>&to=0361</code></a> or <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.json?from=0361&to=0361&weightInGrams=1500"
                        target="_blank"><code>from=0361</code></a> to your request. For international shipments use
                country codes (such as DK for Denmark) and add <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.json?from=0361&to=2100&weightInGrams=1500&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY"
                        target="_blank"><code>&toCountry=DK</code></a> or <a
                        href="http://fraktguide.bring.no/fraktguide/products/all.json?from=2100&to=0361&weightInGrams=1500&fromCountry=DK&product=CARRYON_HOMESHOPPING_DENMARK"
                        target="_blank"><code>&fromCountry=DK</code></a> to your request.
            </li>
            <li>
                <b>Package size:</b> How big is the package? This can either be weight of the package in grams, its
                dimensions or volume. A weight of 1500 grams can be specified by <a target="_blank"
                                                                                    href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500"><code>&weightInGrams=1500</code></a>,
                dimensions of 30cm x 40cm x 40cm as <a target="_blank"
                                                       href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&length=30&width=40&height=40">
                <code>&length=30&width=40&height=40</code></a> or volume of 33dm<sup>3</sup> as <a target="_blank"
                                                                                                   href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&volume=33">
                <code>&volume=33</code></a> .
            </li>
        </ul>

        <div class="information-box"> Please add the name of the web-shop to the HTTP header "User-Agent" on each
            request to the service. If available, the name of the web-shop owner should also be added to the request. If
            you have a registered user at fraktguide.bring.no, please also include XML API's Public ID parameter in the
            query. Public ID is your personal Shipping Guide account id. It is a sequence of alphanumeric characters
            after the last dash in your identification. (Please login to see your identification string). If your
            Shipping Guide IE is: 372b269a-4f07-4c4e-92b9-<b>460cb92b0767</b> your pid is <b>460cb92b0767</b>. This
            makes it possible for us to send any relevant messages via the registered e-mail address.
        </div>

        <p><b>Example:</b><br/> Here is an example combining some of the parameters we have covered. The request is for a
            package with <code>weightInGrams=1500</code>, <code>from=7600</code> and <code>to=1407</code>.

        <div class="box lightBorder">
            <div data-tab="json" class="tab api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://fraktguide.bring.no/fraktguide/products/all.json?weightInGrams=1500&from=7600&to=1407"
                   data-internal="/proxy/shipping-guide/products/all.json?weightInGrams=1500&from=7600&to=1407">
                    ../all.json?weightInGrams=1500&from=7600&to=1407 </a>
                <pre class="code-box json response delay-snippet"></pre>
            </div>
        </div>

        <p>Please refer to the <a href="../additionalresources/wsdl-xml-schema.html">XML schema</a> for information on
            elements in the response.</p>

        <div class="information-box">When using the Shipping Guide, it is important to handle errors gracefully. Your
            web shop's users should still be able to order, even if the Shipping Guide returns an error or a timeout
            occurs. <a href="../additionalresources/errorhandling.html">Read more about error handling and error
                codes.</a>
        </div>

        <br/>
        <h4>Products</h4>

        <p>One parameter that can be quite useful is <code>&product</code>. This parameter lets you specify which
            product you want to return information about. Strictly speaking this is an optional parameter, but in some
            situations you will need to specify a product to get a sensible response. For instance if you make a query
            for an international shipment, you will have to specify a product that supports this. Use the <a
                    href="/additionalresources/productlist.html"> the product list</a> to find suitable products. </p>

        <p>
            <b>Example:</b><br/> Limit products to only SERVICEPAKKE and PA_DOREN: </p>

        <div class="box lightBorder">
            <div data-tab="json" class="tab api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=PA_DOREN"
                   data-internal="/proxy/shipping-guide/products/all.json?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=PA_DOREN">
                    ../all.json?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=PA_DOREN </a>
                <pre class="code-box json response delay-snippet"></pre>
            </div>
        </div>

        <div class="information-box">Shipping Guide specifies VAT related to senders country. It's up to the client to
            decide if VAT is applicable to their situation of sale
        </div>

        <br/>
        <h4>Additional Services</h4>

        <p>There are currently 3 additional services that can be specified using this option: <code>additional=postoppkrav</code>,
            <code>additional=evarsling</code>, or <code>additional=lordagsutkjoring</code>. To add multiple services
            simply chain the parameters.</p>

        <p></p>

        <p><b>Example:</b><br/> Using all of the following services: "postoppkrav", "evarsling", and "lordagsutkjoring".
        </p>

        <div class="box lightBorder">
            <div data-tab="json" class="tab api-call">
                <p>Request:</p>
                <pre><a target="_blank" class="request"
                        href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500&date=2009-3-27&additional=postoppkrav&additional=evarslingadditional=lordagsutkjoring"
                        data-internal="/proxy/shipping-guide/products/price.json?from=7600&to=1407&weightInGrams=1500&date=2009-3-27&additional=postoppkrav&additional=evarsling&additional=lordagsutkjoring">…/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27
                    &amp;additional=postoppkrav
                    &amp;additional=evarsling
                    &amp;additional=lordagsutkjoring</a></pre>

                <pre class="code-box json response delay-snippet">Running request...</pre>
            </div>
        </div>

        <p>The Shipping Guide API has a lot of optional parameters not covered in this tutorial, and we recommend that
            you get familiar with the reference table and look at all the additional examples for further study.</p>
    </div>


    <div class="tab-pane" id="tab3">

        <br/>

        <p>The webservices offers the most options when performing queries to the Shipping Guide. Please refer to
            written documentation in <a href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
            or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
        </p><br/>

        <p><b>To execute the web-service you will need a identification string. To get this - please <a
                href="http://fraktguide.bring.no/fraktguide/registrerBruker.do" target=_blank>register</a>.</b></p>

        <p>More information about <a href="../additionalresources/wsdl-xml-schema.html">WSDL/XML Schema</a>.<a
                href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-latest.wsdl">WSDL</a>(will always link to the
            latest version)</p><br/>

        <p>We recommend <a href="http://www.soapui.org/">soapUI</a> to test the Web Service</p><br/>

        <p>Please refer to common information regarding <a href="../additionalresources/productlist.jsp">product
            codes</a> and <a href="../additionalresources/errorhandling.html">error codes</a>.</p>

        <div><pre class="code-box">// Initialize library

String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withWeightInGrams("1500");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.ALL);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();
String workingDays = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getExpectedDelivery().getWorkingDays();
String descriptionText = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getGuiInformation().getDescriptionText();

// Print out
System.out.println("Price: " + price + " NOK");
System.out.println("Working days: " + workingDays);
System.out.println("Display name: " + descriptionText);</pre>
            <div><p>Expected Result:</p>
                                            <pre class="code-box">Price: 81.00 NOK
Working days: 2
Display name: RIMI Vinterbro. Åpningstider Man - Fre: 1000-2100, Lør: 0900-1800
                                        </pre>
            </div>
        </div>

    </div>

</div>

</div>

<%--Additional examples--%>
<div class="box">
<h2>Additional examples</h2>

<div class="row element-sample">
<ul class="menu-group collapsing no-shadow">

    <li>
    <a href="#" class="menu-item">
        <h4>Multiple parcels in one query</h4></a>

    <div class="content-box" style="display: none;">

        <div>
            <p>It is also possible to combine weight, volume and dimensions for multiple parcels. Multiple parcels are
                specified by suffixing weightInGrams, volume or dimensions (length, width or height), with sequential
                numbers from 0.</p>
        </div>
        <p>The data used in this example is:</p>
        <ul>
            <li><code>from=7041</code></li>
            <li><code>to=0558</code></li>
        </ul>

        <p>Parcels:</p>
        <ol>
            <li><code>weightInGrams0=1500</code></li>
            <li><code>volume1=33</code></li>
            <li><code>length2=10&width2=20 &height2=30</code></li>
        </ol>
        <br/>

        <div class="box lightBorder">

            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab21">XML</a></li>
                    <li><a href="#tab22">JSON</a></li>
                    <li><a href="#tab23">JAVA</a></li>
                </ul>
                <div class="tab-content tab-minimal">

                    <div class="tab-pane active" id="tab21">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=7041&to=0558&weightInGrams0=1500&volume1=33&length2=10&width2=20&height2=30"
                               data-internal="/proxy/shipping-guide/products/all.xml?from=7041&to=0558&weightInGrams0=1500&volume1=33&length2=10&width2=20&height2=30">
                                ../all.xml?from=7041&to=0558&weightInGrams0=1500&volume1=33&length2=10&width2=20&height2=30 </a>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab22">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7041&to=0558&weightInGrams0=1500&volume1=33&length2=10&width2=20&height2=30"
                               data-internal="/proxy/shipping-guide/products/all.json?from=7041&to=0558&weightInGrams0=1500&volume1=33&length2=10&width2=20&height2=30">
                                ../all.json?from=7041&to=0558&weightInGrams0=1500&volume1=33&length2=10&width2=20&height2=30 </a>

                            <p class="right">JSONP Request: <a href="#">?callback=functionName</a></p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab23">
                        <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withWeightInGrams("1500");
Package packet2 = new Package();
packet2.withVolume("33");
Package packet3 = new Package();
packet3.withLength("10").withWidth("20").withHeight("30");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.addPackage(packet).addPackage(packet2).addPackage(packet3);

System.out.println(shipment.toQueryString());
// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.ALL);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();
String workingDays = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getExpectedDelivery().getWorkingDays();
String descriptionText = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getGuiInformation().getDescriptionText();

// Print out
System.out.println("Price: " + price + " NOK");
System.out.println("Working days: " + workingDays);
System.out.println("Display name: " + descriptionText);</pre>
                            <div><p>Expected Result:</p>
                                            <pre class="code-box">Price: 268.00 NOK
Working days: 2
Display name: RIMI Vinterbro. Åpningstider Man - Fre: 1000-2100, Lør: 0900-1800
                                        </pre>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</li>

    <li>
    <a href="#" class="menu-item"><h4>International shipments</h4></a>

    <div class="content-box" style="display: none;">
        <div><p>Specified using <code>fromCountry=NO&toCountry=DK</code>.</p>

            <p><a href="http://www.iso.org/iso/iso-3166-1_decoding_table.html">Country Codes are ISO-3166-1-alpha-2</a>
            </p>

        </div>
        <div class="box lightBorder">
            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab51">XML</a></li>
                    <li><a href="#tab52">JSON</a></li>
                    <li><a href="#tab53">WEB SERVICES</a></li>
                    <li><a href="#tab54">JAVA</a></li>
                </ul>

                <div class="tab-content tab-minimal">

                    <div class="tab-pane active" id="tab51">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.xml?from=2100&to=2100&fromCountry=NO&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY"
                               data-internal="/proxy/shipping-guide/products/expectedDelivery.xml?from=2100&to=2100&fromCountry=NO&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY">
                                ../products/expectedDelivery.xml?from=2100&to=2100&fromCountry=NO&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY </a><br/>

                            <p>Response:</p>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab52">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.json?from=2100&to=2100&fromCountry=NO&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY"
                               data-internal="/proxy/shipping-guide/products/expectedDelivery.json?from=2100&to=2100&fromCountry=NO&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY">
                                ../products/expectedDelivery.json?from=2100&to=2100&fromCountry=NO&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY </a>

                            <p class="right">JSONP Request: <a
                                    href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.json?from=2100&to=2100&fromCountry=NO&toCountry=DK&product=CARRYON_HOMESHOPPING_NORWAY&callbackUrl=functionName">?callback=functionName</a>
                            </p>

                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab53">
                        <p>Please refer to written documentation in <a
                                href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                            or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                        </p>
                    </div>

                    <div class="tab-pane" id="tab54">
                        <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Shipment shipment = new Shipment();
shipment.withFromPostalCode("2100");
shipment.withFromCountry("NO");
shipment.withToPostalCode("2100");
shipment.withToCountry("DK");
shipment.addProduct(ProductType.CARRYON_HOMESHOPPING_NORWAY);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.EXPECTED_DELIVERY);
String expectedDeliveryDays = shippingGuideResult.getProduct(ProductType.CARRYON_HOMESHOPPING_NORWAY).getExpectedDelivery().getWorkingDays();

// Print out
System.out.println("Expected delivery days: " + expectedDeliveryDays);</pre>
                        </div>

                        <div><p>Expected output:</p>
                            <pre class="code-box">Expected delivery days: 3-5</pre>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
</li>

    <li>
    <a href="#" class="menu-item"><h4>International shipments to countries without postal codes</h4></a>

    <div class="content-box" style="display: none;">

        <div><p>In the example below, a parcel is sent from Norway to Dublin, Ireland. <br/><br/>The parameters are:</p>
            <ul>
                <li><code>?fromCountry=NO</code></li>
                <li><code>&toCountry=IE</code></li>
                <li><code>&to=0</code></li>
                <li><code>&toCity=Dublin</code></li>
            </ul>
            <br/>

            <p>To see both the expected delivery time and the price, we've added:</p>
            <ul>
                <li><code>&weightInGrams=300</code>, and</li>
                <li><code>all.xml</code></li>
            </ul>
        </div>
        <br/>

        <div class="box lightBorder">
            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab41">XML</a></li>
                    <li><a href="#tab42">JSON</a></li>
                    <li><a href="#tab43">WEB SERVICES</a></li>
                    <li><a href="#tab44">JAVA</a></li>
                </ul>

                <div class="tab-content tab-minimal">

                    <div class="tab-pane active" id="tab41">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/all.xml?fromCountry=NO&toCountry=IE&from=7600&to=0&toCity=Dublin&product=CARRYON_HOMESHOPPING_NORWAY&weightInGrams=300"
                               data-internal="/proxy/shipping-guide/products/all.xml?fromCountry=NO&toCountry=IE&from=7600&to=0&toCity=Dublin&product=CARRYON_HOMESHOPPING_NORWAY&weightInGrams=300">
<pre>../products/all.xml?fromCountry=NO&toCountry=IE
                   &from=7600&to=0&toCity=Dublin
                   &product=CARRYON_HOMESHOPPING_NORWAY&weightInGrams=300</pre>
                            </a>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab42">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/all.json?fromCountry=NO&toCountry=IE&from=7600&to=0&toCity=Dublin&product=CARRYON_HOMESHOPPING_NORWAY&weightInGrams=300"
                               data-internal="/proxy/shipping-guide/products/all.json?fromCountry=NO&toCountry=IE&from=7600&to=0&toCity=Dublin&product=CARRYON_HOMESHOPPING_NORWAY&weightInGrams=300">
<pre>../products/all.json?fromCountry=NO&toCountry=IE
                   &from=7600&to=0&toCity=Dublin
                   &product=CARRYON_HOMESHOPPING_NORWAY&weightInGrams=300</pre>
                            </a>

                            <p class="right">JSONP Request: <a href="#">?callback=functionName</a></p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab43">
                        <p>Please refer to written documentation in <a
                                href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                            or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                        </p>
                    </div>

                </div>
            </div>
        </div>

    </div>
</li>

    <li>
    <a href="#" class="menu-item"><h4>Three ways to specify a package size</h4></a>

    <div class="content-box" style="display: none;">

        <div><h4>Weight in grams</h4></div>
        <div><p>Specified using <code>weightInGrams=1500</code>.</p>

        </div>
        <div class="box lightBorder">
            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab71">XML</a></li>
                    <li><a href="#tab72">JSON</a></li>
                    <li><a href="#tab73">WEB SERVICES</a></li>
                    <li><a href="#tab74">JAVA</a></li>
                </ul>

                <div class="tab-content tab-minimal">

                    <div class="tab-pane active" id="tab71">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500"
                               data-internal="/proxy/shipping-guide/products/price.xml?from=7600&to=1407&weightInGrams=1500">
                                ../products/price.xml?from=7600&to=1407&weightInGrams=1500</a><br/>

                            <p>Response:</p>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab72">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500"
                               data-internal="/proxy/shipping-guide/products/price.json?from=7600&to=1407&weightInGrams=1500">
                                ../products/price.json?from=7600&to=1407&weightInGrams=1500</a>

                            <p class="right">JSONP Request: <a
                                    href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500&callbackUrl=functionName">?callback=functionName</a>
                            </p>

                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab73">
                        <p>Please refer to written documentation in <a
                                href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                            or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                        </p>
                    </div>

                    <div class="tab-pane" id="tab74">
                        <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withWeightInGrams("1500");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.PRICE);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();

// Print out
System.out.println("Price: " + price + " NOK");</pre>
                        </div>

                        <div><p>Expected output:</p>
                            <pre class="code-box">Price: 94.00 NOK</pre>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div><h4>Package dimentions</h4></div>
        <div><p>Specified using <code>length=30&amp;width=40&amp;height=40</code>.</p>

        </div>
        <div class="box lightBorder">
            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab61">XML</a></li>
                    <li><a href="#tab62">JSON</a></li>
                    <li><a href="#tab63">WEB SERVICES</a></li>
                    <li><a href="#tab64">JAVA</a></li>
                </ul>

                <div class="tab-content tab-minimal">

                    <div class="tab-pane active" id="tab61">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&length=30&width=40&height=40"
                               data-internal="/proxy/shipping-guide/products/price.xml?from=7600&to=1407&length=30&width=40&height=40">
                                ../products/price.xml?from=7600&to=1407&length=30&width=40&height=40</a><br/>

                            <p>Response:</p>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab62">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&length=30&width=40&height=40"
                               data-internal="/proxy/shipping-guide/products/price.json?from=7600&to=1407&length=30&width=40&height=40">
                                ../products/price.json?from=7600&to=1407&length=30&width=40&height=40</a>

                            <p class="right">JSONP Request: <a
                                    href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&length=30&width=40&height=40&callbackUrl=functionName">?callback=functionName</a>
                            </p>

                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab63">
                        <p>Please refer to written documentation in <a
                                href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                           or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                        </p>
                    </div>

                    <div class="tab-pane" id="tab64">
                        <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withLength("30").withWidth("40").withHeight("40");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.PRICE);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();

// Print out
System.out.println("Price: " + price + " NOK");</pre>
                        </div>

                        <div><p>Expected output:</p>
                            <pre class="code-box">Price: 94.00 NOK</pre>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div><h4>Volume</h4>
        <p>Instead of, or in addition to using the package's weight and dimensions you can specify volume. This is relevant for non-rectangular hexahedron shaped packages, and depending on the volume, it could affect the set of available products.
           The unit is dm3.</p></div>
        <div><p>Specified using <code>volume=33</code>.</p>

        </div>
        <div class="box lightBorder">
            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab81">XML</a></li>
                    <li><a href="#tab82">JSON</a></li>
                    <li><a href="#tab83">WEB SERVICES</a></li>
                    <li><a href="#tab84">JAVA</a></li>
                </ul>

                <div class="tab-content tab-minimal">

                    <div class="tab-pane active" id="tab81">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;volume=33"
                               data-internal="/proxy/shipping-guide/products/price.xml?from=7600&amp;to=1407&amp;volume=33">
                                ../products/price.xml?from=7600&amp;to=1407&amp;volume=33</a><br/>

                            <p>Response:</p>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab82">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;volume=33"
                               data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;volume=33">
                                ../products/price.json?from=7600&amp;to=1407&amp;volume=33</a>

                            <p class="right">JSONP Request: <a
                                    href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&volume=33&callbackUrl=functionName">?callback=functionName</a>
                            </p>

                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab83">
                        <p>Please refer to written documentation in <a
                                href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                           or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                        </p>
                    </div>

                    <div class="tab-pane" id="tab84">
                        <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withVolume("33");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.PRICE);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();

// Print out
System.out.println("Price: " + price + " NOK");</pre>
                        </div>

                        <div><p>Expected output:</p>
                            <pre class="code-box">Price: 94.00 NOK</pre>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>
</li>

    <li>
    <a href="#" class="menu-item"><h4>Get the expected delivery date</h4></a>

    <div class="content-box" style="display: none;">

        <div>
            <p>Specifies the date the package is delivered to Bring. The parameter is used to calculate the
               expected delivery date.</p>
            <p>Specified using <code>date=2009-02-03</code>.</p>
            <p>Accepted date format: <code>YYYY-MM-DD</code>.</p>
            <p>If this parameter is specified,  the response will include expected delivery date,
               in addition to expected number of working days.</p>
        </div>
        <br/>

        <div class="box lightBorder">
            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab91">XML</a></li>
                    <li><a href="#tab92">JSON</a></li>
                    <li><a href="#tab93">WEB SERVICES</a></li>
                    <li><a href="#tab94">JAVA</a></li>
                </ul>

                <div class="tab-content tab-minimal">

                    <div class="tab-pane active" id="tab91">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=7600&to=1407&volume=33&date=2011-07-30&product=EKSPRESS09"
                               data-internal="/proxy/shipping-guide/products/all.xml?from=7600&to=1407&volume=33&date=2011-07-30&product=EKSPRESS09">
<pre>../products/all.xml?from=7600&to=1407&volume=33&date=2011-07-30&product=EKSPRESS09</pre>
                            </a>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab92">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&to=1407&volume=33&date=2011-07-30&product=EKSPRESS09"
                               data-internal="/proxy/shipping-guide/products/all.json?from=7600&to=1407&volume=33&date=2011-07-30&product=EKSPRESS09">
<pre>../products/all.json?from=7600&to=1407&volume=33&date=2011-07-30&product=EKSPRESS09</pre>
                            </a>

                            <p class="right">JSONP Request: <a href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&to=1407&volume=33&date=2011-07-30&product=EKSPRESS09&callbackUrl=functionName">?callback=functionName</a></p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>

                    <div class="tab-pane" id="tab93">
                        <p>Please refer to written documentation in <a
                                href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                           or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                        </p>
                    </div>

                    <div class="tab-pane" id="tab94">
                        <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withVolume("33");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.withShippingDateTime(new DateTime("2011-07-30"));
shipment.addProduct(ProductType.EKSPRESS09);
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.ALL);
String price = shippingGuideResult.getProduct(ProductType.EKSPRESS09).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();

// Print out
System.out.println("Price: " + price + " NOK");
</pre>
                        </div>

                        <div><p>Expected output:</p>
                            <pre class="code-box">Price: 408.00 NOK</pre>
                        </div>

                </div>
            </div>
        </div>

    </div>
    </div>
</li>

    <li>
        <a href="#" class="menu-item"><h4>Specify the pickup time from the departure point</h4></a>

        <div class="content-box" style="display: none;">

            <div>
                <p>Use this paramter if you would like to specify when during the day the package needs
                   to be picked up from the departure point.</p>
                <p>This parameter is only considered for courier and express products.</p>
                <p>Specified using <code>date=2011-07-28&amp;time=13:37</code> (date and time is required to use this option).</p>
                <p>Accepted format is <code>hh:mm</code>. (AM and PM not allowed, please use 24-hour clock.)</p>
            </div>
            <br/>

            <div class="box lightBorder">
                <div class="row element-sample">
                    <ul class="tab-group minimal" data-tabs="tabs">
                        <li class="active"><a href="#tab111">XML</a></li>
                        <li><a href="#tab112">JSON</a></li>
                        <li><a href="#tab113">WEB SERVICES</a></li>
                        <li><a href="#tab114">JAVA</a></li>
                    </ul>

                    <div class="tab-content tab-minimal">

                        <div class="tab-pane active" id="tab111">
                            <div data-tab="xml" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=7600&to=1407&volume=33&date=2011-08-30&time=13:37"
                                   data-internal="/proxy/shipping-guide/products/all.xml?from=7600&to=1407&volume=33&date=2011-08-30&time=13:37">
                                    <pre>../all.xml?from=7600&to=1407&volume=33&date=2011-08-30&time=13:37</pre>
                                </a>
                                <pre class="code-box xml response delay-snippet"></pre>
                            </div>

                        </div>

                        <div class="tab-pane" id="tab112">
                            <div data-tab="json" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&to=1407&volume=33&date=2011-08-30&time=13:37"
                                   data-internal="/proxy/shipping-guide/products/all.json?from=7600&to=1407&volume=33&date=2011-08-30&time=13:37">
                                    <pre>../all.json?from=7600&to=1407&volume=33&date=2011-08-30&time=13:37</pre>
                                </a>

                                <p class="right">JSONP Request: <a href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&to=1407&volume=33&date=2011-08-30&time=13:37&callbackUrl=functionName">?callback=functionName</a></p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab113">
                            <p>Please refer to written documentation in <a
                                    href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                               or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                            </p>
                        </div>

                        <div class="tab-pane" id="tab114">
                            <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withVolume("33");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.withShippingDateTime(new DateTime(2011, 8, 30, 13, 37, 0, 0));
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.ALL);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();

// Print out
System.out.println("Price: " + price + " NOK");</pre>
                            </div>

                            <div><p>Expected output:</p>
                                <pre class="code-box">Price: 106.00 NOK</pre>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            </div>
    </li>

    <li>
        <a href="#" class="menu-item"><h4>Specify whether or not the shipment has been pre-registered (EDI)</h4></a>

        <div class="content-box" style="display: none;">

            <div>
                <p>Specify whether or not the shipment has been pre-registered (EDI).</p>
                <p>Specified using <code>edi=false</code>.</p>
                <p>This will affect response prices and might affect which products are available.</p>
                <p>Default: <code>true</code></p>
            </div>
            <br/>

            <div class="box lightBorder">
                <div class="row element-sample">
                    <ul class="tab-group minimal" data-tabs="tabs">
                        <li class="active"><a href="#tab121">XML</a></li>
                        <li><a href="#tab122">JSON</a></li>
                        <li><a href="#tab123">WEB SERVICES</a></li>
                        <li><a href="#tab124">JAVA</a></li>
                    </ul>

                    <div class="tab-content tab-minimal">

                        <div class="tab-pane active" id="tab121">
                            <div data-tab="xml" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&edi=false"
                                   data-internal="/proxy/shipping-guide/products/price.xml?from=7600&to=1407&weightInGrams=1500&edi=false">
                                    <pre>../price.xml?from=7600&to=1407&weightInGrams=1500&edi=false</pre>
                                </a>
                                <pre class="code-box xml response delay-snippet"></pre>
                            </div>

                        </div>

                        <div class="tab-pane" id="tab122">
                            <div data-tab="json" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500&edi=false"
                                   data-internal="/proxy/shipping-guide/products/price.json?from=7600&to=1407&weightInGrams=1500&edi=false">
                                    <pre>../price.json?from=7600&to=1407&weightInGrams=1500&edi=false</pre>
                                </a>

                                <p class="right">JSONP Request: <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&edi=false&callbackUrl=functionName">?callback=functionName</a></p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab123">
                            <p>Please refer to written documentation in <a
                                    href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                               or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                            </p>
                        </div>

                        <div class="tab-pane" id="tab124">
                            <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withWeightInGrams("1500");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.withEdi(false);
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.ALL);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();

// Print out
System.out.println("Price: " + price + " NOK");</pre>
                            </div>

                            <div><p>Expected output:</p>
                                <pre class="code-box">Price: 81.00 NOK</pre>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </li>

    <li>
        <a href="#" class="menu-item"><h4>Specify if the package was shipped from a post office</h4></a>

        <div class="content-box" style="display: none;">

            <div>
                <p>The response data may vary depending on whether or not Bring must collect the
                   shipment, or if the customer delivers the shipment from a post office.</p>
                <p>This parameter specifies whether or not the package is delivered to a post office before shipping</p>
                <p>Specified using <code>postingAtPostOffice=true</code></p>
                <p>Default: <code>false</code></p>
            </div>
            <br/>

            <div class="box lightBorder">
                <div class="row element-sample">
                    <ul class="tab-group minimal" data-tabs="tabs">
                        <li class="active"><a href="#tab131">XML</a></li>
                        <li><a href="#tab132">JSON</a></li>
                        <li><a href="#tab133">WEB SERVICES</a></li>
                        <li><a href="#tab134">JAVA</a></li>
                    </ul>

                    <div class="tab-content tab-minimal">

                        <div class="tab-pane active" id="tab131">
                            <div data-tab="xml" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&postingAtPostoffice=true&product=SERVICEPAKKE"
                                   data-internal="/proxy/shipping-guide/products/price.xml?from=7600&to=1407&weightInGrams=1500&postingAtPostoffice=true&product=SERVICEPAKKE">
                                    <pre>../price.xml?from=7600&to=1407&weightInGrams=1500&postingAtPostoffice=true&product=SERVICEPAKKE</pre>
                                </a>
                                <pre class="code-box xml response delay-snippet"></pre>
                            </div>

                        </div>

                        <div class="tab-pane" id="tab132">
                            <div data-tab="json" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500&postingAtPostoffice=true&product=SERVICEPAKKE"
                                   data-internal="/proxy/shipping-guide/products/price.json?from=7600&to=1407&weightInGrams=1500&postingAtPostoffice=true&product=SERVICEPAKKE">
                                    <pre>../price.json?from=7600&to=1407&weightInGrams=1500&postingAtPostoffice=true&product=SERVICEPAKKE</pre>
                                </a>

                                <p class="right">JSONP Request: <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&edi=false&callbackUrl=functionName">?callback=functionName</a></p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>

                        <div class="tab-pane" id="tab133">
                            <p>Please refer to written documentation in <a
                                    href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a>
                               or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.
                            </p>
                        </div>

                        <div class="tab-pane" id="tab134">
                            <div><pre class="code-box">// Initialize library
String clientId = "www.mywebshop.com";
BringService bringService = new BringService(clientId);

// Prepare query
Package packet = new Package();
packet.withWeightInGrams("1500");
Shipment shipment = new Shipment();
shipment.withFromPostalCode("7600");
shipment.withToPostalCode("1407");
shipment.withPostingAtPostOffice(true);
shipment.addProduct(ProductType.SERVICEPAKKE);
shipment.addPackage(packet);

// Fetch price information from Bring
ShippingGuideResult shippingGuideResult = bringService.queryShippingGuide(shipment, QueryType.PRICE);
String price = shippingGuideResult.getProduct(ProductType.SERVICEPAKKE).getPrice().getPackagePriceWithoutAdditionalServices().getAmountWithoutVAT();

// Print out
System.out.println("Price: " + price + " NOK");</pre>
                            </div>

                            <div><p>Expected output:</p>
                                <pre class="code-box">Price: 92.00 NOK</pre>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </li>

    <li>
    <a href="#" class="menu-item"><h4>Adjust prices</h4></a>

    <div class="content-box" style="display: none;">
        <div class="row element-sample">

            <p>The Shipping Guide provides adjustment of prices shown. This service is available both in XML API and in
                the <a href="../widget/productselectionashtml.html">Product selection as HTML"-widget.</a></p>

            <p>To adjust the price, add <a
                    href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=m20p">&priceAdjustment=m20p</a>
                to the query.</p>

            <p>The parameter is built up in the form [produktkode_][o]10[p]. Parts of the parameter with square brackets
                ( [] ) is optional.</p>

            <p>Explanation of the parameters follows:</p>
            <ul>
                <li><p>produktkode_ used if price adjustments are only made for a single product. Example: <a
                        href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=SERVICEPAKKE_m20">&priceAdjustment=SERVICEPAKKE_m20</a>
                    lowers the price on product Servicepakke with NOK 20.</p></li>

                <li><p>o specifies the operation to be performed. Operations supported are 'p' for positive, 'm' for
                    negative or blank for a fixed price adjustment. Examples:</p>
                    <ul>
                        <li>
                            <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=m20">&priceAdjustment=m20</a>
                            deducts NOK 20 on all products.
                        </li>
                        <li>
                            <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=p20">&priceAdjustment=p20</a>
                            adds NOK 20 to all products.
                        </li>
                        <li>
                            <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=SERVICEPAKKE_79">&priceAdjustment=SERVICEPAKKE_79</a>
                            puts a fixed price on Servicepakke on NOK 79.
                        </li>

                    </ul>
                </li>

                <li>10 indicate the factor to be used in the price adjustment. This number can be a fixed amount or
                    percentage to be added/subtracted, or a fixed price to be added/subtracted depending on other
                    parameters.
                </li>
                <li>p indicate that the operation should be done as a percentage calculation. Note that this is only
                    valid for operations doing additions and subtractions (not fixed prices).
                </li>
            </ul>

            <p>Though <b>not recommended</b>, it is possible to make overlapping queries. If there is a need to do
                multiple simultaneous price adjustments, it should be done on a product-by-product basis using the
                product code prefix.</p>

            <br/>

            <p><b>Example:</b> <br/>set fixed price of NOK 79 for Servicepakke and deduct 20% on Bedriftspakke Ekspress
                Over natten 09.</p>

            <div class="box lightBorder">
                <div class="row element-sample">
                    <ul class="tab-group minimal" data-tabs="tabs">
                        <li class="active"><a href="#tab991">XML</a></li>
                        <li><a href="#tab992">JSON</a></li>
                    </ul>
                    <div class="tab-content tab-minimal">
                        <div class="tab-pane active" id="tab991">
                            <div data-tab="xml" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=EKSPRESS09&priceAdjustment=SERVICEPAKKE_79&priceAdjustment=EKSPRESS09_m20p"
                                   data-internal="/proxy/shipping-guide/products/price.xml?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=EKSPRESS09&priceAdjustment=SERVICEPAKKE_79&priceAdjustment=EKSPRESS09_m20p">
                                   <pre>
.../price.xml?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE
             &product=EKSPRESS09
             &priceAdjustment=SERVICEPAKKE_79
             &priceAdjustment=EKSPRESS09_m20p</pre>
                                </a>
                                <pre class="code-box xml response delay-snippet"></pre>
                            </div>

                        </div>

                        <div class="tab-pane" id="tab992">
                            <div data-tab="json" class="tab api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=EKSPRESS09&priceAdjustment=SERVICEPAKKE_79&priceAdjustment=EKSPRESS09_m20p"
                                   data-internal="/proxy/shipping-guide/products/price.json?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=EKSPRESS09&priceAdjustment=SERVICEPAKKE_79&priceAdjustment=EKSPRESS09_m20p">
                                   <pre>
.../price.json?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE
             &product=EKSPRESS09
             &priceAdjustment=SERVICEPAKKE_79
             &priceAdjustment=EKSPRESS09_m20p</pre>
                                </a>

                                <p class="right">JSONP Request: <a
                                        href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=EKSPRESS09&priceAdjustment=SERVICEPAKKE_79&priceAdjustment=EKSPRESS09_m20p&callbackUrl=functionName">
                                    ?callback=functionName </a></p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>

</li>

</ul>
</div>

</div>

</div>

<%--Additional resources--%>
<div class="span3 box">
    <div id="additional-resources">
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