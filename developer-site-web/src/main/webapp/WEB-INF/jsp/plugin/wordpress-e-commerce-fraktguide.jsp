<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Fraktguide for Wordpress e-commerce"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Fraktguide for Wordpress e-commerce</h1>
                    </div>

                    <div class="box">
                        <p>This is a shipping module for WP e-Commerce. It uses the Bring Fraktguide XML API to get
                           shipping quotes. It will get accurate prices based on delivery postcode, weight, length,
                           width, height and volume. The plugin only supports WP e-Commerce 3.8 and later. </p>
                        <h4>How to install</h4>
                        <ol>
                            <li>
                                Use instructions on download page and the readme.txt within the download
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
                                </ul>
                                <div class="tab-content tab-minimal">

                                    <div class="tab-pane active" id="tab1">
                                        <div class="box lightBorder">
                                            <img src="/img/wordpress-ecommerce-screenshot1.png"
                                                 class="fitted-width"/>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab2">
                                        <div class="box lightBorder">
                                            <img src="/img/wordpress-ecommerce-screenshot2.png"
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
                                    <a href="http://www.hwu.no/" target="_blank"> Leif-Arne Helland </a>
                                </li>
                            </ul>
                        </div>

                        <div class="span4 box"></div>

                        <div class="span4 box">
                            <a href="http://wordpress.org/extend/plugins/wp-e-commerce-bring-fraktguide/"
                               class="btn enhanced">Download</a>
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

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>