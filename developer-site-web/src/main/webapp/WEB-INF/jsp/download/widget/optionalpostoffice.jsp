<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html>
<html>

<head>
    <misc:contenttype />
    <misc:title value="Tracking" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/lib.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/downloadmenu.css" />
    <link rel="stylesheet" type="text/css" href="/css/widget.css" />
    <link rel="stylesheet" type="text/css" href="/css/jquery.snippet.css" />


</head>

<body>
    <div class="wrapper">
        <misc:header />
        <div class="main">
			<menutabs:showMenu cssClass="menutab" />
	        
			<div class="content group">
				<div class="widget-content">
					<div class="widgetpreview">
						<div data-tab="code" class="tab codetab">
							<pre class="html" data-highlightlines="2,5-7">
&lt;script src="http://code.jquery.com/jquery-latest.js"&gt;&lt;/script&gt;
&lt;script src="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.0.js"&gt;&lt;/script&gt;

&lt;script type="text/javascript"&gt;
   $(document).ready(function() {
      console.debug("hello");
      console.debug($("#targetDiv"));
      console.debug($("body"));
      $("#targetDiv").css({
          "padding" : "20px",
          "background-color" : "red"
      });
      $("#targetDiv").utleveringsenhet();
   });
&lt;/script&gt;

&lt;div id="targetDiv"&gt;loading...&lt;/div&gt;
</pre>
							</div>
							<div data-tab="preview" class="tab previewtab">
                                <!-- Widget is inputed here -->
							</div>
							<div class="widget-tabs">
								<a href="#code" class="widget-tab">Code</a>
								<a href="#preview" class="widget-tab active">Widget Preview</a>
							</div>
					</div>
					<div class="widgetinfo">
						<div class="widgetarticle">
							<h1>Optional Post office</h1>
							<p>Optional post office is a service that allows an end user can choose to pick up their package at another post office / post office than the local. This can be done directly from the online store's image for the choice of shipping.</p>
							<h2>How to install</h2>
							<p>...</p>
							<h2>More information</h2>
							<p>...</p>
						</div>
						<div class="widget-tools">
							<h2>Tools</h2>
							<a href="#" class="download-button">Download</a> 
						</div>
					</div>
				</div>
				<misc:socialfeed />
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jqueryblob />
    <script type="text/javascript" src="/js/jquery.snippet.js"></script>
    <script type="text/javascript" src="/js/syntaxhighligther.js"></script>
    <script type="text/javascript" src="/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/js/codetabs.js"></script>
	<script type="text/javascript" src="/js/navigation/downloadmenu-hider.js"></script>
    <script>
        $(document).ready(function() {
	
			var navElement = $("#navigation");
            navElement.menu();
			navElement.downloadmenuHider();
		    navElement.menutab({defaultTab: 1});
	
						
            $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){
                return '<li class="group"><img class="avatar" src="' + 
                image + '"/><div class="avatar-list-text"><div class="question-title">' +
                user + '</div><div class="question-text"><blockquote>' + 
                text + '</blockquote></div>' + '<div class="datetime">' + 
                time + '</div></div></li>';
            });
		    
            // Dynamic widget generation from code example
            var widgetSource = $($(".widgetpreview .codetab pre.sh_sourceCode:not(.snippet-formatted)")[0]).text();
            console.debug(widgetSource);
            var previewTab = $(".widgetpreview .previewtab");
            /*console.debug($("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body"));*/
            $("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body").html(widgetSource);
        });
    </script>
</body>

</html>