<%@page import="com.bring.developer.response.pack.Pack"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<misc:title value="${overview.title}"></misc:title>
	<misc:css />
</head>

<body class="page-package-overview">
    <div class="wrapper">
        <misc:header />
        <div class="main">
	        <menutabs:showMenu cssClass="menutab" />
			<div class="content group">
				<div class="overview-packages">
					<c:forEach var="pack" items="${packages}">
						<a class="packagebox" href="/download/${overview.type}/${pack.handle}.html">
							<img src="/img/tempwidget.png" alt="Preview" />
							<strong class="title">${pack.title}</strong>
							<span class="by">by ${pack.person.name}</span>
							<span class="from">from ${pack.person.company}</span>
						</a>
					</c:forEach>
				</div>
				<div class="sidebox">
					<div class="overview-description">
						<h1>${overview.title}</h1>
						${overview.description}
					</div>			
				</div>
            </div>
        </div>
    </div>
    <misc:footer />
    <misc:jqueryblob />
</body>
</html>