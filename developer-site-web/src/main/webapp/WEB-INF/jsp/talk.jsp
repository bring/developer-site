<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<misc:head />

<body>
    <div class="wrapper">
        <misc:header />
        <div class="main content">
        
            <div class="group">
               <misc:learnlauncher cssClass="menutab span-2"/>
               <misc:downloadlauncher cssClass="menutab span-2" />
               <misc:talklauncher cssClass="menutab menutab-selected span-2" />
            </div>
 
            <div class="menubox group">
                <div class="span-2">
                    <div class="talkbox">
                        <div class="talkbox-header group">
                            <img class="talkbox-image" src="img/face.png" />
                            <span class="talkbox-title">@BRINGAPI</span>
                        </div>
                        <blockquote class="quote">
                            By using Bring APIs we can let our customers choose their preferred
                            shipping method, making it even more convenient to shop with us online.
                        </blockquote>
                        <div class="talkbox-footer">
                            <span>Elton John - CTO</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="main-content group">
				<div class="article">
				</div>
            </div>
        </div>

    </div>
    <misc:footer />
</body>

</html>