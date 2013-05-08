<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




    <title>Validate postal code preview - Bring</title>
    <link rel="stylesheet" type="text/css" href="/css/preview.css" />
</head>
<body>
<link rel="stylesheet" type="text/css" href="/media/widget/validatepostalcode/style.css" /> <!-- Put it in your head -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        var inputField = $('#postnummerInput');
        var outputElement = $('#postnummerResult');

        inputField.keyup(function() {
            if (inputField.val().length == 4) {
                $.getJSON('http://fraktguide.bring.no/fraktguide/api/postalCode.json?pnr='+ inputField.val() +'&callback=?',
                        function(data){
                            if (data.valid) {
                                outputElement.text(data.result);
                            }
                            else {
                                outputElement.text('Invalid postal code');
                            }
                        });
            }
            else {
                outputElement.text('Norwegian postal code');
            }
        });

        inputField.focus();
    });
</script>
<form>
    <input type="text" id="postnummerInput" maxlength="4" />  <span id="postnummerResult">Norwegian postal code</span>
</form>
</body>
</html>