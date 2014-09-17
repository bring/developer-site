<%@ page import="org.joda.time.LocalDate" %>
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
        $("#onlyhtml").on('click', function(event) {
            window.open('http://api.bring.com/shippingguide/products.html?clientUrl=insertYourClientUrlHere&from=7600&to=1473&weightInGrams=1000&date=<%=new LocalDate()%>', '','width=1080,height=800');
        });
        $("#onlyxml").on('click', function(event) {
            window.open('http://api.bring.com/shippingguide/products/all.xml?clientUrl=insertYourClientUrlHere&from=7600&to=1473&weightInGrams=1000&date=<%=new LocalDate()%>', '','width=1080,height=800');
        });
        $("#onlycss").on('click', function(event) {
            window.open('http://fraktguide.bring.no/fraktguide/css/fraktalternativer.css', '','width=1080,height=800');
        });
    });
</script>
<div align="center"><button id="onlyhtml">Show me HTML without CSS</button></div>
<br/>
<div align="center"><button id="onlyxml">Show me the same products with XML</button></div>
<br/>
<div align="center"><button id="onlycss">Show me example CSS</button></div>
</body>
</html>