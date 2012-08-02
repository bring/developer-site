<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product selection as HTML preview - Bring</title>
    <link rel="stylesheet" type="text/css" href="/css/preview.css" />
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#onlyhtml").live('click', function(event) {
            window.open('http://local.bring.no:8080/fraktguide/products.html?from=7600&to=1473&weightInGrams=1000&date=2009-02-26', '','width=1080,height=800');
        });
        $("#onlyxml").live('click', function(event) {
            window.open('http://local.bring.no:8080/fraktguide/products/all.xml?from=7600&to=1473&weightInGrams=1000&date=2009-02-26', '','width=1080,height=800');
        });
        $("#onlycss").live('click', function(event) {
            window.open('http://local.bring.no:8080/fraktguide/css/fraktalternativer.css', '','width=1080,height=800');
        });
    });
</script>
<center><button id="onlyhtml">Show me HTML without CSS</button></center>
<br/>
<center><button id="onlyxml">Show me the same products with XML</button></center>
<br/>
<center><button id="onlycss">Show me example CSS</button></center>
</body>
</html>