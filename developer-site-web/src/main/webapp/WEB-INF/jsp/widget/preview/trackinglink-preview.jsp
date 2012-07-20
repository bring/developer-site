<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Link to shipment tracking preview - Bring</title>
    <link rel="stylesheet" type="text/css" href="/css/preview.css" />
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#trackinginfo").live('click', function(event) {
            window.open('http://beta.posten.no/sporing/sporing.html?q=TESTPACKAGE-DELIVERED&layout=standalone', '','width=1080,height=800');
        });
    });
</script>
<center><button id="trackinginfo">Show me the tracking</button></center>
</body>
</html>