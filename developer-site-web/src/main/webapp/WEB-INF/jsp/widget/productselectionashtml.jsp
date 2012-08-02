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

                        <p>"Delivered by Bring" is a solution where Bring deliveres finished HTML for the selection of freight products. You can use this HTML directly in your webshop.
                           By using CSS you can adapt the appearance to your layout.</p>

                        <p>The HTML is delivered as the content in a form, but without the &lt;form&gt; elements. This way you can adjust the functionality to your need.</p>

                        <p>The price is not a available parameter. We suggest that you fetch the price using XML API serverside to prevent that it's modified.</p>

                        <p>If the user select A-POST product from this form:<br/>
                            <a target="_blank" href="http://fraktguide.bring.no/fraktguide/products.html?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=2009-02-26">http://fraktguide.bring.no/fraktguide/products.html?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=2009-02-26</a>
                            <br/><br/>
                           Use the following XML API request to fetch the price:<br/>
                            <a target="_blank" href="http://fraktguide.bring.no/fraktguide/products/A-POST/price.xml?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=2009-02-26">http://fraktguide.bring.no/fraktguide/products/A-POST/price.xml?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=2009-02-26</a>
                            <br/><br/>XML API, JSON API and "Delivered by Bring" is all using the same parameters, please see documentation for the API to get information about available parameters and functionality</p>

                        <div><br/>
                            <h4>How to install</h4>
                            <ol>
                                <li>Take a peek on the <a target="_blank" href="http://fraktguide.bring.no/fraktguide/demoVelgFraktalternativ.do?from=7600&amp;to=1473&amp;weightInGrams=1800&amp;date=2011-08-09&amp;length=10&amp;width=20&amp;height=30&amp;product=servicepakke&amp;product=pa_doren&amp;product=bpakke_dor-dor&amp;product=a-post&amp;callbackUrl=http://fraktguide.bring.no/fraktguide/popupCallback.jsp">demonstration</a>, select the products you will provide and learn how the products are displayed. In the low left part of the demonstration page you can link directly to the HTML code you use in your netshop</li>
                                <li>On your website - add <form> tags to contain the selection of freight product</form></li>
                                <li>Fetch and display the HTML code from "Delivered by Bring". Please check that your frameworks does not modify the HTML code.</li>
                                <li>Write/modify a CSS to make the page look good. You can find an example here: <a target="_blank" href="http://fraktguide.bring.no/fraktguide/css/fraktalternativer.css">http://fraktguide.bring.no/fraktguide/css/fraktalternativer.css</a></li>
                                <li>Write the code to handle the form submittion. Use XML API to fetch the price.</li>
                                <li>Tip! The generated HTML code contains information about the products offered. You can use jQuery/JavaScript to display this information for instance as tooltip.</li>
                            </ol>
                        </div>


                        <div class="content-box">
                            <div class="row element-sample">
                                <h4><p>Widget Example</p></h4>
                                <ul class="tab-group minimal" data-tabs="tabs">
                                    <li class="active"><a href="#tab1-5">DEMO</a></li>
                                    <li><a href="#tab2-5">CODE</a></li>
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
              $("#onlyhtml").live('click', function(event) {
                window.open('http://fraktguide.bring.no/fraktguide/products.html?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=2009-02-26', '','width=1080,height=800');
              });
              $("#onlyxml").live('click', function(event) {
                window.open('http://fraktguide.bring.no/fraktguide/products/all.xml?from=7600&amp;to=1473&amp;weightInGrams=1000&amp;date=2009-02-26', '','width=1080,height=800');
              });
              $("#onlycss").live('click', function(event) {
                window.open('http://fraktguide.bring.no/fraktguide/css/fraktalternativer.css', '','width=1080,height=800');
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