<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <misc:contenttype />
    <misc:css />
    <misc:title value="${article.title}" />
</head>

<body class="page-article">
    <div class="wrapper">
        <misc:header />
        
        <div class="main">
            <menutabs:showMenu cssClass="menutab" />
            <div class="content group">
                <div class="article">
                    <h1>${article.title}</h1>
                    ${article.content}
                    <misc:license />
                </div>
                <div class="span-2 last">
                    <misc:getsatisfaction/>
					<misc:comments />
				</div>
            </div>
        </div>
        
    </div>
    
    <misc:footer />
    <misc:jqueryblob />
</body>
</html>