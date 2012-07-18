<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Fraktpriser for ZenCart"/>
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
                        <h1>Fraktpriser for ZenCart </h1>
                    </div>

                    <div class="box">

                        <p>This ZenCart module adds the possibility of letting users pick their preferred shipping
                           method. It connects to Bring's Shipping Guide API to fetch prices, estimated delivery
                           times and product descriptions.
                        </p>

                        <p>More information in the
                            <a href="http://code.google.com/p/fraktpriserzencart/source/browse/trunk/zencart/pakkepriser/lesmeg.txt">
                                readme file</a> (Norsk).</p>
                        <h4>How to install</h4>

                        <ol>

                            <li>Download and extract the plugin.</li>

                            <li>It is recommended that you backup your ZenCart first.</li>

                            <li>Upload the <code>includes</code> folder from the extracted plugin to your ZenCart
                                webshop's root directory.
                            </li>

                            <li>Go to <code>Modules &amp;rarr; Shipping</code>. The module you are looking for is suffixed
                                by "(Bring Fraktguide)".
                            </li>

                            <li>Install the shipping options you want by clicking the "Install" button next to them.
                            </li>

                        </ol>

                    </div>

                    <div class="box">

                        <h4>Screenshot</h4>

                        <div class="box lightBorder">
                            <img class="fitted-width" src="http://developer.bring.com/media/plugin/zencartfraktpriser/full.png"/>
                        </div>
                    </div>
                    <div class="box">
                        <div class="span4 box">
                            <h4>Made by</h4>
                            <ul>
                                <li>
                                    <a href="http://syntaxerror.no" target="_blank">
                                        Rune Rassmusen
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.linkedin.com/in/arneunneland" target="_blank">
                                        Arne Unneland
                                    </a>
                                </li>
                                <li>
                                    <a href="http://www.linkedin.com/pub/ingvald-haaland/7/726/3b" target="_blank">
                                        Ingvald Haaland
                                    </a>
                                </li>
                            </ul>
                        </div>


                        <div class="span4 box">
                            <h4>Used by</h4>
                            <ul>
                                <li><a href="http://www.sunesport.no/">Sune Sport &amp; Games</a></li>
                                <li><a href="http://iutstyr.no/">iUtstyr.no</a></li>
                                <li><a href="http://evenstadmusikk.no/">evenstadmusikk.no</a></li>
                            </ul>
                        </div>

                        <div class="span4 box">
                            <a href="http://code.google.com/p/fraktpriserzencart/downloads/list" class="btn enhanced">Download</a>
                            <br/>
                            <br/>
                            <a href="http://code.google.com/p/fraktpriserzencart/" class="btn">Repository</a>
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

<misc:footer_v2/>
<misc:jqueryblob_v2/>

</body>
</html>