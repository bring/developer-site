<%@ page import="org.joda.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/>
    <misc:title value="Product selection as html"/>
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
                        <h1>Product selection as html</h1>
                    </div>

                    <div class="box">

                        <p>
                          "Delivered by Bring" is a widget you can request (server-side) from the Shipping Guide. You get a pre-generated shipping alternatives form as HTML. You can use this HTML directly in your webshop.
                          By using CSS you can adapt the appearance of the form.
                        </p>
                        <p>
                          Advantages of using this widget:
                          <ul>
                            <li>You get the recommended way to present the Bring products (focus on product categories and attributes instead of product names).</li>
                            <li>You let the end-user select product in a standardized way based on their delivery preference.</li>
                            <li>You get help texts and tooltips for e.g. fastest product, cheapest and most environmental friendly.</li>
                          </ul>
                        </p>

                        <p>
                          The HTML is delivered as the content in a form, but without the &lt;form&gt; tag. This way you can adjust the functionality to your needs.
                        </p>

                        <p>
                          The price is not set as an input parameter in the HTML of the returned form for security reasons (to prevent end user tampering of the price in the browser).
                          We suggest that you re-fetch the price on the server side after you know which product the end-user has selected.</p>

                        <p>
                          <b>Example:</b> If the user select A-POST product from this shipping alternatives form:<br/>
                            <a target="_blank" href="https://api.bring.com/shippingguide/products.html?clientUrl=insertYourClientUrlHere&from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=<%=new LocalDate()%>">https://api.bring.com/shippingguide/products.html?clientUrl=insertYourClientUrlHere&from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=<%=new LocalDate()%></a>
                            <br/><br/>
                           Use the following XML API request to fetch the price:<br/>
                            <a target="_blank" href="https://api.bring.com/shippingguide/products/A-POST/price.xml?clientUrl=insertYourClientUrlHere&from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=<%=new LocalDate()%>">https://api.bring.com/shippingguide/products/A-POST/price.xml?clientUrl=insertYourClientUrlHere&from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=<%=new LocalDate()%></a>
                            <br/><br/>XML API, JSON API and "Delivered by Bring" is all using the same parameters, please see documentation for the API to get information about available parameters and functionality</p>

                        <div>
                          <h4>How to install</h4>
                          <ol>
                              <li>
                                Take a peek on the
                                <a target="_blank" href="http://fraktguide.bring.no/fraktguide/demoVelgFraktalternativ.do?from=7600&amp;to=1473&amp;weightInGrams=1800&amp;date=<%=new LocalDate()%>&amp;length=10&amp;width=20&amp;height=30&amp;product=servicepakke&amp;product=pa_doren&amp;product=bpakke_dor-dor&amp;product=a-post&amp;callbackUrl=http://fraktguide.bring.no/fraktguide/popupCallback.jsp">demo</a>,
                                select the products you will offer to your customers and learn how the products are displayed. In the low left part of the demonstration page you can link directly to the HTML code you use in your netshop</li>
                              <li>On your website - add &lt;form&gt; tags to contain the selection of shipping alternatives</li>
                              <li>Fetch and display the HTML code from "Delivered by Bring".</li>
                              <li>Write/modify a CSS to make the page look good. You can find an example here: <a target="_blank" href="http://fraktguide.bring.no/fraktguide/css/fraktalternativer.css">http://fraktguide.bring.no/fraktguide/css/fraktalternativer.css</a></li>
                              <li>Write the code to handle the form submittion. Use XML API or SOAP to re-fetch the price.</li>
                              <li>Tip! The generated HTML code contains information about the products offered. You can use jQuery/JavaScript to display this information for instance as tooltip.</li>
                          </ol>
                        </div>


                        <div class="content-box">
                            <div class="row element-sample">
                                <h4><p>Widget Example</p></h4>
                                <ul class="tab-group minimal" data-tabs="tabs">
                                    <li class="active"><a href="#tab1-5">DEMO</a></li>
                                </ul>

                                <div class="tab-content tab-minimal">

                                    <div class="tab-pane active lightBorder" id="tab1-5">
                                        <div class="box lightBorder">
                                            <iframe class="widget-demo preview-frame" src="/widget/preview/product-selection-as-html-preview.html" height="150"></iframe></div>
                                    </div>

                                    <div class="tab-pane" id="tab2-5">
                                  <pre class="prettyprint" data-highlightlines="5">&lt;script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript"&gt;
           $(document).ready(function() {
              $("#onlyhtml").on('click', function(event) {
                window.open('http://api.bring.com/shippingguide/products.html?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=<%=new LocalDate()%>', '','width=1080,height=800');
              });
              $("#onlyxml").on('click', function(event) {
                window.open('http://api.bring.com/shippingguide/products/all.xml?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=<%=new LocalDate()%>', '','width=1080,height=800');
              });
              $("#onlycss").on('click', function(event) {
                window.open('http://api.bring.com/shippingguide/css/fraktalternativer.css', '','width=1080,height=800');
              });
           });
        &lt;/script&gt;
        &lt;center&gt;&lt;button id="onlyhtml"&gt;Show me HTML without CSS&lt;/button&gt;&lt;/center&gt;
        &lt;br/&gt;
        &lt;center&gt;&lt;button id="onlyxml"&gt;Show me the same products with XML&lt;/button&gt;&lt;/center&gt;
        &lt;br/&gt;
        &lt;center&gt;&lt;button id="onlycss"&gt;Show me example CSS&lt;/button&gt;&lt;/center&gt;</pre>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="span3">
                    <div id="sidebar">
                        <misc:sidebar />
                    </div>
                </div>
            </div>
        </section>
    </div>


</div>

<misc:footer_v2/>
<misc:jqueryblob_v2/>

</body>
</html>