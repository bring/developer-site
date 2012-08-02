<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">




    <title>Display Shipping Guide information using JSONP preview - Bring</title>
    <link rel="stylesheet" type="text/css" href="/css/preview.css" />
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.js"> </script>

<script type="text/javascript">
    $(document).ready(function() {
        var inputField = $('#postnummer');
        var outputElement = $('#textResult');
        inputField.keyup(function() {
            if (inputField.val().length > 3) {
                $.getJSON('http://local.bring.no:8080/fraktguide/products/SERVICEPAKKE/all.json?from=1473&to='+ inputField.val() +'&weightInGrams=3&date=2011-08-17&callback=?',
                        function(data){
                            outputElement.html('<ul><li>...det koste ' + data.Product.Price.PackagePriceWithoutAdditionalServices.AmountWithVAT + ' + mva.</li>' +
                                    ' <li>...transporttid være ' + data.Product.ExpectedDelivery.WorkingDays + ' virkedag(er). </li>' +
                                    ' <li>...pakken være hos mottaker den ' + data.Product.ExpectedDelivery.FormattedExpectedDeliveryDate + ' dersom pakken er levert på terminal innenfor fristen i dag.</li>' +
                                    ' <li>...informasjon om utlevering: ' + data.Product.GuiInformation.DescriptionText + '</li></ul>');
                        });
            } else {
                outputElement.html('');
            }
        });
    });
</script>

<p>
    Dersom du sender en Klimanøytral Servicepakke på 3 kilo <br/>fra Oslo til postnummer <input type="text" id="postnummer" style="width: 3em;" maxlength="4"/> vil... <br/><span id="textResult"></span>
</p>
</body>
</html>