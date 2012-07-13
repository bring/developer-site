<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Choose Pickup Point"/>
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
                        <h1>XML Schema Definition for Tracking API</h1>
                    </div>
                    <div class="box">
                        <p>
                            XML Schema definition for the elements available in the response from the Tracking API.
                        </p>
                        <h4>XSD</h4>

                        <div class="box lightBorder">


                                    <div data-tab="xml" class="tab api-call">
                                        <p>Request:</p>


                                        <a target="_blank" class="request" href="http://beta.bring.no/sporing/sporing.xsd" data-internal="/proxy/tracking/sporing.xsd">…/sporing.xsd</a>

                                        <pre class="code-box xml response delay-snippet"></pre>
                                    </div>



                        </div>



                    </div>
                </div>
                <div class="span3">
                    <div class="box">
                        <a class="black" href="/api/trackingapi.html">
                            <h4>Tracking API</h4>
                        </a>
                        <ol>
                            <li><a href="/api/trackingapi.html#introduction">Introduction</a></li>
                            <li><a href="/api/trackingapi.html#reference">Reference</a></li>
                            <li><a href="/api/trackingapi.html#HTU">How to Use</a></li>
                            <li><a href="/api/trackingapi.html#additionalExamples">Additional Examples</a></li>
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
        </section>
    </div>

</div>

<misc:footer_v2 />
<misc:jqueryblob_v2 />

</body>



</html>