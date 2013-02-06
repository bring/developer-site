<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>

<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/>
    <misc:title value="Error Handling"/>
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
        <h1>Purchase Order API: Error handling</h1>
    </div>
    <div class="box">
        <h4>General errors</h4>
        <p>
            When using the Purchase Order, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use
            timeouts and other error handling techniques when making requests to the service.
        </p>
        <p>
            How you handle errors
            depends on the nature of your application, but one strategy for handling such situations is
            by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).
        </p>

        <h4>Error codes for rejected requests</h4>
        <table>
            <thead>
            <tr>
                <th>Error code</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

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

<misc:footer_v2 />
<misc:jqueryblob_v2 />

</body>



</html>