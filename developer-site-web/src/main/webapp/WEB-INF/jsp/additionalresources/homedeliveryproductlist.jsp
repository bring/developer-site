<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/> <misc:title value="Home Delivery Product List"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>Home Delivery Product List</h1>
                    </div>

                    <div class="box">
                        <table>
                            <thead>
                            <tr>
                                <th>Product Name</th>
                                <th>Product Code</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Curbside</td>
                                <td>CURBSIDE</td>
                            </tr>
                            <tr>
                                <td>Single Indoor</td>
                                <td>SINGLE_INDOOR</td>
                            </tr>
                            <tr>
                                <td>Double Indoor</td>
                                <td>DOUBLE_INDOOR</td>
                            </tr>
                            <tr>
                                <td>Indoor Light</td>
                                <td>INDOOR_LIGHT</td>
                            </tr>
                            <tr>
                                <td>Curbside Express</td>
                                <td>CURBSIDE_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Single Indoor Express</td>
                                <td>SINGLE_INDOOR_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Double Indoor Express</td>
                                <td>DOUBLE_INDOOR_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Indoor Light Express</td>
                                <td>INDOOR_LIGHT_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Curbside Weekend</td>
                                <td>CURBSIDE_WEEKEND</td>
                            </tr>
                            <tr>
                                <td>Single Indoor Weekend</td>
                                <td>SINGLE_INDOOR_WEEKEND</td>
                            </tr>
                            <tr>
                                <td>Double Indoor Weekend</td>
                                <td>DOUBLE_INDOOR_WEEKEND</td>
                            </tr>
                            <tr>
                                <td>Indoor Light Weekend</td>
                                <td>INDOOR_LIGHT_WEEKEND</td>
                            </tr>
                            <tr>
                                <td>Curbside Weekend Express</td>
                                <td>CURBSIDE_WEEKEND_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Single Indoor Weekend Express</td>
                                <td>SINGLE_INDOOR_WEEKEND_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Double Indoor Weekend Express</td>
                                <td>DOUBLE_INDOOR_WEEKEND_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Indoor Light Weekend Express</td>
                                <td>INDOOR_LIGHT_WEEKEND_EXPRESS</td>
                            </tr>
                            <tr>
                                <td>Return Home Delivery</td>
                                <td>HOME_DELIVERY_RETURN</td>
                            </tr>
                            <tr>
                                <td>Double Indoor (NO)</td>
                                <td>DOUBLE_INDOOR_NO</td>
                            </tr>
                            <tr>
                              <td>Curbside Evening</td>
                              <td>CURBSIDE_EVENING</td>
                            </tr>
                            <tr>
                              <td>Single Indoor Evening</td>
                              <td>SINGLE_INDOOR_EVENING</td>
                            </tr>
                            <tr>
                              <td>Double Indoor Evening</td>
                              <td>DOUBLE_INDOOR_EVENING</td>
                            </tr>
                            <tr>
                              <td>Indoor Light Evening</td>
                              <td>INDOOR_LIGHT_EVENING</td>
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

</body>

</html>