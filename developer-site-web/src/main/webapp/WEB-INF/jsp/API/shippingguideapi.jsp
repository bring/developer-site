<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Shipping Guide API"/>
    <misc:css_v2/>
</head>

<body>

<div class="wrapper">

<misc:header_v2 selected_tab="developer"/>


<div id="page">

<section id="content">

<div class="row-fluid">

<div class="span9">

    <div class="box">
        <h1>Shipping Guide API</h1>


    </div>

    <div class="box">
        <h2>Introduction</h2>
        <p>Shippingguide (Fraktguiden) is a free service from Bring that allows you to calculate prices, time estimations,
            product information and environmental information (and more).</p>
        <p><a href="http://fraktguide.bring.no/fraktguide/demoVelgFraktalternativ.do?from=7600&to=1473&weightInGrams=1800&length=10&width=20&height=30&product=servicepakke&product=pa_doren&product=bpakke_dor-dor&product=a-post&callbackUrl=http://fraktguide.bring.no/fraktguide/popupCallback.jsp">Demo</a> Norwegian</p>
        <p>The data is available using different integration methods. Choose the option that fits your need best</p>
        <br>
        <h4>XML</h4>
        <hr>
        <p>XML API is the easiest way to integrate the Shipping Guide to an online store. The method provides access to data from Bring via a single interface.</p>
        <br>
        <h4>JSON/JSONP</h4>
        <hr>
        <p>Web browsers can retrieve information from external sites if the data are made available in JSONP format. The purpose is that you can paste HTML / Javascript on your web page and easily use data from the Shipping guide without server components on your web page.</p>
        <br>
        <h4>WEB SERVICES</h4>
        <hr>
        <p>With Online Web Services, you can look up price, transportation, area coverage and product information for each product as required. For advanced users we recommend the Web Services with several options in the query.</p>
        <br>
        <h4>OFFLINE DATA (MANUAL DOWNLOAD AND WEB SERVICE)</h4>
        <hr>
        <p>This is pre-prepared data for offline use. Enter the zip code you are sending from and which products you want data for. For each product you get:</p>
        <br><hr>
        <h5>NICE TO KNOW</h5>
        <ul><br>
            <li>All Shipping Guide services is basically the same service. Web Services is the core service with all functionality. There are some limitations in the XML API.</li>
            <li>Using XML API you can not mark a parcel as a specialized goods. If you need to do this you must use the Web Service.</li>
            <li>Shippingguide specifies VAT related to senders country. It's up to the client to decide if VAT is applicable to their situation of sale</li>
        </ul>
        <hr>
        <h5>RECOMMENDATION TO DEVELOPERS</h5>
        <p>Important! Remember to use timeout and error handling when making requests to the service. Handle errors in a way that is satisfactory for your online store.
            Add the name of the web-shop to the HTTP header "User-Agent", when you send a request to the service. If available, the name of the web-shop owner should also be added to the request.
            If you have a registered user at fraktguide.bring.no, please also include XML API's Public ID parameter <a href="#">HER SKAL DET VÆRE EN LINK!</a> in the query. This makes it possible for us to send any relevant messages via the registered e-mail address.</p>
        <br><br><div class="information-box">When using the Shipping Guide, it is important to handle errors gracefully. Your web shop's users should still be able to order, even if the Shipping Guide returns an error. Read more about error handling <a href="../additionalresources/errorhandling.html">here.</a></div>

    </div>

    <div class="box">

        <h2>Reference</h2>

        <p>Request prefix: <br/><code></code></p>
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

    <div class="box">
        <div class="row element-sample">

            <h2>How to Use</h2>
            <p>First you have to decide which integration method you want to use for the available data.</p><br>
            <ul class="tab-group minimal" data-tabs="tabs">
                <li class="active"><a href="#tab1">XML</a></li>
                <li><a href="#tab2">JSON</a></li>
                <li><a href="#tab3">WEB SERVICES</a></li>
                <li><a href="#tab4">OFFLINE DATA</a></li>
            </ul>

            <div class="tab-content tab-minimal">

                <div class="tab-pane active" id="tab1">
                    <h5>SELECT RESOURCE</h5>
                    <p>You may query the information most suited for your need.</p>
                    <ul>
                        <li><a href="#">Only price</a></li>
                        <li><a href="#">Only delivery time</a></li>
                        <li><a href="#">All available information</a></li>
                    </ul>
                    <p>Please refer to the <a href="#">XML SCHEMA</a> for information on elements in the response</p>
                    <hr>
                    <h5>SELECT PRODUCT</h5>
                    <p>You may query the information most suited for your need.</p>
                    <ul>
                        <li><a href="#">Only SERVICEPAKKE</a></li>
                        <li><a href="#">Both SERVICEPAKKE and PA_DOREN</a></li>
                        <li><a href="#">All available products (for combination of postal codes and country)</a></li>
                    </ul>
                </div>

                <div class="tab-pane" id="tab2">
                    test2
                </div>

                <div class="tab-pane" id="tab3">
                    <br><p>The webservices offers the most options when performing queries to the Shipping Guide.</p><br>
                    <p><b>To execute the web-service you will need a identification string. To get this - please <a href="http://fraktguide.bring.no/fraktguide/registrerBruker.do" target=_blank>register</a>.</b></p>
                    <p>Please refer to written documentation in <a href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">English</a> or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">Norwegian</a>.</p><br>
                    <p><a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-latest.wsdl">WSDL</a>(will always link to the latest version)</p><br>
                    <p>More information about <a href="../additionalresources/wsdl-xml-schema.html">WSDL/XML Schema</a>.</p><br>
                    <p>We recommend <a href="http://www.soapui.org/">soapUI</a> to test the Web Service</p><br>
                    <p>Please refer to common information regarding <a>product codes</a> and <a href="../additionalresources/errorhandling.html">error codes</a>.</p>
                </div>

                <div class="tab-pane" id="tab4">
                    <p>Offline data lets you download a failover version of the data from the Shipping Guide.</p><br>
                    <div>By using the <a href="http://fraktguide.bring.no/fraktguide/offlineData.do">Offline Data form</a> (Norwegian), you can download price lists, transport times and additional services designed for offline usage.
                        Offline data is suitable as a failover solution if the Shipping Guide does not respond or responds with an error message, or if there are extreme demands on performance.</div><br>
                    <div><b>Important!</b> With offline data, you have to deal with all the rules of special goods, shipping calculated weight (volume weight), and more. These rules are located on the respective product pages on bring.com.
                        Remember to update the database at price changes!</div><br>
                    <div>The service is available free of charge, provided acceptance of the terms of use. Note that only registered users will receive notifications of changes in service!</div><br>
                    <div>For those who use the offline data, we recommend to get the updates automatically via Shipping Guide Web Services. To execute the web-service you will need a identification string. To get this - please <a href="http://fraktguide.bring.no/fraktguide/registrerBruker.do">register</a>.
                        Please refer to written documentation in <a href="http://developer.bring.com/downloads/BringFraktguide_Developer_Notes.pdf">english</a> or <a href="http://developer.bring.com/downloads/BringFraktguide_Teknisk_beskrivelse.pdf">norwegian</a> for details.</div>
                    <br>
                    <div><h5>USEFUL XPATHS WHEN PROCESSING OFFLINE DATA</h5>
                        <div><pre class="code-box">Get Price Zone (returns an empty answer if toPostalCode is outside the coverage area for the chosen product):
//Product[@productId='SERVICEPAKKE']//PriceZone[@toPostalCode='2000']/text()

Get Price based on Price Zone "2":
//Product[@productId="SERVICEPAKKE"]//Price[@priceZone="2" and @weight="4000"]/text()

Get transport time:
//Product[@productId='SERVICEPAKKE']//WorkingDays[@toPostalCode="2000"]/text()</pre></div>
                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="box">
        <h2>Additional examples</h2>

    </div>


</div>

<div class="span3 box">
    <div id="additional-resources">
        <h2>Additonal Resources</h2>
        <ul>
            <li><a href="../additionalresources/errorhandling.html">Error handling</a></li>
            <li><a href="../additionalresources/wsdl-xml-schema.html">WSDL/XML SCHEMA</a></li>
        </ul>
        <h3>Widgets</h3>
        <ul>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
</div>


</section>

</div>

</div>


<misc:footer/>
<misc:jqueryblob_v2/>

</body>
</html>