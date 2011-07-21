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
				<div class="widget-content">
					<div class="widgetpreview">
						<h1>Widget</h1>
					</div>
					<div class="widgetinfo">
						<div class="widgetarticle">
							<h1>Optional Post office</h1>
							<p>Optional post office is a service that allows an end user can choose to pick up their package at another post office / post office than the local. This can be done directly from the online store's image for the choice of shipping.</p>
							<h2>How to install</h2>
							<p>etpoewt</p>
							<h2>More information</h2>
							<p>eroe</p>
						</div>
						<div class="widget-tools">
							<h2>Tools</h2>
							
						</div>
					</div>
				</div>
				<misc:socialfeed />
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