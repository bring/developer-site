<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <misc:title value="Home" />
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link rel="stylesheet" type="text/css" href="css/lib.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <link rel="stylesheet" type="text/css" href="css/showcase.css" />
    <link rel="stylesheet" type="text/css" href="css/css3.css" />
</head>

<body>
    <misc:header />
    <div class="main">
	    <div class="wrapper group">
		    <misc:showcase />
		    <misc:learn />
	        <misc:download />
	        <misc:talk />
		</div>
	</div>
	<misc:footer />
</body>

</html>