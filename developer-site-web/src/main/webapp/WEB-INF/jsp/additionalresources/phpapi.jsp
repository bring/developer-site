<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Php API"/>
    <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>PHP API</h1>
                    </div>
                    <div class="box">
                        <p>Most of the existing plugins are developed from a common include file which sends the request to the Shipping Guide API (Fraktguiden). Feel free to be inspired from existing plugins and improve the code if needed.</p>
                        <h2>How to install</h2>
                        <ol>
                            <li>Be inspired from existing plugin code</li>
                            <li>Do what you need, improve the code if needed</li>
                            <li>Add the result to Google Code or GitHub and send us a link, then we will put it here with your name on it... :)</li>
                        </ol>
                    </div>
                    <div class=" box">
                        <h4>Made by</h4>
                        <ul>
                            <li>
                                <a href="http://www.linkedin.com/in/arneunneland" target="_blank">
                                    Arne Unneland
                                </a>
                            </li>
                        </ul>
                        <a href="http://code.google.com/p/fraktpriserzencart/" class="btn" target="_blank">Repository</a>
                    </div>

                </div>
                <div class="span3">
                    <div id="sidebar">
                        <misc:sidebar />
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer_v2 />
<misc:jqueryblob_v2 />

</body>



</html>