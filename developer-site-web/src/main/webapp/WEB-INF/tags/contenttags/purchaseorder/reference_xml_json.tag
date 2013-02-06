<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="purchaseorder" tagdir="/WEB-INF/tags/contenttags/purchaseorder" %>
<div data-tab="json xml">
    <h2><a name="reference"></a>Reference</h2>
    <p>
        The Purchase Order API supports a number of parameters. Some parameters are mandatory,
        others are optional, but any query to the Purchase Order API API must at least contain the following information:
    </p>
</div>

<div data-tab="xml">
  <purchaseorder:reference_intro suffix="xml"/>
  <purchaseorder:reference_table suffix="xml"/>
</div>

<div data-tab="json">
  <purchaseorder:reference_intro suffix="json"/>
  <purchaseorder:reference_table suffix="json"/>
</div>
