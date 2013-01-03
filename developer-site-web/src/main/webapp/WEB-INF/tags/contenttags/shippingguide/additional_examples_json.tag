<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="json">

  <div data-tab="xml json"><h2><a name="additionalExamples"></a>Additional examples</h2></div>

  <div class="row element-sample">
  <ul class="menu-group collapsing no-shadow">

  <li>
    <a href="#" class="menu-item"> Multiple parcels in one query <span class="arrow"></span> </a>

    <div class="content-box">

        <div>
            <p>It is also possible to combine weight, volume and dimensions for multiple parcels. Multiple parcels are
               specified by suffixing weightInGrams, volume or dimensions (length, width or height), with sequential
               numbers from 0.
            </p>
        </div>
        <p>The data used in this example is:</p>
        <ul>
            <li><code>from=7041</code></li>
            <li><code>to=0558</code></li>
        </ul>

        <p>Parcels:</p>
        <ol>
            <li><code>weightInGrams0=1500</code></li>
            <li><code>volume1=33</code></li>
            <li><code>length2=10&amp;width2=20 &amp;height2=30</code></li>
        </ol>

        <div class="">
            <div class="row element-sample">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7041&amp;to=0558&amp;weightInGrams0=1500&amp;volume1=33&amp;length2=10&amp;width2=20&amp;height2=30"
                           data-internal="/proxy/shipping-guide/products/all.json?from=7041&amp;to=0558&amp;weightInGrams0=1500&amp;volume1=33&amp;length2=10&amp;width2=20&amp;height2=30">
                            ../all.json?from=7041&amp;to=0558&amp;weightInGrams0=1500&amp;volume1=33&amp;length2=10&amp;width2=20&amp;height2=30 </a>

                        <p class="right">JSONP Request: <a href="#">?callback=functionName</a></p>

                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>
            </div>
        </div>
    </div>
</li>

<li>
    <a href="#" class="menu-item">International shipments <span class="arrow"></span></a>

    <div class="content-box">
        <div>
            <p>Specified using <code>fromCountry=NO&amp;toCountry=DK</code>.</p>

            <p><a href="http://www.iso.org/iso/iso-3166-1_decoding_table.html">Country Codes are ISO-3166-1-alpha-2</a>
            </p>

        </div>
        <div class="">
            <div class="tab-content tab-minimal">

                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.json?from=2100&amp;to=2100&amp;fromCountry=NO&amp;toCountry=DK&amp;product=CARRYON_HOMESHOPPING_NORWAY"
                           data-internal="/proxy/shipping-guide/products/expectedDelivery.json?from=2100&amp;to=2100&amp;fromCountry=NO&amp;toCountry=DK&amp;product=CARRYON_HOMESHOPPING_NORWAY">
                            ../products/expectedDelivery.json?from=2100&amp;to=2100&amp;fromCountry=NO&amp;toCountry=DK&amp;product=CARRYON_HOMESHOPPING_NORWAY </a>

                        <p class="right">JSONP Request: <a
                                href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.json?from=2100&amp;to=2100&amp;fromCountry=NO&amp;toCountry=DK&amp;product=CARRYON_HOMESHOPPING_NORWAY&amp;callbackUrl=functionName">?callback=functionName</a>
                        </p>
                        <br>

                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>
            </div>
        </div>
    </div>
</li>

<li>
    <a href="#" class="menu-item">International shipments to countries without postal codes <span class="arrow"></span>
    </a>

    <div class="content-box">

        <div>
            <p>In the example below, a parcel is sent from Norway to Dublin, Ireland. The parameters are:</p>
            <ul>
                <li><code>?fromCountry=NO</code></li>
                <li><code>&amp;toCountry=IE</code></li>
                <li><code>&amp;to=0</code></li>
                <li><code>&amp;toCity=Dublin</code></li>
            </ul>

            <p>To see both the expected delivery time and the price, we've added:</p>
            <ul>
                <li><code>&amp;weightInGrams=300</code>, and</li>
                <li><code>all.json</code></li>
            </ul>
        </div>

        <div class="">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/all.json?fromCountry=NO&amp;toCountry=IE&amp;from=7600&amp;to=0&amp;toCity=Dublin&amp;product=CARRYON_HOMESHOPPING_NORWAY&amp;weightInGrams=300"
                           data-internal="/proxy/shipping-guide/products/all.json?fromCountry=NO&amp;toCountry=IE&amp;from=7600&amp;to=0&amp;toCity=Dublin&amp;product=CARRYON_HOMESHOPPING_NORWAY&amp;weightInGrams=300">
<pre>../products/all.json?fromCountry=NO&amp;toCountry=IE
                   &amp;from=7600&amp;to=0&amp;toCity=Dublin
                   &amp;product=CARRYON_HOMESHOPPING_NORWAY&amp;weightInGrams=300</pre>
                        </a>

                        <p class="right">JSONP Request: <a href="#">?callback=functionName</a></p>
                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>
            </div>
    </div>
</li>

<li>
    <a href="#" class="menu-item">Three ways to specify a package size <span class="arrow"></span> </a>

    <div class="content-box">

        <div><h4>Weight in grams</h4></div>
        <div>
            <p>Specified using <code>weightInGrams=1500</code>.</p>

        </div>
        <div class="">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500"
                           data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500">
                            ../products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500</a> <br> <br>

                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>

            </div>
        </div>

        <div><h4>Package dimentions</h4></div>
        <div>
            <p>Specified using <code>length=30&amp;width=40&amp;height=40</code>.</p>

        </div>
        <div class="">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40"
                           data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40">
                            ../products/price.json?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40</a>

                        <p class="right">JSONP Request: <a
                                href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40&amp;callbackUrl=functionName">?callback=functionName</a>
                        </p>

                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>
        </div>

        <div><h4>Volume</h4>

            <p>Instead of, or in addition to using the package's weight and dimensions you can specify volume. This is
               relevant for non-rectangular hexahedron shaped packages, and depending on the volume, it could affect the
               set of available products. The unit is dm3.
            </p>
        </div>
        <div>
            <p>Specified using <code>volume=33</code>.</p>

        </div>
        <div class="">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;volume=33"
                           data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;volume=33">
                            ../products/price.json?from=7600&amp;to=1407&amp;volume=33</a>

                        <p class="right">JSONP Request: <a
                                href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;volume=33&amp;callbackUrl=functionName">?callback=functionName</a>
                        </p>

                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>
        </div>
    </div>
</li>

<li>
    <a href="#" class="menu-item"> Get the expected delivery date <span class="arrow"></span></a>

    <div class="content-box">

        <div>
            <p>Specifies the date the package is delivered to Bring. The parameter is used to calculate the expected
               delivery date.
            </p>

            <p>Specified using <code>date=2009-02-03</code>.</p>

            <p>Accepted date format: <code>YYYY-MM-DD</code>.</p>

            <p>If this parameter is specified, the response will include expected delivery date, in addition to expected
               number of working days.
            </p>
        </div>

        <div class="">
                <div class="row element-sample">
                    <div data-tab="json" class="tab">
                        <div class="api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-07-30&amp;product=EKSPRESS09"
                               data-internal="/proxy/shipping-guide/products/all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-07-30&amp;product=EKSPRESS09">
                                <pre>../products/all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-07-30&amp;product=EKSPRESS09</pre>
                            </a>

                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>

                    </div>

                </div>

        </div>
    </div>
</li>

<li>
    <a href="#" class="menu-item"> Specify the pickup time from the departure point <span class="arrow"></span> </a>

    <div class="content-box">

        <div>
            <p>Use this parameter if you would like to specify when during the day the package needs to be picked up
               from the departure point.
            </p>

            <p>This parameter is only considered for courier and express products.</p>

            <p>Specified using <code>date=2011-07-28&amp;time=13:37</code> (date and time is required to use this
               option).
            </p>

            <p>Accepted format is <code>hh:mm</code>. (AM and PM not allowed, please use 24-hour clock.)</p>
        </div>

        <div class="">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-08-30&amp;time=13:37"
                           data-internal="/proxy/shipping-guide/products/all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-08-30&amp;time=13:37">
                            <pre>../all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-08-30&amp;time=13:37</pre>
                        </a>

                        <p class="right">JSONP Request: <a
                                href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-08-30&amp;time=13:37&amp;callbackUrl=functionName">?callback=functionName</a>
                        </p>
                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>
        </div>

    </div>

</li>

<li>
    <a href="#" class="menu-item"> Specify whether or not the shipment has been pre-registered (EDI) <span
            class="arrow"></span> </a>

    <div class="content-box">

        <div>
            <p>Specify whether or not the shipment has been pre-registered (EDI).</p>

            <p>Specified using <code>edi=false</code>.</p>

            <p>This will affect response prices and might affect which products are available.</p>

            <p>Default: <code>true</code></p>
        </div>

        <div class="">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;edi=false"
                           data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;edi=false">
                            <pre>../price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;edi=false</pre>
                        </a>

                        <p class="right">JSONP Request: <a
                                href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;edi=false&amp;callbackUrl=functionName">?callback=functionName</a>
                        </p>
                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
                </div>
        </div>

    </div>

</li>

<li>
    <a href="#" class="menu-item"> Specify if the package was shipped from a post office <span class="arrow"></span>
    </a>

    <div class="content-box">

        <div>
            <p>The response data may vary depending on whether or not Bring must collect the shipment, or if the
               customer delivers the shipment from a post office.
            </p>

            <p>This parameter specifies whether or not the package is delivered to a post office before shipping</p>

            <p>Specified using <code>postingAtPostOffice=true</code></p>

            <p>Default: <code>false</code></p>
        </div>

        <div class="">
                <div data-tab="json" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;postingAtPostoffice=true&amp;product=SERVICEPAKKE"
                           data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;postingAtPostoffice=true&amp;product=SERVICEPAKKE">
                            <pre>../price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;postingAtPostoffice=true&amp;product=SERVICEPAKKE</pre>
                        </a>

                        <p class="right">JSONP Request: <a
                                href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;edi=false&amp;callbackUrl=functionName">?callback=functionName</a>
                        </p>
                        <p>Response:</p>
                        <pre class="code-box json response delay-snippet"></pre>
                    </div>
            </div>
        </div>

    </div>

</li>

<li>
    <a href="#" class="menu-item">Adjust prices <span class="arrow"></span></a>

    <div class="content-box">
        <div class="row element-sample">

            <p>The Shipping Guide provides adjustment of prices shown. This service is available both in JSON and in the
                <a href="../widget/productselectionashtml.html?from=shipping">Product selection as HTML"-widget.</a>
            </p>

            <p>To adjust the price, add <a
                    href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;priceAdjustment=m20p">
                &amp;priceAdjustment=m20p</a> to the query.
            </p>

            <p>The parameter is built up in the form [produktkode_][o]10[p]. Parts of the parameter with square brackets
               ( [] ) is optional.
            </p>

            <p>Explanation of the parameters follows:</p>
            <ul>
                <li>
                    <p>produktkode_ used if price adjustments are only made for a single product. Example: <a
                            href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;priceAdjustment=SERVICEPAKKE_m20">
                        &amp;priceAdjustment=SERVICEPAKKE_m20</a> lowers the price on product Servicepakke with NOK 20.
                    </p>
                </li>

                <li>
                    <p>o specifies the operation to be performed. Operations supported are 'p' for positive, 'm' for
                       negative or blank for a fixed price adjustment. Examples:
                    </p>
                    <ul>
                        <li>
                            <a href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;priceAdjustment=m20">
                                &amp;priceAdjustment=m20</a> deducts NOK 20 on all products.
                        </li>
                        <li>
                            <a href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;priceAdjustment=p20">
                                &amp;priceAdjustment=p20</a> adds NOK 20 to all products.
                        </li>
                        <li>
                            <a href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;priceAdjustment=SERVICEPAKKE_79">
                                &amp;priceAdjustment=SERVICEPAKKE_79</a> puts a fixed price on Servicepakke on NOK 79.
                        </li>

                    </ul>
                </li>

                <li>10 indicate the factor to be used in the price adjustment. This number can be a fixed amount or
                    percentage to be added/subtracted, or a fixed price to be added/subtracted depending on other
                    parameters.
                </li>
                <li>p indicate that the operation should be done as a percentage calculation. Note that this is only
                    valid for operations doing additions and subtractions (not fixed prices).
                </li>
            </ul>

            <p>Though <b>not recommended</b>, it is possible to make overlapping queries. If there is a need to do
               multiple simultaneous price adjustments, it should be done on a product-by-product basis using the
               product code prefix.
            </p>

            <p><b>Example:</b> set fixed price of NOK 79 for Servicepakke and deduct 20% on Bedriftspakke Ekspress Over
                               natten 09.
            </p>

            <div class="">
                    <div data-tab="json" class="tab">
                        <div class="api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=EKSPRESS09&amp;priceAdjustment=SERVICEPAKKE_79&amp;priceAdjustment=EKSPRESS09_m20p"
                               data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=EKSPRESS09&amp;priceAdjustment=SERVICEPAKKE_79&amp;priceAdjustment=EKSPRESS09_m20p">
                                   <pre>.../price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE
             &amp;product=EKSPRESS09
             &amp;priceAdjustment=SERVICEPAKKE_79
             &amp;priceAdjustment=EKSPRESS09_m20p</pre>
                            </a>

                            <p class="right">JSONP Request: <a
                                    href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=EKSPRESS09&amp;priceAdjustment=SERVICEPAKKE_79&amp;priceAdjustment=EKSPRESS09_m20p&amp;callbackUrl=functionName">
                                ?callback=functionName </a></p>
                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                </div>
            </div>

        </div>

    </div>

</li>

  </ul>
  </div>
</div>