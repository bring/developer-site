<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Display shipping guide information with JSONP"/>
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
                    <h1>Display shipping guide information using JSONP</h1>
                    </div>

                    <div class="box">
                        <p>This demonstration illustrates how you can use JSONP to include information from Shipping Guide inline in your website.<br><br>
                        Please use the code provided as a template that you can adjust to your requirements</p>


                        <div class="content-box">
                            <div class="row element-sample">

                                <ul class="tab-group minimal" data-tabs="tabs">
                                    <li class="active"><a href="#tab1-5">DEMO</a></li>
                                    <li><a href="#tab2-5">CODE</a></li>
                                </ul>
                                <div class="tab-content tab-minimal">

                                    <div class="tab-pane active" id="tab1-5">
                                        <div class="box lightBorder"><iframe class="preview-frame widget-demo" src="/use/widget/shippingguidedemo/preview.html" height="150"></iframe></div>
                                    </div>

                                    <div class="tab-pane" id="tab2-5">
                                  <pre class="prettyprint">&lt;script src="http://code.jquery.com/jquery-latest.js"&gt; &lt;/script&gt;

        &lt;script type="text/javascript"&gt;
         $(document).ready(function() {
          var inputField = $('#postnummer');
          var outputElement = $('#textResult');
          inputField.keyup(function() {
           if (inputField.val().length &gt; 3) {
            $.getJSON('http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/all.json?from=1473&amp;to='+ inputField.val() +'&amp;weightInGrams=3&amp;date=2011-08-17&amp;callback=?',
                 function(data){
                  outputElement.html('&lt;ul&gt;&lt;li&gt;...det koste ' + data.Product.Price.PackagePriceWithoutAdditionalServices.AmountWithVAT + ' + mva.&lt;/li&gt;' +
                   ' &lt;li&gt;...transporttid være ' + data.Product.ExpectedDelivery.WorkingDays + ' virkedag(er). &lt;/li&gt;' +
                   ' &lt;li&gt;...pakken være hos mottaker den ' + data.Product.ExpectedDelivery.FormattedExpectedDeliveryDate + ' dersom pakken er levert på terminal innenfor fristen i dag.&lt;/li&gt;' +
                   ' &lt;li&gt;...informasjon om utlevering: ' + data.Product.GuiInformation.DescriptionText + '&lt;/li&gt;&lt;/ul&gt;');
                 });
           } else {
            outputElement.html('');
           }
          });
         });
        &lt;/script&gt;

        &lt;p&gt;
          Dersom du sender en Klimanøytral Servicepakke på 3 kilo &lt;br/&gt;fra Oslo til postnummer &lt;input type="text" id="postnummer" style="width: 3em;" maxlength="4"/&gt; vil... &lt;br/&gt;&lt;span id="textResult"&gt;&lt;/span&gt;
        &lt;/p&gt;</pre>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="span3 box">
                    <h4>Made by</h4>
                    <ul>
                        <li><a href="http://developer.bring.com/index.html" target="_blank"></a>Bring Developer</li>
                    </ul>
                </div>

            </div>

        </section>
    </div>


</div>

<misc:footer_v2/>
<misc:jqueryblob_v2/>

</body>
</html>