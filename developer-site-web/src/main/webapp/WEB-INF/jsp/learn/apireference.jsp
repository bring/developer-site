<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1>API Reference</h1>
                    
                    <c:forEach items="${document.parameters}" var="parameter" >
                        <h2>${parameter.title}</h2>
                        
                        ${parameter.description}
                        
                        <c:if test="${!empty parameter.default}">
                            <p>Default: <code>${parameter.default}</code></p>
                        </c:if>
                        
                        <div class="codetabs">
                            <c:forEach items="${parameter.examples}" var="example">
                                <h3><a href="#${example.type}">${example.title}</a></h3>
                                <div data-tab="${example.type}" class="tab">
                                    <c:if test="${!empty example.request}">
                                        <p>
                                            Request:
                                            <a class="request" href="${document.requestBase}${example.request}">
                                                ${example.request}
                                            </a>
                                        </p>
                                        <pre class="${example.type}"></pre>
                                    </c:if>
                                    <c:if test="${!empty example.content}">
                                        ${example.content}
                                    </c:if>
                               </div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
                <misc:socialfeed />
            </div>
        </div>
    </div>
    
    <misc:footer />
    <misc:jqueryblob />
</body>
</html>