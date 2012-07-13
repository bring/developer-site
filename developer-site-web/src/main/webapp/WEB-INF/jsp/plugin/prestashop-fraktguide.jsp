<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Fraktguide for Prestashop"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Fraktguide for Prestashop</h1>
                    </div>

                    <div class="box">
                        <p>This Prestashop module adds the possibility of letting users pick their preferred shipping
                            method. It connects to Bring's Shipping Guide API to fetch prices, estimated delivery times
                            and product descriptions. </p>

                        <p>More information in the <a href="https://github.com/nilsga/prestashop-fraktguide"> GitHub
                            repository</a> (Norsk). </p>
                        <h4>How to install</h4>
                        <ol>
                            <li>
                                <p>Please follow instruction on the <a
                                        href="https://github.com/nilsga/prestashop-fraktguide">GitHub repository</a>
                                </p>
                            </li>
                        </ol>
                    </div>

                    <div class="box">

                        <div class="content-box">
                            <div class="row element-sample">
                                <h4>Screenshots</h4>
                                <ul class="tab-group minimal" data-tabs="tabs">
                                    <li class="active"><a href="#tab1">Screenshot 1</a></li>
                                    <li><a href="#tab2">Screenshot 2</a></li>
                                    <li><a href="#tab3">Screenshot 3</a></li>
                                    <li><a href="#tab4">Screenshot 4</a></li>
                                </ul>
                                <div class="tab-content tab-minimal">

                                    <div class="tab-pane active" id="tab1">
                                        <div class="box lightBorder">
                                            <img src="http://developer.bring.com/media/plugin/prestashopfraktpriser/customerexp.png"
                                                 class="fitted-width"/>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab2">
                                        <div class="box lightBorder">
                                            <img src="http://developer.bring.com/media/plugin/prestashopfraktpriser/config1.png"
                                                 class="fitted-width"/>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab3">
                                        <div class="box lightBorder">
                                            <img src="http://developer.bring.com/media/plugin/prestashopfraktpriser/config2.png"
                                                 class="fitted-width"/>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab4">
                                        <div class="box lightBorder">
                                            <img src="http://developer.bring.com/media/plugin/prestashopfraktpriser/install.png"
                                                 class="fitted-width"/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="box">
                        <div class="span4 box">
                            <h4>Made by</h4>
                            <ul>
                                <li>
                                    <a href="http://htpc.no/" target="_blank">Nils-Helge Garli Hegvik </a>
                                </li>
                            </ul>
                        </div>

                        <div class="span4 box"></div>

                            <div class="span4 box">
                                <a href="https://github.com/nilsga/prestashop-fraktguide"
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
                            <li><a href="../widget/displayshippingguideinformationusingjsonp.html">Display shipping
                                guide information using jsonp</a></li>
                            <li><a href="../widget/productselectionashtml.html">Product selection as html</a></li>
                        </ul>
                        <h4>Plugins</h4>
                        <ul>
                            <li><a href="../plugin/joomla-virtuemart-fraktpriser.html">Fraktguide for Joomla!
                                Virtuemart</a></li>
                            <li><a href="../plugin/oscommerce-fraktpriser.html">Fraktguide for osCommerce</a></li>
                            <li><a href="../plugin/prestashop-fraktguide.html">Fraktguide for Prestashop</a></li>
                            <li><a href="../plugin/wordpress-e-commerce-fraktguide.html">Fraktguide for Wordpress
                                e-commerce</a></li>
                            <li><a href="../plugin/zencart-fraktguide.html">Fraktguide for ZenCart</a></li>
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