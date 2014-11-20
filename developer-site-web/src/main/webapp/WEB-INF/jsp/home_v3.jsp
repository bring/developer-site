<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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
                            <h1 class="front-page-welcome-text">Bring Developer</h1>

                            <p class="front-page-welcome-text">Bring provides a collection of APIs to facilitate <span
                                    class="front-page-welcome-text-highlight">integration</span>
                                with your systems. If you're running a <span class="front-page-welcome-text-highlight">webshop</span>,
                                or any software dealing with shipments
                                from Nordic countries, using Bring APIs can <span
                                        class="front-page-welcome-text-highlight">add value to your business and to your
                                customers:</span></p>
                            <ul class="welcomelist">
                                <li>Let the customer choose between alternative shipping methods upon checkout with the
                                    <a
                                            href="/api/shippingguideapi.html">Shipping Guide API</a>
                                </li>
                                <li>Show your customers the current status of their shipment with the <a
                                        href="/api/trackingapi.html">Tracking API</a>
                                </li>
                                <li>Book a shipment through the <a href="/api/bookingapi.html">Booking API</a>
                                </li>
                                <li>Generate and download reports with the <a href="/api/reportsapi.html">Reports
                                    API</a></li>
                            </ul>
                            <p class="front-page-welcome-text">Need help? Get in touch with the API team and other
                                developers through the <a href="/support">Support</a> page.</p>

                            <div id="news">
                              <h2>News</h2>

                              <h3>Tracking widget</h3>
                              <p>A <a href="/widget/trackingcomponent.html">tracking widget</a> is now available for displaying shipment tracking information directly in your webshop</p>
                            </div>

                        </div>
                    </div>

                    <div class="span5">
                        <ul class="menu-group minimal ingress-list alternativ api-menu">
                            <li><a href="/api/shippingguideapi.html">
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons shippingicon"></div>
                                    <div class="api-menu-text">
                                        <span class="api-link black">Shipping Guide API</span>
                                        <span class="black">Get price and time estimate for shipments</span>
                                    </div>
                                </div>
                            </a>
                            </li>
                            <li><a href="/api/trackingapi.html">
                                <div class="api-menu-item-container">
                                    <div class="api-menu-icons trackingicon"></div>
                                    <div class="api-menu-text">
                                         <span class="api-link black">Tracking API </span>
                                         <span class="black">See the current status of shipments</span>
                                    </div>
                                </div>
                            </a>
                            </li>
                            <li><a href="/api/reportsapi.html">
                                 <div class="api-menu-item-container">
                                     <div class="api-menu-icons reportsicon"></div>
                                     <div class="api-menu-text">
                                         <span class="api-link black">Reports API</span>
                                         <span class="black">Generate customer reports from shipment history</span>
                                      </div>
                                  </div>
                                </a>
                            </li>
                            <li>
                                <a href="/api/pickuppointapi.html">
                                    <div class="api-menu-item-container">
                                        <div class="api-menu-icons pickuppointicon"></div>
                                        <div class="api-menu-text">
                                            <span class="api-link black">Pickup Point API</span>
                                            <span class="black">Find pickup points near a location</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>

                                <a href="/api/postalcodeapi.html">
                                    <div class="api-menu-item-container">
                                        <div class="api-menu-icons postalcodeicon"></div>
                                        <div class="api-menu-text">
                                            <span class="api-link black">Postal Code API</span>
                                            <span class="black">Lookup and validate postal codes</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/api/bookingapi.html">
                                    <div class="api-menu-item-container">
                                        <div class="api-menu-icons bookingicon"></div>
                                        <div class="api-menu-text"></div>
                                          <span class="api-link black">Booking API</span>
                                          <span class="black">Book shipments and generate PDF labels</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/api/purchaseorderapi.html">
                                    <div class="api-menu-item-container">
                                        <div class="api-menu-icons purchaseicon"></div>
                                        <div class="api-menu-text"></div>
                                        <span class="api-link black">PurchaseOrder API</span> <span
                                            class="black">Create, update and query Purchase Orders</span>
                                    </div>
                                </a>
                            </li>
                            <c:if test="${featureToggle.easyReturnService}">
                            <li>
                                <a href="/api/easyreturnserviceapi.html">
                                    <div class="api-menu-item-container">
                                        <div class="api-menu-icons easyreturnicon"></div>
                                        <div class="api-menu-text"></div>
                                        <span class="api-link black">Easy Return Service API</span>
                                        <span class="black">Create labels for returning cross-border parcels</span>
                                    </div>
                                </a>
                            </li>
                            </c:if>
                            <li>
                                <a href="http://www.bring.no/hele-bring/edi-i-bring">
                                    <div class="api-menu-item-container">
                                        <div class="api-menu-icons ediicon"></div>
                                        <div class="api-menu-text"></div>
                                        <span class="api-link black">EDI</span>
                                        <span class="black">Communicate with brings services electronically</span>
                                    </div>
                                </a>
                            </li>

                            <li>
                              <a href="/widget/trackingcomponent.html">
                                <div class="api-menu-item-container">
                                  <div class="api-menu-icons trackingwidgeticon"></div>
                                  <div class="api-menu-text"></div>
                                  <span class="api-link black">Tracking widget</span>
                                  <span class="black">Integrate shipment tracking on your own site</span>
                                </div>
                              </a>
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
