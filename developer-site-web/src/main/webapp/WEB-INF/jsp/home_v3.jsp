<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
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
                            <p class="front-page-welcome-text">Bring provides a collection of APIs to facilitate <span class="front-page-welcome-text-highlight">integration</span>
                                with your systems. If you're running a <span class="front-page-welcome-text-highlight">webshop</span>, or any software dealing with shipments
                                from Nordic countries, using Bring APIs can <span class="front-page-welcome-text-highlight">add value to your business and to your
                                customers:</span> </p>
                            <ul class="welcomelist">
                                <li>Let the customer choose between alternative shipping methods upon checkout with the <a
                                        href="/api/shippingguideapi.html?from=shipping">Shipping Guide API</a>.
                                </li>
                                <li>Show your customers the current status of their shipment with the <a
                                        href="/api/trackingapi.html?from=tracking">Tracking API</a>.
                                </li>
                                <li>Book a shipment through the <a href="/api/bookingapi.html?from=booking">Booking API</a>.
                                </li>
                                <li>Generate and download reports with the <a href="/api/reportsapi.html?from=reports">Reports API</a></li>
                            </ul>
                            <p class="front-page-welcome-text">Need help? Get in touch with the API team and other
                                developers through the <a href="/support">Support</a> page.</p>

                        </div>
                    </div>

                    <div class="span5">
                        <ul class="menu-group minimal ingress-list alternativ api-menu">
                            <li>
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons shippingicon"></div>

                                    <div class="api-menu-text">
                                        <a href="/api/shippingguideapi.html?from=shipping"> <span class="api-link black">Shipping Guide API</span>
                                            <span class="black">Get price and time estimate for shipments</span> </a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons trackingicon"></div>

                                    <div class="api-menu-text">
                                        <a href="/api/trackingapi.html?from=tracking"> <span
                                                class="api-link black">Tracking API </span> <span class="black">See the current status of shipments</span>
                                        </a>
                                    </div>

                                </div>
                            </li>
                            <li>
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons reportsicon"></div>

                                    <div class="api-menu-text">
                                        <a href="/api/reportsapi.html?from=reports"> <span
                                                class="api-link black">Reports API (BETA)</span> <span class="black">Generate customer reports from shipment history</span>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons pickuppointicon"></div>

                                    <div class="api-menu-text">
                                        <a href="/api/pickuppointapi.html?from=pickuppoint"> <span class="api-link black">Pickup Point API</span>
                                            <span class="black">Find pickup points near a location</span></a>
                                    </div>
                                </div>
                            </li>
                            <li>

                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons postalcodeicon"></div>

                                    <div class="api-menu-text">
                                        <a href="/api/postalcodeapi.html?from=postalcode"> <span
                                                class="api-link black">Postal Code API</span> <span class="black">Lookup and validate postal codes</span></a>
                                    </div>
                                </div>

                            </li>
                            <li>
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons bookingicon"></div>

                                    <div class="api-menu-text"></div>
                                    <a href="/api/bookingapi.html?from=booking"> <span
                                            class="api-link black">Booking API (BETA)</span> <span class="black">Book shipments and generate PDF labels</span></a>
                                </div>
                            </li>
                            <li>
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons"></div>
                                    <div class="api-menu-text"></div>
                                    <a href="http://www.bring.no/hele-bring/produkter-og-tjenester/artikler/edi-electronic-data-interchange">
                                        <span class="api-link black">EDI</span> <span class="black">Communicate with brings services electronically</span></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>