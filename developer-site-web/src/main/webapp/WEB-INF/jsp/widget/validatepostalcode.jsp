<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Validate Postal Code"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Validate Postal Code</h1>
                    </div>

                    <div class="box">
                        <p>This widget validates a postal code while the user types. Please see the postal code API for
                            more info.</p>
                        <h4>How to install</h4>

                        <ol>
                            <li><p>This widget depends on jQuery, so please include jQuery first.</p></li>
                            <li><p>Download the code, or copy it from the "Code" tab in the preview area above.</p></li>
                        </ol>

                        <div class="content-box">
                            <div class="row element-sample">

                                <h4><p>Widget Example</p></h4>
                                <ul class="tab-group minimal" data-tabs="tabs">
                                    <li class="active"><a href="#tab1-5">DEMO</a></li>
                                    <li><a href="#tab2-5">CODE</a></li>
                                </ul>
                                <div class="tab-content tab-minimal">

                                    <div class="tab-pane active" id="tab1-5">
                                        <div class="box lightBorder">
                                            <iframe class="widget-demo"
                                                    src="/widget/preview/validate-postal-code-preview.html"></iframe>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab2-5">
                                  <pre class="prettyprint">&lt;link rel="stylesheet" type="text/css" href="/media/widget/validatepostalcode/style.css" /&gt; &lt;!-- Put it in your head --&gt;
&lt;script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript"&gt;
   $(document).ready(function() {
      var inputField = $('#postnummerInput');
      var outputElement = $('#postnummerResult');

      inputField.keyup(function() {
         if (inputField.val().length == 4) {
            $.getJSON('http://fraktguide.bring.no/fraktguide/api/postalCode.json?pnr='+ inputField.val() +'&amp;callback=?',
            function(data){
               if (data.valid) {
                  outputElement.text(data.result);
               }
               else {
                  outputElement.text('Invalid postal code');
               }
            });
         }
         else {
            outputElement.text('Norwegian postal code');
         }
      });

      inputField.focus();
   });
&lt;/script&gt;
&lt;form&gt;
   &lt;input type="text" id="postnummerInput" maxlength="4" /&gt;  &lt;span id="postnummerResult"&gt;Norwegian postalcode&lt;/span&gt;
&lt;/form&gt;</pre>
                                    </div>
                                </div>
                            </div>
                        </div>
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