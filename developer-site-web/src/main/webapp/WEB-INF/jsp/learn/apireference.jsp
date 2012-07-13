<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>

<head>
    <misc:contenttype />
    <misc:title value="API Reference" />
    <misc:css />
</head>

<body class="page-apireference">
    <div class="wrapper">
        <misc:header />
        
        <div class="main">
            <menutabs:showMenu cssClass="menutab" />
            <div class="content group">
                <div class="article">
                    <h1><c:out value="${title}"/></h1>
                    
                    <p>
                    	Please note the request prefixes:<br />
                        <code>&amp;hellip;</code> = <code><c:out value="${apiReference.externalRequestBase.content}" /></code>
                    </p>
                    
                    <c:forEach items="${apiReference.parameters}" var="parameter" >
                        <h2><c:out value="${parameter.title}" /></h2>
                        
                        ${parameter.description}
                        
                        <c:if test="${!empty parameter.default}">
                            <p>Default: <code><c:out value="${parameter.default}" /></code></p>
                        </c:if>
                        
                        <div class="codetabs">
                            <c:forEach items="${parameter.examples}" var="example">
                                <h3><a href="#${example.type}"><c:out value="${example.title}" /></a></h3>
                                <div data-tab="${example.type}" class="tab">
                                    <c:if test="${!empty example.request}">
                                        <div class="api-call">
                                            Request: 
                                            <pre><a target="_blank" class="request" href="${apiReference.externalRequestBase.content}${example.request}" data-internal="${apiReference.internalRequestBase.content}${example.request}">&amp;hellip;${example.request}</a></pre>
                                            <c:if test="${example.type == 'json'}">
                                                <p class="right">JSONP request:
                                                    <a target="_blank" href="${apiReference.externalRequestBase.content}${example.request}${fn:contains(example.request, '?') ? '&amp;' : '?'}callbackUrl=functionName">
                                                        <code>${fn:contains(example.request, '?') ? '&amp;' : '?'}callback=functionName</code>
                                                    </a>
                                                    </p>
                                            </c:if>
                                            Response:
                                            <pre class="${example.type} response delay-snippet">Running request...</pre>
                                        </div>
                                    </c:if>
                                    <c:if test="${!empty example.content}">
                                        ${example.content}
                                    </c:if>
                               </div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                    <misc:license />
                </div>
                <div class="span-2 last">
                	<misc:toc></misc:toc>
                    <misc:getsatisfaction/>
					<misc:comments />
				</div>
            </div>
        </div>
    </div>
    
    <misc:footer />
    <misc:jqueryblob />
</body>
</html>