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
					<h2>Tracking Link</h2>
                    <p>
                        Links to tracking can be the same as the URL of a normal tracking request. 
                        E.g.: http://sporing.bring.no/sporing.html?q=...
                    </p>

                    <p>The parameter "q" is the query string (reference, shipment or package number).</p>
                    <br/>
                    <p>
                        If the query string is a sender's reference, then it's recommended to filter on the sender's id ("aktørnummer"), if available. 
                        Then the results will be unique for that sender. This is done with the parameter aktornummer, e.g. &aktornummer=123.
                    </p>
                    <br/>
                    <p>
                        For results without the top menu, add the following request prameter: &layout=standalone
                        E.g.: http://sporing.bring.no/sporing.html?q=...&layout=standalone
                    </p>
                    <br/>
                    <p>
                        The latter is suited for e.g. popup windows. Please note that the width of the popup window should be equal to or greater than 1024 pixels.
                    </p>
                    
                    <h2>XML</h2>

                    <h2>JSON</h2>
                    <h2>Information</h2>

					<ul>
						<li>test</li>
						<li>test</li>
						<li>test</li>
						<li>test</li>
						<li>test</li>
					</ul>
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