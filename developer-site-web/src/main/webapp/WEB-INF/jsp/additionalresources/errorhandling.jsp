<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
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
        <h1>Shipping Guide API: Error handling</h1>
    </div>
    <div class="box">
        <h4>No products applicable</h4>
        <p>
          If there are no products applicable for the requested shipment, an empty resultset will be returned.
          This means that for the passed-in product list, no products can be used for the shipment. Either the shipment is too large
          or is outside of the coverage area of all the requested products.
          Your code should handle this case, i.e. an empty product list for the shipment.
        </p>
        <p>
          One suggestion is to include more products in each request, e.g. a Cargo-product to handle large shipments. You should know how to send Cargo products
          before including it though.
        </p>
        <h4>General errors</h4>
        <p>
            When using the Shipping Guide, errors or service unavailability can occur, although we do our utmost to prevent any downtime. Thus it is important to use
            timeouts and other error handling techniques when making requests to the service.
        </p>
        <p>
            How you handle errors
            depends on the nature of your application, but one strategy for handling such situations is
            by providing a failover if the shipping guide responds with an error or does not respond at all (timeout).
        </p>
        <p>
          For instance your application can respond to an error by using
            prefetched <a href="/additionalresources/offlinedata.html?from=shipping">offline data</a> to calculate prices and delivery time estimates. Another alternative would be
            to use a a fixed standard price whenever an error occurs.
        </p>

        <h4>Error codes for rejected requests</h4>
        <table data-tab="/proxy/shipping-guide/api/errorCodes.json?clientUrl=developer.bring.com"></table>

    </div>
</div>
<div class="span3">
    <div id="sidebar">
        <misc:sidebar />
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