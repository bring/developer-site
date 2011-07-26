<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:css />
    <misc:title value="Tracking widget" />
</head>

<body class="page-package">
    <div class="wrapper">
        <misc:header />
        <div class="main">
	
	        <menutabs:showMenu cssClass="menutab" />
			<div class="content group">
				<div class="widgetcontent">
					<a class="widgetbox" href="/download/widget/optionalpostoffice.html">
						<img src="/img/tempwidget.png" />
						<span class="title">Tracking widget, medium size with gradient</span>
						<span class="by">by Elton John</span>
						<span class="from">from Apple</span>
					</a>
				</div>
				<div class="sidebox">
					<div class="widgetdescription">
						<h1>Widgets</h1>
						<p>Widgets are small HTML, CSS and Javascript elements which provides some functionality to the user. They are easily installed, lightweight and run soley in the user's browser.</p>
					</div>			
				</div>
            </div>
        </div>
    </div>
    
    <misc:footer />
    <misc:jqueryblob />
</body>
</html>