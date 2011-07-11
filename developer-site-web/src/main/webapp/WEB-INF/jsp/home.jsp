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
        
            <div id="menutab">
                <div class="group" id="launchers">
        		    <misc:learnlauncher cssClass="span-2 box" />
                    <misc:downloadlauncher cssClass="span-2 box" />
                    <misc:talklauncher cssClass="span-2 last box" />
                </div>
            </div>
            
            <div id ="menubox" class="menubox group">
                <ul class="menulist span-2">
                    <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2">
                <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2 last">
                <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
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