<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Tracking API"/>
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
    <h1>Tracking API</h1>
</div>

<div class="box">
    <h2><a name="introduction"></a>Introduction</h2>

    <p>The tracking API provides the opportunity to track shipments by reference, package or shipment number. It is an
       easy way to display details and the status of shipments. The information available in this API is the same information available from the <a href="http://tracking.bring.com" target="_blank">Tracking web site</a>.
       Response is available as either XML or JSON.
    </p>


    <div class="information-box" >
        <b>Note! </b> We are using our Sporing beta environment to provide testdata for the examples. In production you
                      should use http://sporing.bring.no/sporing.xml
    </div>
</div>

<div class="box">
    <h2><a name="reference"></a>Reference</h2>

    <p>Request prefix: <br/><code>http://beta.bring.no/sporing</code></p>

    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>.&lt;extension&gt;?q=&lt;tracking number&gt;</code></td>
            <td>Returns information about the shipment such as the weight, volume and status. <br/>
                <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                <li><code>&lt;tracking number&gt;</code> = reference, shipment or package number</li>
            </td>
        </tr>

        </tbody>
    </table>
</div>

<div class="box">
    <h2><a name="HTU"></a>How to Use</h2>
    For testing you can use "TESTPACKAGE-AT-PICKUPPOINT" as the tracking number to generate test results. For real
    tracking this must be a valid number.


    <h4>Example: TRACK A SHIPMENT</h4>
    <p>
        This example is showing a package waiting to be collected at the pickup point .
    </p>



    <div class="row-fluid">
        <div class="box lightBorder">


            <div class="row element-sample">
                <ul class="tab-group minimal" data-tabs="tabs">
                    <li class="active"><a href="#tab1">XML</a></li>
                    <li><a href="#tab2">JSON</a></li>
                </ul>
                <div class="tab-content tab-minimal">
                    <div class="tab-pane active" id="tab1">
                        <div data-tab="xml" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://beta.bring.no/sporing/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT"
                               data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT">
                                .../sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT
                            </a>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>

                    </div>

                    <div class="tab-pane" id="tab2">
                        <div data-tab="json" class="tab api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT"
                               data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT">
                                .../sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT
                            </a>
                            <p class="right">JSONP Request: <a href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT&amp;callbackUrl=functionName">?callback=functionName</a></p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>



                </div>
            </div>


        </div>
        <div>You can read more about the XML Schema definition for the elements available in the response <a href="../additionalresources/xmlSchemaDefinition.html">here.</a></div>
    </div>




</div>

<div class="box">
    <h2><a name="additionalExamples"></a>Additional examples</h2>
    <p>The parcel numbers used in the examples are static identifiers, and will always return the same result. These examples are recommended to use for integration testing.</p>

    <div class="row element-sample">
        <ul class="menu-group collapsing no-shadow">

            <li>
                <a href="#" class="menu-item"><h4>Status - notification received</h4></a>
                <div class="content-box" style="display: none;">


                    <p>The example below is showing a package that have been EDI notified, but is not received by Bring</p>


                    <div class="box lightBorder">

                        <div class="row element-sample">
                            <ul class="tab-group minimal" data-tabs="tabs">
                                <li class="active"><a href="#tab11">XML</a></li>
                                <li><a href="#tab12">JSON</a></li>
                            </ul>
                            <div class="tab-content tab-minimal">
                                <div class="tab-pane active" id="tab11">
                                    <div data-tab="xml" class="tab api-call">
                                        <p>Request:</p>
                                        <a target="_blank" class="request"
                                           href="http://beta.bring.no/sporing/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT"
                                           data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT">
                                            .../sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT
                                        </a>
                                        <pre class="code-box xml response delay-snippet"></pre>
                                    </div>

                                </div>

                                <div class="tab-pane" id="tab12">
                                    <div data-tab="json" class="tab api-call">
                                        <p>Request:</p>
                                        <a target="_blank" class="request"
                                           href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT"
                                           data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT">
                                            .../sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT
                                        </a>
                                        <p class="right">JSONP Request: <a href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-EDI&amp;callbackUrl=functionName">?callback=functionName</a></p>
                                        <pre class="code-box json response delay-snippet"></pre>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>




                </div>
            </li>

            <li>
                <a href="#" class="menu-item"><h4>Status - waiting at pickup point</h4></a>
                <div class="content-box">
                    <p>The example below is showing a package waiting for the recipient to collect it at a pickup point</p>
                    <div class="box lightBorder">  <div class="row element-sample">
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li class="active"><a href="#tab21">XML</a></li>
                            <li><a href="#tab22">JSON</a></li>
                        </ul>
                        <div class="tab-content tab-minimal">
                            <div class="tab-pane active" id="tab21">
                                <div data-tab="xml" class="tab api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request" href="http://beta.bring.no/sporing/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT" data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT">…/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT</a>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>

                            <div class="tab-pane" id="tab22">
                                <div data-tab="json" class="tab api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request" href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT" data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT">…/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT</a>
                                    <p class="right">JSONP Request: <a href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT&amp;callbackUrl=functionName">?callback=functionName</a></p>
                                    <pre class="code-box json response delay-snippet"></pre>
                                </div>
                            </div>
                        </div>
                    </div></div>

                </div>
            </li>

            <li>
                <a href="#" class="menu-item"><h4>Status - loaded for delivery</h4></a>
                <div class="content-box">
                    <p>The example below is showing a package that has been loaded on a distribution car for delivery to the reciepient</p>
                    <div class="box lightBorder">  <div class="row element-sample">
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li class="active"><a href="#tab31">XML</a></li>
                            <li><a href="#tab32">JSON</a></li>
                        </ul>
                        <div class="tab-content tab-minimal">
                            <div class="tab-pane active" id="tab31">
                                <div data-tab="xml" class="tab api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request" href="http://beta.bring.no/sporing/sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY" data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY">…/sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY</a>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>

                            <div class="tab-pane" id="tab32">
                                <div data-tab="json" class="tab api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request" href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY" data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY">…/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY</a>
                                    <p class="right">JSONP Request: <a href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY&amp;callbackUrl=functionName">?callback=functionName</a></p>
                                    <pre class="code-box json response delay-snippet"></pre>
                                </div>
                            </div>
                        </div>
                    </div></div>
                </div>
            </li>

            <li>
                <a href="#" class="menu-item"><h4>Status - delivered</h4></a>
                <div class="content-box">
                    <p>The example below is showing a package that has been delivered to the reciepient</p>

                    <div class="box lightBorder">  <div class="row element-sample">
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li class="active"><a href="#tab41">XML</a></li>
                            <li><a href="#tab42">JSON</a></li>
                        </ul>
                        <div class="tab-content tab-minimal">
                            <div class="tab-pane active" id="tab41">
                                <div data-tab="xml" class="tab api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request" href="http://beta.bring.no/sporing/sporing.xml?q=TESTPACKAGE-DELIVERED" data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-DELIVERED">…/sporing.xml?q=TESTPACKAGE-DELIVERED</a>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>

                            <div class="tab-pane" id="tab42">
                                <div data-tab="json" class="tab api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request" href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-DELIVERED" data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-DELIVERED">…/sporing.json?q=TESTPACKAGE-DELIVERED</a>
                                    <p class="right">JSONP Request: <a href="http://beta.bring.no/sporing/sporing.json?q=TESTPACKAGE-DELIVERED&amp;callbackUrl=functionName">?callback=functionName</a></p>
                                    <pre class="code-box json response delay-snippet"></pre>
                                </div>
                            </div>
                        </div>
                    </div></div>


                </div>
            </li>

        </ul>
    </div>
</div>

</div>

<div class="span3" id="additional-resources">
    <div id="sidebar">
        <div class="box">
            <a class="black" href="/api/trackingapi.html">
                <h4>Tracking API</h4>
            </a>
            <ol>
                <li><a href="#introduction">Introduction</a></li>
                <li><a href="#reference">Reference</a></li>
                <li><a href="#HTU">How to Use</a></li>
                <li><a href="#additionalExamples">Additional Examples</a></li>
            </ol>

        </div>


        <div class="box">
            <h2>Additonal Resources</h2>
            <ul>
                <li><a href="../additionalresources/xmlSchemaDefinition.html">XML Schema Definition</a></li>
            </ul>
        </div>
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
