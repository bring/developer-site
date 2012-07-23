<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Java API"/>
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
                        <h1>Java API</h1>
                    </div>
                    <div class="box">
                        <p>This library makes it easier for a Java developer to interact with Bring's APIs.</p>
                        <p>It currently supports Bring's <a href="/api/shippingguideapi.html?from=shipping">Shipping Guide API</a> and Bring's <a href="/api/trackingapi.html?from=tracking">Tracking API.</a></p>
                        <h2>How to install</h2>
                        <ol>
                            <li>Download the jar-file and include with your project.
                            </li>
                            <li>Or, install using Maven (coming soon).</li>
                            <li>Or, build it yourself from GitHub.</li>
                        </ol>
                    </div>
                    <div class=" box">
                        <a href="https://github.com/bring/bring-api-java" class="btn" target="_blank">Repository</a>
                    </div>

                </div>
                <div class="span3">
                    <div id="sidebar">

                    <misc:sidebar/>

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