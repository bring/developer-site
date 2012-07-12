<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Developer"/> <misc:css_v2/>

</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">

        <section id="content">
            <div class="forside-banner header-box ">
                <div class="row-fluid">
                    <div class="span7">
                        <div class="welcometext">
                            <h2>Welcome to Bring Developer!</h2><br>

                            <p class="front-page-welcome-text">On this page you find information and tutorials for
                                developers of web shops dealing with shipment in and from Scandinavian countries.With
                                Bring APIs you can improve the service provided to your customers! </p><br>

                            <p class="front-page-welcome-text">
                            <ul class="welcomelist">
                                <li>Allow alternative shipping methods with the <a href="/api/shippingguideapi.html">Shipping
                                    Guide API</a>.
                                </li>
                                <li>Show your customers the current status of their shipment with the <a
                                        href="/api/trackingapi.html">Tracking API</a>.
                                </li>
                                <li>Find the price and availability for different products and book a request through
                                    the logged-in service in the <a href="#">Booking API</a>.
                                </li>
                            </ul>
                            </p><br>

                            <p class="front-page-welcome-text">Need help? Through the <a
                                    href="/support.html">Support</a> page you can get in touch with the API team and
                                other developers.</p>

                        </div>
                    </div>

                    <div class="span5">
                        <ul class="menu-group minimal ingress-list alternativ api-menu">
                            <li>
                                <div class="shippingikon"></div>
                                <a class="leftmargin" href="/api/shippingguideapi.html"> <span class="api-link">Shipping Guide API</span>
                                    <span class="black">Get price and time estimate for shipments</span>

                                </a>
                            </li>
                            <li>
                                <div class="trackingikon"></div>
                                <a class="leftmargin" href="/api/trackingapi.html"> <span
                                        class="api-link">Tracking API </span> <span class="black">See the current status of shipments</span></a>
                            </li>
                            <li>
                                <div class="reportsikon"></div>
                                <a class="leftmargin" href="/api/reportsapi.html"> <span class="api-link">Reports API (BETA)</span>
                                    <span class="black">Generate customer reports from shipment history</span></a>
                            </li>
                            <li>
                                <div class="pickuppointikon"></div>
                                <a class="leftmargin" href="/api/pickuppointapi.html"> <span class="api-link">Pickup Point API</span>
                                    <span class="black">Find pickup points near a location</span></a>

                            </li>
                            <li>
                                <div class="postalcodeikon"></div>
                                <a class="leftmargin" href="#"> <span class="api-link">Postal Code API</span> <span
                                        class="black">Lookup and validate postal codes</span></a>
                            </li>
                            <li>
                                <div class="bookingikon"></div>
                                <a class="leftmargin" href="#"> <span class="api-link">Booking API (BETA)</span> <span
                                        class="black">Book shipments and generate PDF labels</span></a>
                            </li>
                            <li>
                                <a class="leftmargin" href="#"> <span class="api-link">EDI</span> <span class="black">Communicate with brings services electronically</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/> 1

</body>
</html>