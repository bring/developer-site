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
        
            <div class="group" id="navigation">
                <div id="learn-launcher" class="section-launcher menutab span-2">
                   <div class="section-title"><a href="#learn"><span>LEARN</span></a></div>
                   <span class="section-description">TUTORIALS, EXAMPLES, API REFERENCE</span>
                </div>
                <div id="download-launcher" class="section-launcher span-2 menutab">
                   <div class="section-title"><a href="#download"><span>DOWNLOAD</span></a></div>
                   <span class="section-description">PLUGINS, WIDGETS, SDK</span>
                </div>
                <div id="talk-launcher" class="section-launcher span-2 last menutab">
                   <div class="section-title"><a href="#talk"><span>TALK</span></a></div>
                   <span class="section-description">ASK, WRITE, CODE, LEARN</span>
                </div>
            </div>
            
            <div id="breadcrumbs" class="menubox group">
                <ul class="menulist span-2">
                    <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2">
                    <li><a class="menubutton selected" href="tracking.html">DETAILS</a></li>
                </ul>
                <ul class="menulist span-2 last">
                    <li><a class="menubutton selected" href="tracking.html">INFORMATOIN</a></li>
                </ul>
            </div>
        
            <div id="learn" class="menubox group">
                <ul class="menulist span-2">
                    <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                    <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2">
                <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2 last">
                <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
            </div>
            
            <div id="download" class="menubox group"> </div>
            <div id="talk" class="menubox group"> </div>

            <div class="main-content group">
				<div class="article">
					<h1>STEP-BY-STEP GUIDE TO MANUAL INTEGRATION</h1>
					<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vehicula, lorem ut consequat vulputate, urna enim aliquam dui, vitae semper magna risus venenatis est. Nullam at lectus et lorem venenatis ornare. Vivamus viverra rhoncus elit sit amet rutrum. Quisque hendrerit arcu non purus commodo vel faucibus est facilisis. Cras eget rhoncus sem. Nam ac dolor magna. Maecenas sollicitudin augue quis ligula eleifend commodo. Aenean eget dolor nisl, placerat commodo dolor. In urna ligula, pharetra adipiscing lobortis non, dictum faucibus odio. Nunc et urna volutpat elit ullamcorper lacinia ut eget lorem. Ut eget nisi metus. Donec lobortis, velit semper sollicitudin pharetra, risus nunc ultrices orci, et pellentesque massa arcu varius ligula. Aenean nec diam a quam pulvinar porttitor a in orci. Aliquam erat volutpat. Integer eget nisi sapien, nec dignissim nunc. Pellentesque nec quam nibh, quis adipiscing massa. Fusce metus tellus, molestie consequat sollicitudin sit amet, hendrerit et risus. Curabitur at justo dolor, sit amet fringilla ipsum.
					</p><br/>
					<p>
					Sed aliquet sapien at elit euismod condimentum. Proin adipiscing, lorem in auctor dignissim, arcu risus elementum augue, rutrum hendrerit est eros non libero. Praesent sollicitudin vestibulum posuere. Pellentesque non arcu elit. Pellentesque mollis, quam a tempus pretium, mi urna elementum velit, cursus feugiat ipsum orci nec turpis. Duis non tortor dui, eget porta lectus. Proin elit eros, porttitor vel venenatis id, tempor at lectus. Mauris erat purus, semper at pulvinar quis, bibendum a turpis. Duis vitae velit nulla, a dictum sapien. Integer neque orci, bibendum ut ullamcorper non, laoreet ut metus. Etiam arcu nisi, aliquet eu placerat consectetur, rutrum ut eros. Pellentesque posuere nisi sed odio euismod suscipit.
					</p>
					<br/>
					<p>
					Etiam pulvinar eleifend augue a fermentum. Nulla sit amet turpis nunc, ac adipiscing tellus. In quam quam, auctor et egestas venenatis, porttitor ac orci. Nam iaculis interdum ante, sed pharetra tortor tempor ut. Etiam eget nulla non lorem bibendum facilisis. Quisque ultrices, mi sit amet hendrerit consequat, metus est feugiat justo, at venenatis urna nisi in risus. Cras tincidunt mi nec mi rhoncus euismod. In nec mi a velit pharetra semper in ac lectus. Aliquam dui metus, varius consectetur dictum at, aliquet nec lacus. Aliquam posuere leo cursus sem venenatis euismod vehicula sem fringilla.
					</p>
				</div>
				<div class="talk-content">
					<div class="title">RELATED COMMENTS</div>
                	<ul class="avatar-list group">
				            <!--
							<li class="group">
								<div class="avatar-list-text avatar-list-footer">+View all 6 answers</div>
				            </li>-->
						</ul>
				</div>
            </div>
        </div>

    </div>
    <misc:footer />
	<script>
		$(document).ready(function() {
			$.fn.performTwitterSearch('ul.avatar-list', 3);
		});
	</script>
</body>

</html>