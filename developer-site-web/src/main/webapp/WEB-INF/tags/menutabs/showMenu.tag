<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<%@ attribute name="cssClass" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="level1" required="false" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="level2" required="false" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="level3" required="false" type="java.lang.String" rtexprvalue="true"%>

<div id="navigation">
    <misc:launchers cssClass="${cssClass}" />
    <div class="navigation-tabs">
        <menutabs:breadcrumbs level1="${level1}" level2="${level2}" level3="${level3}"/>
        <menutabs:learn />
        <menutabs:download />
        <menutabs:talk />
    </div>
</div>