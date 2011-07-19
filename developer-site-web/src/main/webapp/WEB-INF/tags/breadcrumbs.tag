<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ attribute name="level1" required="true" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="level2" required="false" type="java.lang.String" rtexprvalue="true"%>
<%@ attribute name="level3" required="false" type="java.lang.String" rtexprvalue="true"%>

<div id="breadcrumbs" class="menubox">
    <ul class="menulist">
        <li class="marked ${level2 ? '' : 'current-page'}">
            <a class="menubutton" href="#">${level1}</a>
            <c:if test="${!empty level1 }">
                <ul>
                    <li class="marked ${level3 ? '' : 'current-page'}">
                        <a class="menubutton" href="#">${level2}</a>
                        <c:if test="${!empty level3 }">
                            <ul>
                                <li class="marked current-page">
                                    <a class="menubutton" href="#">${level3}</a>
                                </li>
                            </ul>
                        </c:if>
                    </li>
                </ul>
            </c:if>
        </li>
    </ul>
</div>