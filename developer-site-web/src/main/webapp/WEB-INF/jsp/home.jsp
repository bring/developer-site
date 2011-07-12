<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<misc:head />

<body>
	<div class="wrapper">
	    <misc:header />
	    
	    <div class="main content group">
            <misc:showcase />
        
            <div class="group" id="launchers">
                <div id="launchers-1" class="section-launcher span-2 box">
                   <div class="section-title"><a href="#"><span>LEARN</span></a></div>
                   <span class="section-description">TUTORIALS, EXAMPLES, API REFERENCE</span>
                </div>
                <div id="launchers-2" class="section-launcher span-2 box">
                   <div class="section-title"><a href="#"><span>DOWNLOAD</span></a></div>
                   <span class="section-description">PLUGINS, WIDGETS, SDK</span>
                </div>
                <div id="launchers-3" class="section-launcher span-2 last box">
                   <div class="section-title"><a href="#"><span>TALK</span></a></div>
                   <span class="section-description">ASK, WRITE, CODE, LEARN</span>
                </div>                
            </div>
            
            <div id="menubox-learn" class="menubox group">
                <ul class="menulist span-2">
                    <li><a class="menubutton" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2">
                <li><a class="menubutton" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2 last">
                <li><a class="menubutton" href="tracking.html">TRACKING API</a></li>
                </ul>
            </div>
            
            <div id="menubox-download" class="menubox group">
               <ul class="menulist span-2">
                    <li><a class="menubutton" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2">
                <li><a class="menubutton" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2 last">
                <li><a class="menubutton" href="tracking.html">TRACKING API</a></li>
                </ul>
            </div>
            
            <div id="menubox-talk"></div>
            
            <div class="group">
                <misc:quote />
                <misc:popularwidgets />
                <misc:questions />
            </div>
		</div>
	</div>
	<misc:footer />
</body>

</html>