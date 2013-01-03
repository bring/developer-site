<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shippingguide" tagdir="/WEB-INF/tags/contenttags/shippingguide" %>
<div data-tab="json xml">
    <p>
        The Shipping Guide API supports a number of parameters. Some parameters are mandatory,
        others are optional, but any query to the Shipping Guide API must at least contain the following information:
    </p>
</div>

<div data-tab="xml">
  <shippingguide:reference_intro suffix="xml"/>
  <shippingguide:reference_table suffix="xml"/>
  <hr />
</div>

<div data-tab="json">
  <shippingguide:reference_intro suffix="json"/>
  <shippingguide:reference_table suffix="json"/>
  <hr />
</div>
