<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<%@ taglib prefix="shippingguide" tagdir="/WEB-INF/tags/contenttags/shippingguide" %>

<!DOCTYPE html>
<html>
<head>
    <misc:contenttype/>
    <misc:title value="Shipping Guide API"/>
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
    <h1>Shipping Guide API</h1>
</div>

<div class="box">
    <h2><a name="introduction"></a>
        Introduction</h2>
    <shippingguide:introduction />
</div>

<div class="multitabs">

    <ul class="tab-group">
        <li><a href="#xml" data-tab="xml">XML</a></li>
        <li><a href="#json" data-tab="json">JSON</a></li>
        <li><a href="#soap" data-tab="soap">SOAP</a></li>
    </ul>

    <div class="box">
        <h2><a name="reference"></a>
            Reference</h2>
        <shippingguide:reference_xml_json/>
        <shippingguide:reference_soap/>

        <h2><a name="HTU"></a>
            How to Use</h2>
        <shippingguide:how_to_use_xml_json/>
        <shippingguide:how_to_use_soap/>

        <div data-tab="xml json soap"><hr><h2><a name="additionalExamples"></a>
            Additional examples</h2></div>
        <shippingguide:additional_examples_xml/>
        <shippingguide:additional_examples_json/>

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