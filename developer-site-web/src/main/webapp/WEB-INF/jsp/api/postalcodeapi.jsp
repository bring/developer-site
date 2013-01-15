<%@ taglib prefix="postalcode" tagdir="/WEB-INF/tags/contenttags/postalcode" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html>

<html>
<head>
    <misc:contenttype/> <misc:title value="Postal Code API"/> <misc:css_v2/>
</head>
<body>
<div class="wrapper">
<misc:header_v2 selected_tab="developer"/>
<div id="page">
<section id="content">
<div class="row-fluid">
<div class="span9">

    <div class="box">
        <h1>Postal Code API</h1>
    </div>

    <div class="box">
        <h2><a name="introduction"></a>Introduction</h2>
        <p>With the Postal Code API you can
          <ul>
            <li>
              validate a postal code
            </li>
            <li>
              look up the city of a postal code
            </li>
            <li>
              get the postal code type, e.g. normal or P.O. Box (for Norway)
            </li>
        </ul>
        The API has three interfaces: XML, JSON and HTML.
      </p>
    </div>

    <div class="multitabs">
        <ul class="tab-group">
            <li><a href="#xml" data-tab="xml">XML</a></li>
            <li><a href="#json" data-tab="json">JSON</a></li>
            <li><a href="#html" data-tab="html">HTML</a></li>
        </ul>

    <div class="box">
        <h2><a name="reference"></a>Reference</h2>
        <postalcode:reference/>
        <hr>

        <h2><a name="HTU"></a>How to Use</h2>
        <postalcode:how_to_use_text/>
        <postalcode:how_to_use_examples/>

        <hr>
        <h2><a name="additionalExamples"></a>Additional examples</h2>
        <postalcode:additional_examples/>
    </div>
</div>
</div>

<div class="span3">
    <div id="sidebar">
        <sidebar:postalcode-sidebar/>
    </div>
</div>
</div>
</section>
</div>

</div>
<misc:footer_v2/> <misc:jqueryblob_v2/>
</body>
</html>