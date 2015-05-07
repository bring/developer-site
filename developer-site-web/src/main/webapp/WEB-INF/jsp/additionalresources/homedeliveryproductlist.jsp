<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/> <misc:title value="Home Delivery Product List"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>Home Delivery Product List</h1>
                        <table data-tab="/proxy/shipping-guide/api/homedeliveryproductlist.json?clientUrl=developer.bring.com"></table>
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

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>

</html>