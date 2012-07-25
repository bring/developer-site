<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Error codes"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h4>Error codes</h4>
                        <table>
                            <thead>
                            <tr>
                                <th>Error code</th>
                                <th>Description</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td>FG_INPUT_001</td>
                                <td>Shipmentdate must be set</td>
                            </tr>
                            <tr class="even">
                                <td> FG_INPUT_002</td>
                                <td>Error with Postal code</td>
                            </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
                <div class="span3">
                    <div id="sidebar">
                        <misc:sidebar/>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

<script type="text/javascript">
    $.ajax({
        url:"/proxy/booking/api/errors.json",
        cache:false,
        dataType:"json"
    }).done(function (errorCodes) {
                for(var errorCode in errorCodes['errorTypes']){
                    for(var e in errorCode){
                        console.log(e);
                    }
                }
            });
</script>

</body>

</html>