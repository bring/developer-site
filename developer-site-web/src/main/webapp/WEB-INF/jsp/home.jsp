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
        
            <div class="group">
    		    <misc:learnlauncher cssClass="col-3 box" />
                <misc:downloadlauncher cssClass="col-3 box" />
                <misc:talklauncher cssClass="col-3 box" />
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