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
        <table>
            <thead>
            <tr>
                <th>Error code</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td>FG_INPUT_001</td>
                <td>Shipmentdate must be set</td>
            </tr>
            <tr >
                <td> FG_INPUT_002</td>
                <td>Error with Postal code</td>
            </tr>

            <tr>
                <td>FG_INPUT_003</td>
                <td>Missing usercode</td>
            </tr>
            <tr >
                <td>FG_INPUT_004</td>
                <td>At least one product id must be set</td>
            </tr>

            <tr>
                <td>FG_INPUT_005</td>
                <td>Wrong date format</td>
            </tr>
            <tr >
                <td>FG_INPUT_006</td>
                <td>Error with volume</td>
            </tr>

            <tr>
                <td>FG_INPUT_008</td>
                <td>Missing Package element</td>
            </tr>
            <tr >
                <td>FG_INPUT_010</td>
                <td>Error number of alternative deliverydates</td>
            </tr>

            <tr>
                <td>FG_INPUT_011</td>
                <td>Wrong weight unit code</td>
            </tr>
            <tr >
                <td>FG_INPUT_012</td>
                <td>Invalid weight format</td>
            </tr>

            <tr>
                <td>FG_INPUT_013</td>
                <td>Invalid volume format</td>
            </tr>
            <tr >
                <td>FG_INPUT_014</td>
                <td>Invalid volume unit code</td>
            </tr>

            <tr>
                <td>FG_INPUT_016</td>
                <td>Invalid input dimensions</td>
            </tr>
            <tr >
                <td>FG_INPUT_017</td>
                <td>Invalid input dimensions unit code</td>
            </tr>

            <tr>
                <td>FG_INPUT_018</td>
                <td>Too many packages</td>
            </tr>
            <tr >
                <td>FG_INPUT_019</td>
                <td>Productid missing</td>
            </tr>

            <tr>
                <td>FG_INPUT_020</td>
                <td>Invalid offline from post number</td>
            </tr>
            <tr >
                <td>FG_INPUT_021</td>
                <td>Non existing postalcode</td>
            </tr>

            <tr>
                <td>FG_INPUT_022</td>
                <td>Missing weight or volume</td>
            </tr>
            <tr >
                <td> FG_INPUT_023</td>
                <td>Unexpected parameter</td>
            </tr>

            <tr>
                <td>FG_INPUT_024</td>
                <td>Invalid input price adjustment</td>
            </tr>
            <tr >
                <td> FG_INPUT_025</td>
                <td>Unknown public id</td>
            </tr>

            <tr>
                <td>FG_INPUT_027</td>
                <td>Invalid country code</td>
            </tr>
            <tr >
                <td>FG_INPUT_029</td>
                <td>Wrong time format</td>
            </tr>

            <tr>
                <td> FG_INPUT_030</td>
                <td>Invalid request version</td>
            </tr>
            <tr >
                <td>FG_INPUT_031</td>
                <td>Request version missing</td>
            </tr>

            <tr>
                <td>FG_INPUT_032</td>
                <td>Mismatch in value in package and consignment.</td>
            </tr>
            <tr >
                <td>FG_INPUT_033</td>
                <td>A consignment element must be specified when requesting a consignment-oriented product.</td>
            </tr>
            <tr >
                <td>FG_INPUT_034</td>
                <td>Invalid City.</td>
            </tr>
            <tr >
                <td>FG_INPUT_035</td>
                <td>Shipping date must be current date or in the future when net prices are requested.</td>
            </tr>
            <tr >
                <td>FG_INPUT_036</td>
                <td>Schema version 8 and newer does no longer support user code. Use Client URL instead. See XSD Schema documentation.</td>
            </tr>
            <tr >
                <td>FG_INPUT_037</td>
                <td>Schema version 8 and newer requires Client URL element set. See XSD Schema documentation.</td>
            </tr>
            <tr >
                <td>FG_INPUT_038</td>
                <td>Schema version 8 and newer requires that the api.bring.com/shippingguide endpoint is used. Check out developer.bring.com</td>
            </tr>
            <tr >
                <td>FG_INPUT_039</td>
                <td>Endpoint at api.bring.com/shippingguide requires that schema version 8 or newer is used. Check out developer.bring.com</td>
            </tr>
            <tr >
                <td>FG_INPUT_040</td>
                <td>Invalid UNNumber format. UNNumber must be a four digit string. Ex: 0030</td>
            </tr>
            <tr >
                <td>FG_INPUT_041</td>
                <td>Oil express product requires a customer number set on the product element, because only contract prices are available.</td>
            </tr>

            <tr>
                <td>FG_PRODUCT_001</td>
                <td>Product unknown</td>
            </tr>
            <tr >
                <td>FG_PRODUCT_002</td>
                <td>Product not available as offline data.</td>
            </tr>

            <tr>
                <td>FG_UNKNOWN_001</td>
                <td>Unknown internal error</td>
            </tr>
            <tr >
                <td>FG_USER_002</td>
                <td>Wrong usercode</td>
            </tr>

            </tbody>
        </table>

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