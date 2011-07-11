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
               <misc:learnlauncher cssClass="menutab menutab-selected"/>
               <misc:downloadlauncher cssClass="menutab" />
               <misc:talklauncher cssClass="menutab" />
            </div>
 
            <div class="menubox group">
                <ul class="menulist span-2">
                    <li><a class="menubutton selected" href="tracking.html">TRACKING API</a></li>
                </ul>
                <ul class="menulist span-2">
                    <li><a class="selected menubutton" href="#">API REFERENCE</a></li>
                </ul>
            </div>

            <div class="main-content group">
				<div class="article">
					<h1>Tracking - Information for developers</h1>
                    <p>
                        You can link to the tracking so you can see it in the URL to a common tracking. 
                        For example: http://sporing.bring.no/sporing.html?q =...
                    </p>

                    <p>The parameter "q" is the search criterion (baseline, transmit or piece number).</p>

                    <p>
                        If you are looking at the shipper's reference, it is advantageous to filter on 
                        the sender's player number (if available), get more unique hits. This is on the 
                        parameter prosecutor number, eg & prosecutor number = 123
                    </p>
                    
                    <p>
                        If you want over the top menu, you can add the parameter & layout = stand alone in the URL.
                        For example: http://sporing.bring.no/sporing.html?q=...&layout=standalone
                    </p>
                    
                    <p>
                        The latter is suitable for example for use in popup windows. Note that the page width 
                        of the popup window must be greater than or equal to 1024 pixels.
                    </p>
                    
                    <h2>Tracking Link</h2>
                    <h2>Tracking API </h2>
                    <h2>XML</h2>
                    <h2>JSON</h2>
                    <h2>Information</h2>
				</div>
				<div class="talk-content">
					<div class="title">RELATED COMMENTS</div>
                	<ul class="avatar-list group">
				            <li class="group">
				                <img class="avatar" src="img/face.png" />
								<div class="avatar-list-text">
				                    How do I integrate the shipping guide in
									my Neverland giftshop?
				                </div>
				            </li>
				            <li class="group">
                                <img class="avatar" src="img/face.png" />
                                <div class="avatar-list-text">
                                    How do I integrate the shipping guide in
                                    my Neverland giftshop?
                                </div>
                            </li>
                            <li class="group">
                                <img class="avatar" src="img/face.png" />
                                <div class="avatar-list-text">
                                    How do I integrate the shipping guide in
                                    my Neverland giftshop?
                                </div>
                            </li>
							<li class="group">
								<div class="avatar-list-text avatar-list-footer">+View all 6 answers</div>
				            </li>
						</ul>
				</div>
            </div>
        </div>

    </div>
    <misc:footer />
</body>

</html>