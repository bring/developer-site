<%@ taglib prefix="reports" tagdir="/WEB-INF/tags/contenttags/reports" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html>

<html>
<head>
    <misc:contenttype/>
    <misc:title value="Reports API"/>
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
                        <h1>Reports API</h1>
                    </div>

                    <div class="box">
                        <h2><a name="introduction"></a>
                            Introduction</h2>
                        <reports:introduction/>
                    </div>

                    <div class="box">
                        <h2><a name="HTU"></a>
                            How to Use</h2>
                        <reports:how_to_use/>
                    </div>

                    <div class="box">
                        <h2><a name="reference"></a>
                            Reference</h2>
                        <reports:reference/>
                    </div>
                </div>

                <div class="span3" id="additional-resources">
                    <div id="sidebar">
                        <sidebar:reports-sidebar/>
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
