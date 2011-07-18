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
                <div class="navigation-launchers group">
                    <div id="learn-launcher" class="section-launcher menutab span-2">
                       <div class="section-title"><a href="#learn"><span>LEARN</span></a></div>
                       <span class="section-description">TUTORIALS, EXAMPLES, API REFERENCE</span>
                    </div>
                    <div id="download-launcher" class="section-launcher menutab span-2">
                       <div class="section-title"><a href="#download"><span>DOWNLOAD</span></a></div>
                       <span class="section-description">PLUGINS, WIDGETS, SDK</span>
                    </div>
                    <div id="talk-launcher" class="section-launcher menutab span-2 last">
                       <div class="section-title"><a href="#talk"><span>TALK</span></a></div>
                       <span class="section-description">ASK, WRITE, CODE, LEARN</span>
                    </div>
                </div>
     
                <div class="navigation-tabs">
                    <div id="breadcrumbs" class="menubox">
                        <ul class="menulist">
                            <li class="marked">
                                <a class="menubutton" href="#">Tracking beta</a>
                                <ul>
                                    <li class="marked current-page">
                                        <a class="menubutton" href="index.html">Introduction</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    
                    <div id="learn" class="menubox">
                        <ul class="menulist">
                            <li><a class="menubutton" href="/learn/shippingguide/index.html">Shipping guide API</a>
                                <ul>
                                    <li><a class="menubutton" href="#">Shipping Introduction</a>
                                        <ul><li><a class="menubutton" href="index.html">Shipping test</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="marked">
                                <a class="menubutton" href="#">Tracking API beta</a>
                                <ul>
                                    <li class="marked">
                                        <a class="menubutton" href="index.html">Introduction</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="menubutton" href="/learn/postalcodevalidation/index.html">Postal code validate API</a></li>
                            <li><a class="menubutton" href="/learn/postofficechooser/index.html">Post office chooser API</a></li>
                        </ul>
                    </div>
                    
                    <div id="download" class="menubox">
                        <ul class="menulist">
                            <li><a class="menubutton" href="https://github.com/bring/open-java-api">Java client library (github)</a></li>
                        </ul>
                    </div>
                    
                    <misc:talk />
                </div>
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
    <script src="/js/twitter.js"></script>
    <script>
        $(document).ready(function() {
            (function($) {
                $(".marked").each(function() {
                    $(this).addClass("breadcrumb");
                });
                
            	$.fn.menutabext = function() {
                	var State = {
                		BREADCRUMBS: 0,
                		MENU: 1
                	};
                	var state = State.BREADCRUMBS;
                	
                	// Control state
            		this.bind("menutabChanged", function() {
            			state = State.MENU;
            			$(".breadcrumb").each(function() {
            				$(this).addClass("marked");
            			});
            		}).bind("menuDeactivated", function() {
            			$(".marked").each(function() {
            				if (!$(this).hasClass("breadcrumb")) {
            				    $(this).removeClass("marked");
            				}
            			});
            			state = State.BREADCRUMBS;
            		});
            		
                	// Mark / unmark elements on mouse over
                	$(".menulist > li > a, .marked > a").mouseover(function(event) {
                    	switch (state) {
                        	case State.BREADCRUMBS:
                        		break;
                        	case State.MENU:
                        		console.log("sel");
                        		var context = $(this).parent().parent().parent();
                        		$(".marked", context).removeClass("marked");
                        		$(this).parent().addClass("marked");
                        		$(".breadcrumb", $(this).parent()).addClass("marked");
                        		break;
                    	}
                    	event.preventDefault();
                	});
                	
                	// Open page on click
                	$(".menulist a").click(function(event) {
                        switch (state) {
                            case State.BREADCRUMBS:
                                $("#navigation").menutab("tabSelected", "#learn");
                                event.preventDefault();
                                break;
                            case State.MENU:
                            	if ($(this).attr("href") == "#") {
                            		event.preventDefault();
                            	}
                                break;
                        }
                	});
            	};
            })(jQuery);
            
            $("#navigation").menutab("init", {
            	section: "#learn",
                tabs: [ "#learn", "#download", "#talk" ],
            });
            $("#navigation").menutabext();
            
            
            $("#talk").performTwitterSearch(1, function(image, user, text, time){
				$("#twittertalkquote").html(text);
				$("#twittertalkuser").html(user);
				$("#twittertalktime").html(time);
				$("#twittertalkimage").attr("src", image);				
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