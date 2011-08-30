<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:css />
    <misc:title value="Home" />
</head>

<body class="page-home">
	<div class="wrapper">
	    <misc:header />
        
	    <div class="main group">
            <misc:showcase />
            <menutabs:showMenu cssClass="menutab" />
            <div class="group home-content">
                <misc:quote />
                <misc:popularwidgets />
                <div class="box span-2 last home-banner-box">
                    <ul id="twittercontent" class="avatar-list group"></ul>
                </div>
            </div>
		</div>
        
	</div>
	<misc:footer />
    <misc:jqueryblob />
</body>
</html>