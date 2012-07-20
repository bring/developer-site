<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <misc:contenttype/> <misc:title value="Choose Pickup Point With Map"/> <misc:css_v2/>
</head>
<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>Choose pickup point With Map</h1>

                        <p>This widget uses Bring's Pickup point API to allow the user to choose their preferred post
                           office. This is mainly intended for online shopping to allow the user to choose another
                           pickup point than the default to their shipping address. </p>
                    </div>

                    <div class="box"><h4>How to install</h4>
                        <ol>
                            <li>This widget depends on jQuery, so please add jQuery to your site first.</li>
                            <li>Add the Post Office widget:<br/> <code>&lt;script type="text/javascript"
                                                                       src="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js"&gt;&lt;/script&gt;</code>
                            </li>
                            <li>Initialize it<br/> <code>$("divid").utleveringsenhet();</code></li>
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
                                            <iframe style="height: 450px" class="widget-demo"
                                                    src="/widget/preview/choose-pickup-point-with-map-preview.html"></iframe>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab2-5">
                                  <pre class="prettyprint">&lt;script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript"&gt;
    $(document).ready(function() {
        $('#divid').utleveringsenhet({
             googleMaps: true,
             mapHeight: 400,
             mapWidth: 400
        });
    });
&lt;/script&gt;
&lt;form&gt;
	&lt;div id="divid"&gt;&lt;/div&gt;
&lt;/form&gt;</pre>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="box">



                            <a
                                href="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js"
                                class="btn enhanced">Download</a>
                    </div>
                </div>

                <div class="span3">
                    <div id="sidebar">

                        <div class="box">
                            <a class="black" href="/api/pickuppointapi.html">
                                <h4>Pickup Point API</h4>
                            </a>
                            <ol>
                                <li>
                                    <a href="/api/pickuppointapi.html#introduction"> Introduction </a>
                                </li>

                                <li>
                                    <a href="/api/pickuppointapi.html#reference"> Reference </a>
                                </li>

                                <li>
                                    <a href="/api/pickuppointapi.html#HTU"> How to Use </a>
                                </li>

                                <li>
                                    <a href="/api/pickuppointapi.html#additionalExamples"> Additional Examples </a>
                                </li>
                            </ol>

                        </div>

                        <div class="box">
                            <div id="additional-resources">
                                <h2>Additonal Resources</h2>

                                <h4>Widgets</h4>
                                <ul>
                                    <li><a href="../widget/choose-pickup-point.html">Choose Pickup Point</a></li>
                                    <li><a href="../widget/choose-pickup-point-with-map.html">Choose Pickup Point With
                                                                                              Map</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </section>
    </div>
</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>