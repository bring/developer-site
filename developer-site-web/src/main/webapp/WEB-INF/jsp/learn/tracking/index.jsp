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
                                <a class="menubutton" href="index.html">Tracking beta</a>
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
                                    <li><a class="menubutton" href="index.html">Shipping Introduction</a>
                                        <ul><li><a class="menubutton" href="index.html">Shipping test</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="marked">
                                <a class="menubutton" href="index.html">Tracking API beta</a>
                                <ul>
                                    <li class="marked">
                                        <a class="menubutton" href="index.html">Introduction</a>
                                        <ul>
                                            <li class="marked"><a class="menubutton" href="index.html">Test</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="menubutton" href="/learn/postalcodevalidation/index.html">Postal code validate API</a></li>
                            <li><a class="menubutton" href="/learn/postofficechooser/index.html">Post office chooser API</a></li>
                        </ul>
                    </div>
                    
                    <div id="download" class="menubox">
                        <ul class="menulist">
                            <li><a class="menubutton" href="https://github.com/bring/open-java-api">Java client library</a></li>
                        </ul>
                    </div>
                    
                    <misc:talk />
                </div>
            </div>

            <div class="content group">
                <misc:shippingguide />
                <misc:socialfeed />
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jquery />
    <script src="/js/menutab.js"></script>
    <script src="/js/twitter.js"></script>
    <script>
        $(document).ready(function() {
            $("#navigation").menutab("init", {
            	section: "#learn",
                tabs: [ "#learn", "#download", "#talk" ],
            });
            
            /*
            $("#learn > ul > li > a").mouseover(function (event) {
                $("#learn li.marked").each(function(i,element) {
                	$(element).removeClass("marked");
                });
                $(this).parent().addClass("marked");
                console.log($(this).parent());
                event.preventDefault();
            });
            
            $("#breadcrumbs > ul > li > a").click(function (event) {
                console.log("eating bread 1");
                $("#navigation").menutab("tabSelected", "#learn");
                event.preventDefault();
            });
            */
            $("#talk").performTwitterSearch(1, function(image, user, text, time){
               return '<div class="talkbox">' + 
							'<div class="talkbox-header group">' +
								'<img class="talkbox-image" src="' + image + '"/>' + 
								'<span class="talkbox-title">' + 
									'<a href="http://twitter.com/bringapi">@bringapi</a>' +
								'</span>' +
							'</div>' +
							'<blockquote class="quote">' + text + '</blockquote>' +
							'<div class="talkbox-footer">' +
								'<span>' +  user + ' ' + time + '</span>' +
							'</div>' +
						'</div>';
            });
            /*
            $("#breadcrumbs > ul > li > a").mouseover(function (event) {
            	console.log("bread 1");
            	event.preventDefault();
            });
            
            $("#breadcrumbs > ul > li > ul > li > a").mouseover(function (event) {
                console.log("bread 2");
                event.preventDefault();
            });
            
            $("#breadcrumbs > ul > li > ul > li > a > ul > li > a").mouseover(function (event) {
                console.log("bread 3");
                event.preventDefault();
            });
            */
            
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