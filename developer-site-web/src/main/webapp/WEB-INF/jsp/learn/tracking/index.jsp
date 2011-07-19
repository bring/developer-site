<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:title value="Tracking" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/lib.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
</head>

<body>
    <div class="wrapper">
    
        <misc:header />
        
        <div class="main">
        
            <div id="navigation">
                <misc:launchers cssClass="menutab" />
                <misc:menutab section="#learn" breadcrumbs="2.1" />
            </div>

            <div class="content group">
                <misc:tracking />
                <misc:socialfeed />
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jquery />
    <script src="/js/jquery.actual.js"></script>
    <script src="/js/jquery.ba-outside-events.js"></script>
    <script src="/js/menutab.js"></script>
    <script src="/js/menu.js"></script>
    <script src="/js/twitter.js"></script>
    <script>
        $(document).ready(function() {
            $("#navigation").menutab("init", {
            	section: "#learn",
                tabs: [ "#learn", "#download", "#talk" ],
            });
            $("#navigation").menu({
                breadcrumbs: [2, 1]
            });
            
            $("#talk").performTwitterSearch(1, function(image, user, text, time){
				return '<div class="talkbox dropdown-menu">' + 
							'<div class="talkbox-header group">' +
								'<a href="http://twitter.com/bringapi">@bringapi</a>' + 
			        		'</div>' + 
			        		'<pre class="quote"><blockquote id="twittertalkquote">' + text + '</blockquote></pre>' + 
			        		'<div class="talkbox-footer">' + 
			            		'<img id="twittertalkimage" class="talkbox-image" src="' + image + '" />' + 
			                	'<span id="twittertalkuser" class="user">' + user + '</span><span id="twittertalktime" class="time">' + time + '</span>' + 
			        		'</div>' + 
			    		'</div>';	
            });
            
            $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){
				return '<li class="group"><img class="avatar" src="' + 
				image + '"/><div class="avatar-list-text"><div class="question-title">' +
				user + '</div><div class="question-text"><pre>' + 
				text + '</pre></div>' + '<div class="datetime">' + 
				time + '</div></div></li>';
			});
     });
    </script>
</body>

</html>