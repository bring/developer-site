<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<%@ taglib prefix="purchaseorder" tagdir="/WEB-INF/tags/contenttags/purchaseorder" %>

<!DOCTYPE html>
<html>
<head>
    <misc:contenttype/>
    <misc:title value="Purchase Order API (BETA)"/>
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
    <h1>Purchase Order API (BETA)</h1>
</div>

<div class="box">
    <h2><a name="introduction"></a>
        Introduction</h2>
    <purchaseorder:introduction />
</div>

<div class="multitabs">

    <ul class="tab-group">
        <li><a href="#xml" data-tab="xml">XML</a></li>
        <li><a href="#json" data-tab="json">JSON</a></li>
        <li><a href="#soap" data-tab="soap">SOAP</a></li>
    </ul>

    <div class="box">

      <div data-tab="xml json">
        <purchaseorder:reference_xml_json/>
        <hr />
        <purchaseorder:how_to_use_xml_json/>
        <hr />
        <purchaseorder:additional_examples_xml/>
        <purchaseorder:additional_examples_json/>
      </div>

      <div data-tab="soap">
        <purchaseorder:reference_soap/>
        <hr />
        <purchaseorder:how_to_use_soap/>
      </div>

    </div>
</div>
</div>

<div class="span3">
    <div id="sidebar">
        <sidebar:purchaseorder-sidebar />
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