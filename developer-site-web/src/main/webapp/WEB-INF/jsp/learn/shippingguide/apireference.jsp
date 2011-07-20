<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:title value="Tracking" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/lib.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
</head>

<body>
    <div class="wrapper">
        <misc:header />
        <div class="main">
            <menutabs:showMenu cssClass="menutab" level1="Shipping guide API" level2="API Reference" />
            <div class="content group">
                <div class="article">
                    <h1>API Reference</h1>
                    <c:forEach items="${document.parameters}" var="param">
                        ${param}
                    </c:forEach>
                    ${document.parameters}
                </div>
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jqueryblob />
    <script>
        $(document).ready(function() {
            var sectionId = "#learn";
            $("#navigation").menutab("init", {
                section: sectionId,
                tabs: [ "#learn", "#download", "#talk" ],
            });
            $("#navigation").menu({
                section: sectionId,
                breadcrumbs: [2, 1]
            });
            
            $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){
                return '<li class="group"><img class="avatar" src="' + 
                image + '"/><div class="avatar-list-text"><div class="question-title">' +
                user + '</div><div class="question-text"><blockquote>' + 
                text + '</blockquote></div>' + '<div class="datetime">' + 
                time + '</div></div></li>';
            });
        });
    </script>
</body>

</html>