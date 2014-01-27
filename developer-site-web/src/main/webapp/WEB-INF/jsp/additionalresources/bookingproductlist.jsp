<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="availableProducts" tagdir="/WEB-INF/tags/contenttags/booking/availableProducts" %>

<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/> <misc:title value="Booking product list"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>
    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>Booking product list</h1>
                    </div>
                    <div class="box">
                       <div class="available-products">
                           <availableProducts:available_products/>
                           <div data-tab="json" class="tab">
                               <div class="api-call">
                                   <a target="_blank" class="request"
                                      href="https://api.bring.com/booking/api/specialistsWithProducts.json"
                                      data-internal="/proxy/booking/api/specialistsWithProducts.json">
                                   </a>
                                   <pre class="code-box json response delay-snippet hidden"></pre>
                               </div>
                           </div>
                       </div>
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