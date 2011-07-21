<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="menutabs" tagdir="/WEB-INF/tags/menutabs"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype />
    <misc:title value="Tracking" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/lib.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/css/jquery.snippet.css" />
</head>

<body>
    <div class="wrapper">
        <misc:header />
        <div class="main">
            <menutabs:showMenu cssClass="menutab" level1="Shipping guide API" level2="API Reference" />
            <div class="content group">
                <div class="article">
                    <h1>API Reference</h1>
                    
                    <c:forEach items="${document.parameters}" var="myElement" >
                        <h2>${myElement.title}</h2>
                        
                        ${myElement.description}
                        
                        <c:if test="${!empty myElement.default}">
                            <p>Default: <code>${myElement.default}</code></p>
                        </c:if>
                        
                        <div class="codetabs">
                            <c:forEach items="${myElement.examples}" var="example">
                                <h3><a href="#${example.type}">${example.title}</a></h3>
                                <div data-tab="${example.type}" class="tab">
                                    <c:if test="${!empty example.request}">
                                        <p>
                                            Request:
                                            <a class="request" href="${document.requestBase}${example.request}">
                                                ${example.request}
                                            </a>
                                        </p>
                                        <pre class="${example.type}"></pre>
                                    </c:if>
                                    <c:if test="${!empty example.content}">
                                        ${example.content}
                                    </c:if>
                               </div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <misc:footer />
    
    <misc:jqueryblob />
    <script type="text/javascript" src="/js/jquery.snippet.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {

            // Navigation
            var sectionId = "#learn";
            $("#navigation").menutab("init", {
                section: sectionId,
                tabs: [ "#learn", "#download", "#talk" ],
            });
            $("#navigation").menu({
                section: sectionId,
                breadcrumbs: [2, 1]
            });
            
            // Twitter
            $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){
                return '<li class="group"><img class="avatar" src="' + 
                image + '"/><div class="avatar-list-text"><div class="question-title">' +
                user + '</div><div class="question-text"><blockquote>' + 
                text + '</blockquote></div>' + '<div class="datetime">' + 
                time + '</div></div></li>';
            });
            
            
            // Syntax highlighter
            $(".article pre").each(function(index, item) {
                var lang = $(item).attr("class");
                
                var langMap = {
                     json : "javascript",
                     webservice : "c#"
                };
                
                for(fromLang in langMap) {
                    if(langMap.hasOwnProperty(fromLang) && fromLang === lang) {
                        lang = langMap[fromLang];
                        break;
                    }
                }
                
                if(lang) {
                    $(item).snippet(lang, {
                        style: "ide-eclipse"
                    });
                }
            });
            
            // Tabs
            var codetabs = $(".codetabs");
            
            codetabs.each(function(i, tabscontanier) {
                
                $(".tab", tabscontanier).each(function(i, tab) {
                    $(tabscontanier).append($(tab));
                    
                    var tabName = $(tab).attr("data-tab");
                    $(tab).data("tab-name", tabName);
                    
                    var triggers = $("a[href$=#" + tabName + "]", tabscontanier) ;
                    $(triggers).each(function(i, trigger) {
                        $(trigger).click(function(e) {
                            e.preventDefault();
                            var openTabName = $(trigger).attr("href").substring(1);
//                             tabscontanier.showTab(openTabName);
                            codetabs.showTab(openTabName);
                        });
                    });
                    
                    $(tab).data("tab-triggers", triggers);
                });
            });
            
            codetabs.showTab = function(tabName) {
                $(codetabs).each(function(i, tabscontainer) {
                    tabscontainer.showTab(tabName);
                });
            };
            
            
            // Add tab functinoality to tabscontainer
            codetabs.each(function(i, tabscontainer) {
                tabscontainer.showTab = function(tabName) {
                    if(!tabName) return;
                    //var tab = $("*[data-tab="+tabName+"]", tabscontainer);
                    var tabs = $(".tab", tabscontainer);
                    $(tabs).each(function(i, tab) {
                        var curTabName = $(tab).data("tab-name");
                        if(tabName === curTabName) {
                            $(tab).show();
                            $(tab).data("tab-triggers").addClass("active");
                        }
                        else {
                            $(tab).hide();
                            $(tab).data("tab-triggers").removeClass("active");
                        }
                        
                        // TODO: triggers
                    });
                };
            });
            
            // Show the correct tab on init
            codetabs.showTab("java");
            /*codetabs.each(function(i, tabscontainer) {
                var firstTab = $($(".tab:first", tabscontainer));
                console.debug(firstTab.data("tab-name"));
                tabscontainer.showTab(firstTab.data("tab-name"));
            });*/
            
        });
    </script>
</body>

</html>