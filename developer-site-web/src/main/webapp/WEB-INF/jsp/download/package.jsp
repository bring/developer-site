<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<misc:title value="${pack.title}" />
	<misc:css />
</head>
<body>
	<div class="wrapper">
        <misc:header />
        <div class="main">
			<menutabs:showMenu cssClass="menutab" />
			<div class="content group">
				<div class="package-content">
					<c:if test="${!empty pack.previewCode}">
						<div class="widgetpreview">
							<div data-tab="code" class="tab codetab">
								<pre class="html" data-highlightlines="${pack.previewCode.highlightLines}"><c:out value="${pack.previewCode.content }"></c:out></pre>
							</div>
							<div data-tab="preview" class="tab previewtab">
                                <iframe class="preview-frame" src="/download/widget/${pack.handle}/preview.html" height="${pack.previewCode.height}"></iframe>
							</div>
							<div class="widget-tabs">
								<a href="#code" class="widget-tab">Code</a>
								<a href="#preview" class="widget-tab active">Widget Preview</a>
							</div>
						</div>
					</c:if>
					<div class="package-info">
						<div class="package-description">
							<h1>${pack.title}</h1>
							${pack.description}
							
							<h2>How to install</h2>
							<c:if test="${!empty pack.installSteps.steps}">
								<ol class="installsteps">
									<c:forEach var="step" items="${pack.installSteps.steps}">
										<li>${step}</li>
									</c:forEach>
								</ol>
							</c:if>
						</div>
						<div class="widget-tools">
							<c:if test="${!empty pack.download }">
								<a href="${pack.download}" class="download-button">Download</a>
							</c:if>
							<c:if test="${!empty pack.repository }">
								<a href="${pack.repository}" class="repo-button">Repository</a>
							</c:if>
						</div>
					</div>
				</div>
				<misc:socialfeed />
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jqueryblob />
    <script type="text/javascript" src="/js/lib/jquery.snippet.js"></script>
    <script type="text/javascript" src="/js/lib/jquery.cookie.js"></script>
    <script type="text/javascript" src="/js/syntaxhighligther.js"></script>
    <script type="text/javascript" src="/js/codetabs.js"></script>
	<script type="text/javascript" src="/js/navigation/downloadmenu-hider.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
	
			var navElement = $("#navigation");
            navElement.menu();
			navElement.downloadmenuHider();
		    navElement.menutab({defaultTab: 1});   
						
			$(".widgetpreview").codetabs({
				defaultTab : "preview"
			});			
						
            $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){
                return '<li class="group"><img class="avatar" src="' + 
                image + '"/><div class="avatar-list-text"><div class="question-title">' +
                user + '</div><div class="question-text"><blockquote>' + 
                text + '</blockquote></div>' + '<div class="datetime">' + 
                time + '</div></div></li>';
            });
		    
            // Dynamic widget generation from code example
            var widgetSource = $($(".widgetpreview .codetab pre.sh_sourceCode:not(.snippet-formatted)")[0]).text();
            //console.debug(widgetSource);
            var previewTab = $(".widgetpreview .previewtab");
            /*console.debug($("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body"));*/
            //$("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body").html(widgetSource);
        });
    </script>
</body>
</html>