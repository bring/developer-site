<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Fraktpriser for osCommerce"/>
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
                        <h1>Fraktpriser for osCommerce</h1>


                    </div>

                    <div class="box">
                        <p>
                            This osCommerece module adds the possibility of letting users pick their preferred shipping
                            method. It connects to Bring's Shipping Guide API to fetch prices, estimated delivery times
                            and product descriptions.
                        </p>
                        <h4>How to install</h4>
                        <ol>
                            <li>First backup your osCommerce install.</li>
                            <li>Download and extract the plugin.</li>
                            <li>Upload the <code>catalog</code> folder from the extracted plugin to your osCommerce
                                webshop's root directory.
                            </li>
                            <li>Follow the instructions in the <code>lesmeg.txt</code> file in the package.</li>
                        </ol>
                    </div>

                    <div class="box">

                        <h4>Screenshot</h4>

                        <div class="box lightBorder">
                            <img class="fitted-width"
                                 src="http://developer.bring.com/media/plugin/oscommercefraktpriser/full.png"/>
                        </div>
                    </div>
                    <div class="box">
                        <h4>Made by</h4>
                        <ul>
                            <li>
                                <a href="http://www.kortshop.no/" target="_blank">Kortshop</a>
                            </li>
                            <li>
                                <a href="http://www.linkedin.com/in/arneunneland" target="_blank">Arne Unneland</a>
                            </li>
                            <li>
                                <a href="http://mystore.no" target="_blank">Yngve</a>
                            </li>
                        </ul>
                        <h4>Used by</h4>
                        <ul>

                            <li><a href="http://kortshop.no/" target="_blank">Kortshop</a></li>

                            <li><a href="http://magasi.net/" target="_blank">MAGASI.NET</a></li>

                            <li><a href="http://flightSim.no/" target="_blank">FlightSim.no Shop</a></li>

                        </ul>
                        <div class="box">
                            <a href="http://addons.oscommerce.com/info/7811"
                               class="btn enhanced">Download</a>
                        </div>
                    </div>

                </div>

                <div class="span3">
                    <div class="box">
                        <a class="black" href="/api/shippingguideapi.html">
                            <h4>Shipping Guide API</h4>
                        </a>
                        <ol>
                            <li>
                                <a href="/api/shippingguideapi.html#introduction"> Introduction </a>
                            </li>

                            <li>
                                <a href="/api/shippingguideapi.html#reference"> Reference </a>
                            </li>

                            <li>
                                <a href="/api/shippingguideapi.html#HTU"> How to Use </a>
                            </li>

                            <li>
                                <a href="/api/shippingguideapi.html#additionalExamples"> Additional Examples </a>
                            </li>
                        </ol>

                    </div>

                    <div class="box">
                        <h2>Additonal Resources</h2>
                        <ul>
                            <li><a href="../additionalresources/errorhandling.html">Error handling</a></li>
                            <li><a href="../additionalresources/wsdl-xml-schema.html">WSDL/XML SCHEMA</a></li>
                            <li><a href="../additionalresources/productlist.html">Product list</a></li>
                            <li><a href="../additionalresources/offlinedata.html">Offline data</a></li>
                        </ul>
                        <h4>Widgets</h4>
                        <ul>
                            <li><a href="../widget/displayshippingguideinformationusingjsonp.html">Display shipping guide information
                                                                                                   using jsonp</a></li>
                            <li><a href="../widget/productselectionashtml.html">Product selection as html</a></li>
                        </ul>
                        <h4>Plugins</h4>
                        <ul>
                            <li><a href="../plugin/joomla-virtuemart-fraktpriser.html">Fraktguide for Joomla! Virtuemart</a></li>
                            <li><a href="../plugin/oscommerce-fraktpriser.html">Fraktguide for osCommerce</a></li>
                            <li><a href="../plugin/prestashop-fraktguide.html">Fraktguide for Prestashop</a></li>
                            <li><a href="../plugin/wordpress-e-commerce-fraktguide.html">Fraktguide for Wordpress e-commerce</a></li>
                            <li><a href="../plugin/zencart-fraktguide.html">Fraktguide for ZenCart</a></li>
                        </ul>
                    </div>
                </div>

            </div>

        </section>
    </div>


</div>

<misc:footer_v2/>
<misc:jqueryblob_v2/>

</body>
</html>