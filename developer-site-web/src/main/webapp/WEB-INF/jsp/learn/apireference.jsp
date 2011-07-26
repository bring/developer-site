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

<body>
    <div class="wrapper">
        <misc:header />
        <div class="main">
            <menutabs:showMenu cssClass="menutab" />
            
            <div class="content group">
                <div class="article">
                    <h1>API Reference</h1>
                    
                    <c:forEach items="${document.parameters}" var="myElement" >
                        <h2>${myElement.title}</h2>
                        
                        ${myElement.description}
                        
                        <c:if test="${!empty myElement.default}">
                            <p>Default: <code>${myElement.default}</code></p>
                        </c:if>
                        
                        <div class="codetabs">
                            <c:forEach items="${myElement.examples}" var="example">
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
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jqueryblob />
    <script type="text/javascript" src="/js/lib/jquery.snippet.js"></script>
    <script type="text/javascript" src="/js/lib/jquery.cookie.js"></script>
    <script type="text/javascript" src="/js/navigation/menu-breadcrumbs.js"></script>
    <script type="text/javascript" src="/js/syntaxhighligther.js"></script>
    <script type="text/javascript" src="/js/codetabs.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            var navElement = $("#navigation");
            navElement.menu().menuBreadcrumbs().menutab();

            // Twitter
            $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){
                return '<li class="group"><img class="avatar" src="' + 
                image + '"/><div class="avatar-list-text"><div class="question-title">' +
                user + '</div><div class="question-text"><blockquote>' + 
                text + '</blockquote></div>' + '<div class="datetime">' + 
                time + '</div></div></li>';
            });
            

            // Show the correct tab on init
            $(".codetabs").codetabs({
				cookies : true,
				defaultTab : ""
			});
            
        });
    </script>
</body>

</html>