<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

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