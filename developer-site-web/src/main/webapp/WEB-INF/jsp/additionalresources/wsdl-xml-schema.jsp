<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>


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
                        <p><a href="https://api.bring.com/shippingguide/api/ws/fraktguide-latest.wsdl" target="_blank">WSDL with latest schema version</a></p>
                        <p>It is possible to download specific WSDL / schema versions: <a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v1.wsdl">1</a>,<a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v2.wsdl">2</a>,<a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v3.wsdl">3</a>,<a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v4.wsdl">4</a>,<a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v5.wsdl">5</a>,<a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v6.wsdl">6</a>,<a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v7.wsdl">7</a>,<a href="https://api.bring.com/shippingguide/api/ws/fraktguide-v8.wsdl">8</a>. The current version is 8.</p>
                        <p><a href="http://fraktguide.bring.no/fraktguide/schemaDoc.do">Fraktguide XML Schema documentation</a></p>
                      </div>
                        <div>

                            <%
                                //NOTE TO BRING DEVELOPERS:
                                //CLIENTS DO NOT ADHERE TO THE WARNINGS AND POLICY BELOW,
                                //SO WE SHOULD IDEALLY NOT PRESENT NEW XML ELEMENTS WITHOUT A NEW SCHEMA VERSION.
                            %>

                            <h2>VERSIONING</h2>
                            <p>The Shipping Guide makes an effort to always be backwards compatible regarding data format for requests and responses of the Web Service.
                               To achieve this, a <b>SchemaVersion</b> element is used in the request, indicating which version the client is on and what data-format the client expects in the result.
                            </p>

                            <div class="information-box">
                                Important: All clients must accept new (unknown) elements in the response.
                                E.g. unknown elements should be ignored. The client framework used by client must not crash when unknown
                                elements are encountered.
                            </div>

                            <p>
                               When incompatible changes in the schema are made (other than addition of new elements), the SchemaVersion is incremented by one. The new schema is used at the <b>same endpoint URL</b> as before and uses the same namespace for its XML elements. A TraceMessage element (info message) in the response is added to inform the client that its schema should be updated. Old schema versions might in the future be unsupported.
                            <p>
                            </p>
                              Regarding the XML/JSON API (not Web Services), an XML Schema is not used at all. Clients of the XML/JSON API are expected to handle new elements that appear.
                              Nevertheless, the response will be backwards compatible in the sense that elements are not renamed.
                            </p>
                        </div>
                        <hr>
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

<misc:footer_v2 />
<misc:jqueryblob_v2 />

</body>



</html>