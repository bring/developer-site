<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Link to Shipment Tracking"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Link to Shipment Tracking</h1>
                    </div>

                    <div class="box">
                        <p>
                            Use this URL to directly link to tracking information from Posten &amp; Bring. This is not a
                            real installable widget, but information on how to link to the tracking web page. </p>
                        <h4>How to install</h4>
                        <ol>
                            <li>Links to tracking can be the same as the URL of a normal tracking request.
                                E.g.: <br> <code>http://sporing.bring.no/sporing.html?q=...</code>

                                <p>The parameter "q" is the query string (reference, shipment or package number).</p></li>

                            <li>If the query string is a sender's reference, then it's recommended to filter on the sender's
                                id ("aktornummer"), <br> if available. Then the results will be unique for that sender.
                                This is done with the parameter aktornummer, e.g. <code>&amp;aktornummer=123.</code></li>

                            <li>For results without the top menu, add the following request parameter: &amp;layout=standalone<br>
                                E.g.: <code>http://sporing.bring.no/sporing.html?q=...&amp;layout=standalone</code></li>

                            <li>The latter is suited for e.g. popup windows. Please note that the width of the popup window
                                should be equal to or greater than 1024 pixels.</li>
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
                                                    src="/widget/preview/tracking-link-preview.html"></iframe>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab2-5">
                                  <pre class="prettyprint">&lt;script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript"&gt;
           $(document).ready(function() {
              $("#trackinginfo").live('click', function(event) {
                window.open('http://beta.posten.no/sporing/sporing.html?q=TESTPACKAGE-DELIVERED&amp;layout=standalone', '','width=1080,height=800');
              });
           });
        &lt;/script&gt;
        &lt;center&gt;&lt;button id="trackinginfo"&gt;Show me the tracking&lt;/button&gt;&lt;/center&gt;</pre>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="span3">
                    <div id="sidebar">
                        <sidebar:tracking-sidebar />
                    </div>
                </div>

            </div>

        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>