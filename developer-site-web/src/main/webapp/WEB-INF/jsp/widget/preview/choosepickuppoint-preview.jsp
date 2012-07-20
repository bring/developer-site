<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Choose pickup point preview - Bring</title>
    <link rel="stylesheet" type="text/css" href="/css/preview.css"/>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#divid').utleveringsenhet();
    });
</script>
<form>
    <div id="divid"></div>
</form>
</body>
</html>