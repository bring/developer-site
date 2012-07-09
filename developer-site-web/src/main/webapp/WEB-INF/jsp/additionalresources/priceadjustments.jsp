<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Price adjustments"/>
    <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>Price adjustments</h1>
                    </div>
                    <div class="box">
                    <p>To adjust the price, add <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=m20p">&priceAdjustment=m20p</a> to the query.</p>
                    <br>
                    <div>The parameter is built up in the form [produktkode_][o]10[p]. Parts of the parameter whit square brackets ( [] ) is optional. <br><br>Explanation of the parameters follows:
                    <ul>
                        <li><p>produktkode_ used if price adjustments are only made for a single product. Example: <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=SERVICEPAKKE_m20">&priceAdjustment=SERVICEPAKKE_m20</a> lowers the price on product Servicepakke with NOK 20.</p></li>

                        <li><p>o specifies the operation to be performed. Operations supported are 'p' for positive, 'm' for negative or blank for a fixed price adjustment. Examples:</p>
                        <ul>
                       <li><a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=m20">&priceAdjustment=m20</a> deducts NOK 20 on all products.</li>
                            <li><a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=p20">&priceAdjustment=p20</a> adds NOK 20 to all products.</li>
                            <li><a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&priceAdjustment=SERVICEPAKKE_79">&priceAdjustment=SERVICEPAKKE_79</a> puts a fixed price on Servicepakke on NOK 79.</li>

                        </ul>
                        </li>

                        <li>10 indicate the factor to be used in the price adjustment. This number can be a fixed amount or percentage to be added/subtracted, or a fixed price to be added/subtracted depending on other parameters.</li>
                        <li>p indicate that the operation should be done as a percentage calculation. Note that this is only valid for operations doing additions and subtractions (not fixed prices).</li>
                    </ul>
                    </div>

                        <div><p>Though <b>not recommended</b>, it is possible to make overlapping queries. If there is a need to do multiple simultaneous price adjustments, it should be done on a product-by-product basis using the product code prefix.</p>
                            Example: <a href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&to=1407&weightInGrams=1500&product=SERVICEPAKKE&product=EKSPRESS09&priceAdjustment=SERVICEPAKKE_79&priceAdjustment=EKSPRESS09_m20p">&priceAdjustment=SERVICEPAKKE_79 &priceAdjustment=EKSPRESS09_m20p</a> set fixed price of NOK 79 for Servicepakke and deduct 20% on Bedriftspakke Ekspress Over natten 09.
                        </div>


                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<misc:footer />
<misc:jqueryblob_v2 />

</body>



</html>