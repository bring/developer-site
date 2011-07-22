<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:title value="Tracking" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/lib.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/downloadmenu.css" />
    <link rel="stylesheet" type="text/css" href="/css/widget.css" />


</head>

<body>
    <div class="wrapper">
        <misc:header />
        <div class="main">
			<div id="navigation">
			    <misc:launchers cssClass="menutab" />
			    <div class="navigation-tabs">
			        <div id="breadcrumbs" class="menubox"></div>
			        <menutabs:learn />
			        <menutabs:download />
			        <menutabs:talk />
			    </div>
			</div>
			<div class="content group">
				<div class="widgetcontent">
					<a class="widgetbox" href="#">
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
    <script>
        $(document).ready(function() {
            var sectionId = "#download";
            $("#navigation").menutab("init", {
                section: sectionId,
                tabs: [ "#learn", "#download", "#talk" ],
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