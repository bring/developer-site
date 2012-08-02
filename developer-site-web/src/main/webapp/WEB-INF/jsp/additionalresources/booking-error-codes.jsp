<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/> <misc:title value="Booking API Error codes"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Booking API: Error codes</h1>
                    </div>
                    <div class="box">
                        <p>The following table is generated from <a href="http://beta.bring.com/booking/api/errors.xml">beta.bring.com/booking/api/errors.xml</a>
                        </p>
                        <%-- When adding the data-tab attribute to a
                        table the tableFromJSON script will fetch the
                        contents of the url and print it inside the table
                        (with headers) --%>
                        <table data-tab="/proxy/booking/api/errors.json"></table>
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