<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<%@ taglib prefix="easyreturnservice" tagdir="/WEB-INF/tags/contenttags/easyreturnservice" %>

<!DOCTYPE html>
<html>
<head>
    <misc:contenttype/>
    <misc:title value="Easy Return Service API"/>
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
            <h1>Easy Return Service API</h1>
        </div>
        <div class="box">
            <h2><a name="Introduction"></a>Introduction</h2>
            <easyreturnservice:introduction/>
        </div>
        <div class="box">
            <h2><a name="Reference"></a>Reference</h2>
            <easyreturnservice:reference/>
        </div>
        <div class="box">
            <h2><a name="ExampleXML"></a>Return Label Request XML</h2>
            <easyreturnservice:return_label_request_xml/>
        </div>
        <div class="box">
            <h2><a name="HTU"></a>How to Use</h2>
            <easyreturnservice:how_to_use/>
        </div>

    </div>
    <div class="span3">
        <div id="sidebar">
            <sidebar:easyreturnservice-sidebar />
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


