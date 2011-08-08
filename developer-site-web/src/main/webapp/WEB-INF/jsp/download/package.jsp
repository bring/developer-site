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

<body class="page-package">
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
								<a href="#preview" class="widget-tab active">Preview</a>
							</div>
						</div>
					</c:if>
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
					<div class="package-info">
						<div class="package-media">
							<c:forEach var="media" items="${pack.medias}" varStatus="status">
								<c:if test="${empty media.role}">
									<a class="thumb zoom" href="/media/${type}/${pack.handle}/${media.file}">
										<img src="/media/${type}/${pack.handle}/${media.file}" />
									</a>
								</c:if>
							</c:forEach>
						</div>
						<h2>Made by</h2>
						<c:forEach var="person" items="${pack.persons }">
							<div class="person">
								<a href="${person.url}">
									<img class="avatar" src="${person.avatarUrl}" alt="Avatar" />
									<span class="name">${person.name }</span>
									<span class="company">${person.company }</span>
								</a>
							</div>
						</c:forEach>
						<div class="package-tools">
							<c:if test="${!empty pack.download }">
								<a href="${pack.download}" class="download-button">Download</a>
							</c:if>
							<c:if test="${!empty pack.repository }">
								<a href="${pack.repository}" class="repo-button">Repository</a>
							</c:if>
						</div>
						<c:if test="${!empty pack.whoIsUsing}">
							<div class="package-whoisusing">
								<h2>Who is using</h2>
								<ul>
									<c:forEach var="using" items="${pack.whoIsUsing}">
										<a href="${using.url }">${using.title }</a><br/>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</div>
                    <misc:license />
				</div>
				<div class="span-2 last">
					<misc:comments />
				</div>
            </div>
        </div>
    </div>
    
    <misc:footer />
    <misc:jqueryblob />
</body>
</html>