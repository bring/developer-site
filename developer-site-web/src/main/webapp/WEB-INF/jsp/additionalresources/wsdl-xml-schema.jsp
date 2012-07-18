<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="WSDL/XML SCHEMA"/>
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
                        <h1>Wsdl/xml Schema</h1>
                    </div>
                    <div class="box">
                        <p>The Shipping Guide uses schemas for XML and WSDL to make it easier to integrate with the WebService</p><br/>
                        <p><a href="http://fraktguide.bring.no/fraktguide/schemaDoc.do">Fraktguide XML Schema documentation</a></p><br/>
                        <div>
                            <h4>VERSIONING</h4>
                            <hr>
                            <p>Fraktguiden makes an effort to always be backwards compatible regarding data format for requests and responses of the Web Service.
                               To achieve this, a <b>SchemaVersion</b> element is used in the request, indicating which version the client is on and what data-format the client expects in the result. We make an effort not to return new elements in the response when an old schema version is specified.
                               When changes in the schema are made, the SchemaVersion is incremented by one. The new schema is used at the <b>same endpoint URL</b> as before and uses the same namespace for its XML elements. A TraceMessage element (info message) in the response is added to inform the client that its schema should be updated. Old schema versions might in the future be unsupported.
                               Regarding the XML API (not Web Services), an XML Schema is not used at all. Therefore, clients of the XML API are expected to handle new elements that appear. Nevertheless, the response will be backwards compatible in that elements are not renamed or deleted.</p>
                        </div><br/>
                        <div>
                            <h4>WSDL</h4>
                            <hr>
                            <p><a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-latest.wsdl">WSDL</a> (latest schema version)</p><br/>
                            <p>It is possible to download specific WSDL / schema versions: <a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-v1.wsdl">1</a>,<a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-v2.wsdl">2</a>,<a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-v3.wsdl">3</a>,<a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-v4.wsdl">4</a>,<a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-v5.wsdl">5</a>,<a href="http://fraktguide.bring.no/fraktguide/ws/fraktguide-v6.wsdl">6</a> The current version is 6.</p>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div id="sidebar">
                        <sidebar:shipping-guide-sidebar />
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