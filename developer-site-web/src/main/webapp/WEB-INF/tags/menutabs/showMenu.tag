<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ attribute name="cssClass" required="true" type="java.lang.String" %>
<%@ attribute name="enableBreadcrumbs" required="false" type="java.lang.String" %>

<div id="navigation" class="${enableBreadcrumbs ? 'breadcrumbs' : ''}">
    <menutabs:launchers cssClass="${cssClass}" />
    <div class="navigation-tabs-container">
        <div class="navigation-tabs">
        </div>
    </div>
</div>