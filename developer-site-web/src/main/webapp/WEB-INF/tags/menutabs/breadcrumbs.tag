<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ attribute name="level1" required="false" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="level2" required="false" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="level3" required="false" type="java.lang.String" rtexprvalue="true"%>

<%! /* @todo Clean up this mess...*/ %>

<c:if test="${!empty level1 }">
<div id="breadcrumbs" class="menubox">
    <ul class="menulist level1 breadcrumbs">
        <li class="marked breadcrumb">
            <a class="menubutton ${!empty level2 ? '' : 'current-page'}" href="#">${level1}</a>
            <c:if test="${!empty level2 }">
                <ul class="level2">
                    <li class="marked breadcrumb">
                        <a class="menubutton ${!empty level3 ? '' : 'current-page'}" href="#">${level2}</a>
                        <c:if test="${!empty level3 }">
                            <ul class="level3">
                                <li class="marked breadcrumb">
                                    <a class="menubutton current-page" href="#">${level3}</a>
                                </li>
                            </ul>
                        </c:if>
                    </li>
                </ul>
            </c:if>
        </li>
    </ul>
</div>
</c:if>