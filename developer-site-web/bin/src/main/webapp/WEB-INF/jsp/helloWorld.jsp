<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Hello World!</title>
	</head>
	<body>
		<div class="container">  
			<h1>
				Hello and welcome!
			</h1>
			<form method="post">
				<label for="name">Name</label>
				<input type="text" name="name" id="name" value="<c:out value="${name}"/>"/>
				<input type="submit" value="send" />	
			</form>
			<hr>	
			<c:if test="${message != null}">
				<strong><c:out value="${message}"/></strong>
			</c:if>
		</div>
	</body>
</html>