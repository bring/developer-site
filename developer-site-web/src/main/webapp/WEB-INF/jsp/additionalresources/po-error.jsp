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

      @XmlEnumValue("PO_INPUT_001")
      INVALID_CUSTOMER_ID("Must provide valid customer ID"),
      @XmlEnumValue("PO_INPUT_002")
      INVALID_PURCHASE_ORDER("Must provide valid purchase order"),
      @XmlEnumValue("PO_INPUT_003")
      INVALID_SCHEMA_VERSION("Must provide valid schema version. See developer.bring.com for latest schema version"),
      @XmlEnumValue("PO_INPUT_004")
      INVALID_REQUEST_DATETIME("Request properties must contain valid datetime"),
      @XmlEnumValue("PO_INPUT_005")
      LOCALE_REQUIRED("Request properties must contain valid locale"),
      @XmlEnumValue("PO_INPUT_006")
      REQUEST_PROPERTIES_REQUIRED("Request properties must be present"),
      @XmlEnumValue("PO_INPUT_007")
      CONSIGNMENT_ID_REQUIRED("Consignment ID is required"),
      @XmlEnumValue("PO_INPUT_008")
      INVALID_EVENT_TYPE("Must provide valid EventType. See xsd for list of valid types."),
      @XmlEnumValue("PO_INPUT_009")
      INVALID_EVENT_TIMESTAMP("Must provide valid ISO timestamp for event"),
      @XmlEnumValue("PO_INPUT_010")
      NO_ORDERLINES_WHEN_PO_NOT_FOUND("Purchase order not found. You can not have orderlines to a non-existing purchase order."),
      @XmlEnumValue("PO_INPUT_011")
      NEGATIVE_ORDER_LINE(TransportValidationException.Type.NEGATIVE_QUANTITY.getMessage()),
      @XmlEnumValue("PO_INPUT_012")
      ITEM_NOT_ON_PURCHASE_ORDER(TransportValidationException.Type.ITEM_NOT_ON_PURCHASE_ORDER.getMessage()),
      @XmlEnumValue("PO_INPUT_013")
      SHIPPING_CONTAINER_ID_REQUIRED("Shipping container ID is required"),
      @XmlEnumValue("PO_INPUT_014")
      SHIPPING_CONTAINER_TYPE_REQUIRED("A valid container type required for the shipping container and the content"),
      @XmlEnumValue("PO_INPUT_015")
      SHIPPING_CONTAINER_CONTENT_REQUIRED("Content for shipping container is required"),
      @XmlEnumValue("PO_INOUT_016")
      SHIPPING_CONTAINER_CONTENT_REQUIRES_CONSIGNMENT_OR_SHIPPING_CONTAINER_ID("Content in shipping container requires either consignment ID or shipping container ID"),

      // State errors
      @XmlEnumValue("PO_STATE_001")
      PURCHASE_ORDER_NOT_FOUND("Purchase order not found"),
      @XmlEnumValue("PO_STATE_002")
      AUTHENTICATION_FAILED("You must log in to use this endpoint. See developer.bring.com for details about login with HTTP-headers."),
      @XmlEnumValue("PO_STATE_003")
      ORDER_ITEMS_NOT_FOUND("Order items for requested purchase order not found");
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