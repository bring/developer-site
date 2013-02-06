<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>


<!DOCTYPE html>

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
                        <h1>WSDL/XML Schema</h1>
                    </div>
                    <div class="box">
                      <div>
                        <h2>WSDL</h2>
                        <div class="information-box">ALPHA! This API is currently in ALPHA, changes will be made in the future that can break code relying on this specific version.</div>
                        <p><a href="https://api.qa.bring.com/po/api/ws/purchaseorder-v1.wsdl" target="_blank">WSDL with latest schema version</a></p>
                      </div>
                        <div>
                            <h2>VERSIONING</h2>
                            <p>Purchase Order makes an effort to always be backwards compatible regarding data format for requests and responses of the Web Service.
                               To achieve this, a <b>SchemaVersion</b> element is used in the request, indicating which version the client is on and what data-format the client expects in the result.
                            </p>
                            <p>
                              We make an effort not to return new elements in the response when an old schema version is specified.
                               When changes in the schema are made, the SchemaVersion is incremented by one. The new schema is used at the <b>same endpoint URL</b> as before and uses the same namespace for its XML elements. A TraceMessage element (info message) in the response is added to inform the client that its schema should be updated. Old schema versions might in the future be unsupported.
                            <p>
                            </p>
                              Regarding the XML API (not Web Services), an XML Schema is not used at all. Therefore, clients of the XML API are expected to handle new elements that appear.
                              Nevertheless, the response will be backwards compatible in the sense that elements are not renamed or deleted.
                            </p>
                        </div>
                        <hr>
                    </div>
                </div>
                <div class="span3">
                    <div id="sidebar">
                        <sidebar:purchaseorder-sidebar />
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