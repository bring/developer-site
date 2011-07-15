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
				<div class="article">
					<h1>Tracking - Information for developers</h1>
					<h2>Tracking Link</h2>
                    <p>
                        Links to tracking can be the same as the URL of a normal tracking request. 
                        E.g.: <br/> <code>http://sporing.bring.no/sporing.html?q=...</code>
                    </p>

                    <p>The parameter "q" is the query string (reference, shipment or package number).</p>
                    
                    <p>
                        If the query string is a sender's reference, then it's recommended to filter on the sender's 
                        id ("aktørnummer"), <br/> if available. Then the results will be unique for that sender. 
                        This is done with the parameter aktornummer, e.g. <code>&aktornummer=123.</code>
                    </p>
                    
                    <p>
                        For results without the top menu, add the following request parameter: &layout=standalone<br />
                        E.g.: <code>http://sporing.bring.no/sporing.html?q=...&layout=standalone</code>
                    </p>
                    
                    <p>
                        The latter is suited for e.g. popup windows. Please note that the width of the popup window 
                        should be equal to or greater than 1024 pixels.
                    </p>
                    
                    <h2>Tracking API</h2>
                    
                    <p>This information is only relevant for system developers.</p>
                    
                    <h3>XML</h3>
                    
					<form action="http://sporing.bring.no/sporing.xml" method="get">
                   		<p>Reference/Shipment/Package Number: 
						<input type="text" name="q"/> 
						<input type="submit" value="Show XML"/></p>						
					</form>
                    
					<p><a href="http://sporing.bring.no/sporing.xsd">XML Schema definisjon</a></p>
                    
                    <h3>JSON</h3>
                    
					<p>The JSON data format is well suited for showing data directly in the web browser. 
						For more JSON examples, check out 
						<a href="http://fraktguide.bring.no/fraktguide/forDevelopersEnglish.do">
							JSON in Bring Fraktguide</a>.
					</p>
                                        
					<form action="http://sporing.bring.no/sporing.json" method="get">
						<p>Reference/Shipment/Package Number: 
						<input type="text" name="q"/> 
						<input type="submit" value="Show JSON"/></p>
					</form>
                    
					<form action="http://sporing.bring.no/sporing.json" method="get">
						<p>Reference/Shipment/Package Number:
                        <input type="hidden" name="callback" value="myCallback" /> 
						<input type="text" name="q"/>
						<input type="submit" value="Show JSONP"/></p>
					</form>
                    
					<h3>Information</h3>
                    
					<p>The Track &amp; Trace API is in <strong>BETA</strong> status. 
						It may be changed without notice. Please note the 
						<a href="http://fraktguide.bring.no/fraktguide/vilkaar.do">
							user agreement at Bring Fraktguide
						</a> (in Norwegian).
					</p>
                    
					<p>For an example you may look at the solution for 
						<a href="http://sporing.bring.no/multikolli.html">
							tracing several packages simultaneously
						</a>. 
						This page makes use of the JSON interface (with jQuery).
					</p>
                    
					<p>Refer to <a href="http://fraktguide.bring.no">Bring Fraktguide</a> 
						for an API from Bring that allows you to calculate prices, time estimations, 
						product information and environmental information (and more). 
						You can get finished rendered HTML, XML API (RESTful), 
						JSON or use our Web Service.
					</p>
                    
					<p><a href="http://twitter.com/bringapi">Follow the development team at twitter</a>.
						 Developers may use <a href="http://getsatisfaction.com/bring">our community at Get
						Satisfaction for <b>technical</b> feedback regarding the API</a>. 
						Please give us a hint if you making use of the API.
					</p>
				</div>
                <misc:socialfeed />
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jquery />
    <script src="/js/jquery.actual.js"></script>
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
               return '<div class="talkbox dropdown-menu">' + 
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