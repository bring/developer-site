<%@ taglib prefix="booking" tagdir="/WEB-INF/tags/contenttags/booking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html>

<html>
<head>
    <misc:contenttype/> <misc:title value="Booking API"/> <misc:css_v2/>
</head>
<body>
<div class="wrapper">
    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Booking API</h1>
                    </div>

                    <div class="box">
                        <h2><a name="introduction"></a>Introduction</h2>
                        <booking:introduction/>
                    </div>

                    <div class="multitabs">
                        <ul class="tab-group">
                            <li><a href="#xml" data-tab="xml">XML</a></li>
                            <li><a href="#json" data-tab="json">JSON</a></li>
                            <li><a href="#soap" data-tab="soap">SOAP</a></li>
                        </ul>

                        <div class="box">
                            <h2><a name="HTU"></a>How to Use</h2>

                            <booking:how_to_use_common_text/>

                            <booking:how_to_use_xml/>
                            <booking:how_to_use_json/>
                            <booking:how_to_use_soap/>

                            <booking:customer_endpoint_json/>
                            <booking:customer_endpoint_xml/>
                            <booking:cargo_groupage_defaults/>

                            <booking:performance/>

                            <h2><a name="Pickup_order"></a>Pickup order</h2>

                            <booking:pickup_order_common/>
                            <booking:pickup_order_xml/>
                            <booking:pickup_order_json/>
                            <booking:pickup_order_soap/>

                            <h2>Encoding</h2>

                            <p>
                              The booking API supports characters included in the ISO-8859-1 charset. If unsupported characters are being sent,
                              you will get a validation error as described above.
                            </p>

                        </div>
                    </div>
                </div>

                <div class="span3">
                    <div id="sidebar">
                        <sidebar:booking-sidebar/>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>