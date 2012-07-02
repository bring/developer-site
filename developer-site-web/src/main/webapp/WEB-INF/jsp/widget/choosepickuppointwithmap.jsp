<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Choose Pickup Point With Map - Bring</title>
</head>
<body>

<h1>Choose pickup point With Map</h1>
<p>This widget uses Bring's Pickup point API to allow the user to choose their preferred post office.
   This is mainly intended for online shopping to allow the user to choose another pickup point than the default to their shipping address.
</p>

<h4>How to install</h4>
<ol>
    <li>This widget depends on jQuery, so please add jQuery to your site first.</li>
    <li>Add the Post Office widget:<br>
        <code>&lt;script type="text/javascript" src="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js"&gt;&lt;/script&gt;</code></li>
    <li>Initialize it<br>
        <code>$("divid").utleveringsenhet();</code></li>
</ol>

<h4>Demo</h4>
<iframe src="http://developer.bring.com/use/widget/choosepickuppointwithmap/preview.html"></iframe>

<h4>Code</h4>
<code><pre>&lt;script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"&gt;&lt;/script&gt;
&lt;script type="text/javascript" src="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript"&gt;
    $(document).ready(function() {
        $('#divid').utleveringsenhet({
             googleMaps: true,
             mapHeight: 400,
             mapWidth: 400
        });
    });
&lt;/script&gt;
&lt;form&gt;
	&lt;div id="divid"&gt;&lt;/div&gt;
&lt;/form&gt;</pre></code>

<h4>Made by</h4>
<ul>
    <li><a href="http://www.bekk.no" target="_blank">Stian Mathiassen</a></li>
    <li><a href="http://www.bekk.no" target="_blank">Nina Volstad</a></li>
</ul>

<a href="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js">Download</a>
</body>
</html>