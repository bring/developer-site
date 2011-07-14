<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:title value="Home" />
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link rel="stylesheet" type="text/css" href="css/lib.css" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <link rel="stylesheet" type="text/css" href="css/showcase.css" />
</head>

<body>
	<div class="wrapper">
	    <misc:header />
	    
	    <div class="main group">
            <misc:showcase />
        
            <div class="group" id="navigation">
                <div id="learn-launcher" class="section-launcher span-2 box">
                   <div class="section-title"><a href="#learn"><span>LEARN</span></a></div>
                   <span class="section-description">TUTORIALS, EXAMPLES, API REFERENCE</span>
                </div>
                <div id="download-launcher" class="section-launcher span-2 box">
                   <div class="section-title"><a href="#download"><span>DOWNLOAD</span></a></div>
                   <span class="section-description">PLUGINS, WIDGETS, SDK</span>
                </div>
                <div id="talk-launcher" class="section-launcher span-2 last box">
                   <div class="section-title"><a href="#talk"><span>TALK</span></a></div>
                   <span class="section-description">ASK, WRITE, CODE, LEARN</span>
                </div>
            </div>
                
            <div class="group">
                <misc:quote />
                <misc:popularwidgets />
                <div class="box span-2 last">
                    <ul id="twittercontent" class="avatar-list group"></ul>
                </div>
            </div>
		</div>
	</div>
    
	<misc:footer />
    
    <misc:jquery />
    <script src="js/menutab.js"></script>
    <script src="js/twitter.js"></script>
	<script>
		$(document).ready(function() {
			$("#twittercontent").performTwitterSearch(1);
		});
	</script>
</body>

</html>