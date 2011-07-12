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
        
            <div id="menutabs">
                <div class="group" id="launchers">
                    <div class="section-launcher span-2 box">
                       <div class="section-title"><a href="#menutabs-1"><span>LEARN</span></a></div>
                       <span class="section-description">TUTORIALS, EXAMPLES, API REFERENCE</span>
                    </div>
                    <div class="section-launcher span-2 box">
                       <div class="section-title"><a href="#menutabs-2"><span>DOWNLOAD</span></a></div>
                       <span class="section-description">PLUGINS, WIDGETS, SDK</span>
                    </div>
                    <div class="section-launcher span-2 last box">
                       <div class="section-title"><a href="#menutabs-3"><span>TALK</span></a></div>
                       <span class="section-description">ASK, WRITE, CODE, LEARN</span>
                    </div>
                </div>
                
                <div id="menutabs-1" class="menubox group">
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
                
                <div id="menutabs-2" class="menubox group">
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
                
                <div id="menutabs-3"></div>
            </div>
            
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