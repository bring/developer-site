<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Developer"/>
    <misc:css_v2/>



</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">


            <div class="row-fluid">


                <div class="span7 box">
                    <h2>Welcome to Bring Developer!</h2>

                    <p class="front-page-welcome-text">Here you can find information and tutorials for developers of web shops dealing with shipment
                        in and from Scandinavian countries.
                        How can Bring APIs improve your webshop? <br><br>
                        Learn how to use the different APIs provided by Bring by exploring the different APIs from the
                        sidebar.
                        Improve the service provided to your customers by allowing customers to choose their preferred
                        shipping method with the <a href="#">Shipping Guide API</a>.
                        Show your customers the current status of their shipment with the <a href="/api/trackingapi.html">Tracking
                            API</a>.<br><br>
                        Find the price and availability for different products and book a request through the logged-in
                        service in the <a href="#">Booking API</a>.
                        Need help? Through the <a href="/support.html">Support</a> page you can get in touch with the
                        API team and the community of developers.
                    </p>
                </div>


                <div class="span5">
                    <ul class="menu-group ingress-list alternativ api-menu">
                        <li>
                            <a class="menu-item" href="#">Shipping Guide API</a>
                            <span>Get price and time estimate for shipments</span>
                        </li>
                        <li>
                            <a class="menu-item" href="/api/trackingapi.html">Tracking API</a>
                            <span>See the current status of shipments</span>
                        </li>
                        <li>
                            <a class="menu-item" href="#">Reports API (BETA)</a>
                            <span>Generate customer reports from shipment history</span>
                        </li>
                        <li>
                            <a class="menu-item" href="/api/pickuppointapi.html">Pickup Point API</a>
                            <span>Find pickup points near a location</span>
                        </li>
                        <li>
                            <a class="menu-item" href="#">Postal Code API</a>
                            <span>Lookup and validate postal codes</span>
                        </li>
                        <li>
                            <a class="menu-item" href="#">Booking API (BETA)</a>
                            <span>Book shipments and generate PDF labels</span>
                        </li>
                        <li>
                            <a class="menu-item" href="#">EDI</a>
                            <span>Communicate with brings services electronically</span>
                        </li>
                    </ul>
                </div>
            </div>

        </section>
    </div>

</div>


<misc:footer/>
<misc:jqueryblob_v2/>
                        1

</body>
</html>