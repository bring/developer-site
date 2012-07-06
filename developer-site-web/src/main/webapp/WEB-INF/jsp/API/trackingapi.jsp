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
                        <h2>Introduction</h2>

                        <p>The tracking API provides the opportunity to track shipments by reference, package or shipment number. It is an
                            easy way to display details and the status of shipments. The information available in this API is the same information available from the <a href="http://tracking.bring.com" target="_blank">Tracking web site</a>.
                            Response is available as either XML or JSON.
                        </p>


                        <div style="border: 1px solid; padding: 2px">
                            <b>Note! </b> We are using our Sporing beta environment to provide testdata for the examples. In production you
                            should use http://sporing.bring.no/sporing.xml
                        </div>
                    </div>

                    <div class="box">
                        <h2>Reference</h2>

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
                                <td>Returns information about the shipment such as the weight, volume and status. <br>
                                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                                    <li><code>&lt;tracking number&gt;</code> = reference, shipment or package number</li>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                    <div class="box">
                        <h2>How to Use</h2>
                        For testing you can use "TESTPACKAGE-AT-PICKUPPOINT" as the tracking number to generate test results. For real
                        tracking this must be a valid number.

                        <p>
                            Example: TRACK A SHIPMENT<br/>
                            This example is showing a package waiting to be collected at the pickup point .
                        </p>



                        <div class="row-fluid">
                            <div class="box">
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
                                            <pre class="code-box json response delay-snippet"></pre>
                                        </div>
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>




                    </div>

                    <div class="box">
                        <h2>Additional examples</h2>
                        <p>The parcel numbers used in the examples are static identifiers, and will always return the same result. These examples are recommended to use for integration testing.</p>

                        <div class="row element-sample">
                            <ul class="menu-group collapsing no-shadow">

                                <li>
                                    <a href="#" class="menu-item"><h4>Package - notification received</h4></a>
                                    <div class="content-box" style="display: none;">


                                        <p>The example below is showing a package that have been EDI notified, but is not received by Bring</p>




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
                                                        <pre class="code-box json response delay-snippet"></pre>
                                                    </div>
                                                </div>



                                            </div>
                                        </div>



                                    </div>
                                </li>

                                <li>
                                    <a href="#" class="menu-item"><h4>Package - waiting at pickup point</h4></a>
                                    <div class="content-box">
                                        <p>The example below is showing a package waiting for the recipient to collect it at a pickup point</p><br>
                                        Request: /sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT
                                        Response: ...
                                    </div>
                                </li>

                                <li>
                                    <a href="#" class="menu-item"><h4>Package - loaded for delivery</h4></a>
                                    <div class="content-box">
                                        <p>The example below is showing a package that has been loaded on a distribution car for delivery to the reciepient</p><br>
                                        Request: /sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY
                                        Response: ...
                                    </div>
                                </li>

                                <li>
                                    <a href="#" class="menu-item"><h4>Package - delivered</h4></a>
                                    <div class="content-box">
                                        <p>The example below is showing a package that has been delivered to the reciepient</p><br>
                                        Request: /sporing.xml?q=TESTPACKAGE-DELIVERED
                                        Response: ...
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>

                <div class="span3" id="additional-resources">
                    <div class="box">
                        <h2>Additonal Resources</h2>
                        <ul>
                            <li><a href="../additionalresources/xmlSchemaDefinition.html">XML Schema Definition</a></li>
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
