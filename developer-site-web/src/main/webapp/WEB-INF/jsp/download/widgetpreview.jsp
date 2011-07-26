<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<misc:title value="${widget.title} preview"></misc:title>
	<link rel="stylesheet" type="text/css" href="/css/preview.css" />
</head>
<body>
	${widget.previewCode.content}
</body>
</html>