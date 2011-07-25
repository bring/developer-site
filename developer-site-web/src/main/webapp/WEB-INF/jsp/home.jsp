<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:title value="Home" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/lib.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/showcase.css" />
    <link rel="stylesheet" type="text/css" href="/css/downloadmenu.css" />
</head>

<body>
	<div class="wrapper">
	    <misc:header />
	    
	    <div class="main group">
            <misc:showcase />
            
            <menutabs:showMenu cssClass="box" />
            
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
    
    <misc:jqueryblob />
    <script type="text/javascript" src="/js/navigation/menutab-hider.js"></script>
    <script>
        $(document).ready(function() {
            var navElement = $("#navigation");
            navElement.menu();
            navElement.menutab({hidden: true});
            navElement.menutabHider();
            
            $("#twittercontent").performTwitterSearch(1, function(image, user, text, time){
                return '<li class="group"><img class="avatar" src="' + 
                image + '"/><div class="avatar-list-text"><div class="question-title">' +
                user + '</div><div class="question-text"><blockquote class="twittercontent">' + 
                text + '</blockquote></div>' + '<div class="datetime">' + 
                time + '</div></div></li>';
            });
        });
    </script>
</body>

</html>