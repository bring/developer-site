<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shippingguide" tagdir="/WEB-INF/tags/contenttags/shippingguide" %>
<div data-tab="json xml">
            <p> The Shipping Guide API supports a number of parameters. Some parameters are mandatory,
                others are optional, but any query to the Shipping Guide API must at least contain the following information:
            </p>
        </div>

        <div data-tab="xml">
            <ul>
                <li><b>Response type:</b> What do you want in your response? Just the price of the shipment, just an estimated
                                          delivery time or all available information? By querying <a
                            href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500"
                            target="_blank"><code>price.xml</code></a> you will only get the price of the shipment, while <a
                            href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.xml?from=7600&amp;to=1407&amp;weightInGrams=1500"
                            target="_blank"><code>expectedDelivery.xml</code></a> will only show you an estimated delivery time.
                                          By querying <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=7600&amp;to=1407&amp;weightInGrams=1500"
                            target="_blank"><code>all.xml</code></a> you will not only get the price and the expected delivery
                                          time, but some additional information such as an indication of which alternative has
                                          the least environmental impact.
                </li>
                <li><b>Origin and destination:</b>What is the origin and destination of the shipment? For domestic shipments in
                                                  Norway postal codes are sufficient, but for international shipments country
                                                  codes must be specified, as well as postal codes (or city for countries that
                                                  are not using postal codes). To specify a postal code such as "0361" add <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=0361&amp;to=0361&amp;weightInGrams=1500"
                            target="_blank"><code>&amp;to=0361</code></a> or <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=0361&amp;to=0361&amp;weightInGrams=1500"
                            target="_blank"><code>from=0361</code></a> to your request. For international shipments use country
                                                  codes (such as DK for Denmark) and add <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=0361&amp;to=2100&amp;weightInGrams=1500&amp;toCountry=DK&amp;product=CARRYON_HOMESHOPPING_NORWAY"
                            target="_blank"><code>&amp;toCountry=DK</code></a> or <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=2100&amp;to=0361&amp;weightInGrams=1500&amp;fromCountry=DK&amp;product=CARRYON_HOMESHOPPING_DENMARK"
                            target="_blank"><code>&amp;fromCountry=DK</code></a> to your request.
                </li>
                <li>
                    <b>Package size:</b> How big is the package? This can either be weight of the package in grams, its
                                         dimensions or volume. A weight of 1500 grams can be specified by <a target="_blank"
                                                                                                             href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500"><code>
                    &amp;weightInGrams=1500</code></a>, dimensions of 30cm x 40cm x 40cm as <a target="_blank"
                                                                                               href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40">
                    <code>&amp;length=30&amp;width=40&amp;height=40</code></a> or volume of 33dm<sup>3</sup> as <a
                        target="_blank"
                        href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;volume=33">
                    <code>&amp;volume=33</code></a> .
                </li>
            </ul>
        </div>

        <div data-tab="json">
            <ul>
                <li><b>Response type:</b> What do you want in your response? Just the price of the shipment, just an estimated
                                          delivery time or all available information? By querying <a
                            href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500"
                            target="_blank"><code>price.json</code></a> you will only get the price of the shipment, while <a
                            href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.json?from=7600&amp;to=1407&amp;weightInGrams=1500"
                            target="_blank"><code>expectedDelivery.json</code></a> will only show you an estimated delivery
                                          time. By querying <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&amp;to=1407&amp;weightInGrams=1500"
                            target="_blank"><code>all.json</code></a> you will not only get the price and the expected delivery
                                          time, but some additional information such as an indication of which alternative has
                                          the least environmental impact.
                </li>
                <li><b>Origin and destination:</b>What is the origin and destination of the shipment? For domestic shipments in
                                                  Norway postal codes are sufficient, but for international shipments country
                                                  codes must be specified, as well as postal codes (or city for countries that
                                                  are not using postal codes). To specify a postal code such as "0361" add <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.json?from=0361&amp;to=0361&amp;weightInGrams=1500"
                            target="_blank"><code>&amp;to=0361</code></a> or <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.json?from=0361&amp;to=0361&amp;weightInGrams=1500"
                            target="_blank"><code>from=0361</code></a> to your request. For international shipments use country
                                                  codes (such as DK for Denmark) and add <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.json?from=0361&amp;to=2100&amp;weightInGrams=1500&amp;toCountry=DK&amp;product=CARRYON_HOMESHOPPING_NORWAY"
                            target="_blank"><code>&amp;toCountry=DK</code></a> or <a
                            href="http://fraktguide.bring.no/fraktguide/products/all.json?from=2100&amp;to=0361&amp;weightInGrams=1500&amp;fromCountry=DK&amp;product=CARRYON_HOMESHOPPING_DENMARK"
                            target="_blank"><code>&amp;fromCountry=DK</code></a> to your request.
                </li>
                <li>
                    <b>Package size:</b> How big is the package? This can either be weight of the package in grams, its
                                         dimensions or volume. A weight of 1500 grams can be specified by <a target="_blank"
                                                                                                             href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500"><code>
                    &amp;weightInGrams=1500</code></a>, dimensions of 30cm x 40cm x 40cm as <a target="_blank"
                                                                                               href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40">
                    <code>&amp;length=30&amp;width=40&amp;height=40</code></a> or volume of 33dm<sup>3</sup> as <a
                        target="_blank"
                        href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;volume=33">
                    <code>&amp;volume=33</code></a> .
                </li>
            </ul>
        </div>

        <div data-tab="xml json">
            <div class="information-box"> Please add the name of the web-shop to the HTTP header "User-Agent" on
                                          each request to the service. If available, the name of the web-shop
                                          owner should also be added to the request. If you have a registered
                                          user at fraktguide.bring.no, please also include XML API's Public ID
                                          parameter in the query. Public ID is your personal Shipping Guide
                                          account id. It is a sequence of alphanumeric characters after the last
                                          dash in your identification. (Please login to see your identification
                                          string). If your Shipping Guide IE is: 372b269a-4f07-4c4e-92b9-<b>460cb92b0767</b>
                                          your pid is <b>460cb92b0767</b>. This makes it possible for us to send
                                          any relevant messages via the registered e-mail address.
            </div>

            <shippingguide:evarsling_notice/>


            <p><b>Example:</b> Here is an example combining some of the parameters covered. The request is for a package with <code>weightInGrams=1500</code>,
                <code>from=7600</code> and <code>to=1407</code>.
            </p>

        </div>

        <div data-tab="json" class="tab api-call">
            <p>Request:</p>
            <a target="_blank" class="request"
               href="http://fraktguide.bring.no/fraktguide/products/all.json?weightInGrams=1500&amp;from=7600&amp;to=1407"
               data-internal="/proxy/shipping-guide/products/all.json?weightInGrams=1500&amp;from=7600&amp;to=1407">
                ../all.json?weightInGrams=1500&amp;from=7600&amp;to=1407 </a>
            <br><br><p>Response:</p>
            <pre class="code-box json response delay-snippet"></pre>
        </div>

        <div data-tab="xml">
            <div class="tab api-call">
                <p>Request:</p>
                <a target="_blank" class="request"
                   href="http://fraktguide.bring.no/fraktguide/products/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407"
                   data-internal="/proxy/shipping-guide/products/all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407">
                    ../all.xml?weightInGrams=1500&amp;from=7600&amp;to=1407 </a>
                <br><br><p>Response:</p>
                <pre class="code-box xml response delay-snippet"></pre>
            </div>

            <p>Please refer to the <a href="../additionalresources/wsdl-xml-schema.html?from=shipping">XML schema</a> for
               information on elements in the response.
            </p>
        </div>

        <div data-tab="xml json">
            <div class="information-box">When using the Shipping Guide, it is important to handle errors gracefully. Your web shop's
                                         users should still be able to order, even if the Shipping Guide returns an error or a
                                         timeout occurs. <a href="../additionalresources/errorhandling.html?from=shipping">Read more
                                                                                                                           about
                                                                                                                           error
                                                                                                                           handling
                                                                                                                           and error
                                                                                                                           codes.</a>
            </div>

            <h4>Products</h4>

            <p>One parameter that can be quite useful is <code>&amp;product</code>. This parameter lets you specify which product
               you want to return information about. Strictly speaking this is an optional parameter, but in some situations you
               will need to specify a product to get a sensible response. For instance if you make a query for an international
               shipment, you will have to specify a product that supports this. Use the <a
                        href="/additionalresources/productlist.html?from=shipping"> the product list</a> to find suitable products.
            </p>

            <p>
                <b>Example:</b> Limit products to only SERVICEPAKKE and PA_DOREN:
            </p>

        </div>


        <div data-tab="xml" class="tab api-call">
            <p>Request:</p>
            <a target="_blank" class="request"
               href="http://fraktguide.bring.no/fraktguide/products/all.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=PA_DOREN"
               data-internal="/proxy/shipping-guide/products/all.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=PA_DOREN">
                ../all.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=PA_DOREN </a>
            <br><br><p>Response:</p>
            <pre class="code-box xml response delay-snippet"></pre>
        </div>

        <div data-tab="json" class="tab api-call">
            <p>Request:</p>
            <a target="_blank" class="request"
               href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=PA_DOREN"
               data-internal="/proxy/shipping-guide/products/all.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=PA_DOREN">
                ../all.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=SERVICEPAKKE&amp;product=PA_DOREN </a>

            <p class="right">JSONP Request: <a
                    href="http://fraktguide.bring.no/fraktguide/products/all.json?from=7600&amp;to=1407&amp;volume=33&amp;date=2011-07-30&amp;product=EKSPRESS09&amp;callbackUrl=functionName">?callback=functionName</a>
            </p>
            <p>Response:</p>
            <pre class="code-box json response delay-snippet"></pre>
        </div>


        <div data-tab="json xml">
            <div class="information-box">Shipping Guide specifies VAT related to senders country. It's up to the client to decide if
                                         VAT is applicable to their situation of sale
            </div>

            <h4>Additional Services</h4>

            <p>There are currently 3 additional services that can be specified using this option:
                <code>additional=postoppkrav</code>, <code>additional=evarsling</code>, or <code>additional=lordagsutkjoring</code>.
               To add multiple services simply chain the parameters.
            </p>

            <p><b>Example:</b> Using all of the following services: "postoppkrav", "evarsling", and "lordagsutkjoring".</p>

        </div>

        <div data-tab="xml" class="tab api-call">
            <p>Request:</p>
            <pre><a target="_blank" class="request"
                    href="http://fraktguide.bring.no/fraktguide/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27&amp;additional=postoppkrav&amp;additional=evarsling&amp;additional=lordagsutkjoring"
                    data-internal="/proxy/shipping-guide/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27&amp;additional=postoppkrav&amp;additional=evarsling&amp;additional=lordagsutkjoring">…/products/price.xml?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27
                &amp;additional=postoppkrav&amp;additional=evarsling
                &amp;additional=lordagsutkjoring</a></pre>
            <p>Response:</p>
            <pre class="code-box xml response delay-snippet">Running request...</pre>
        </div>

        <div data-tab="json" class="tab api-call">
            <p>Request:</p>
            <pre><a target="_blank" class="request"
                    href="http://fraktguide.bring.no/fraktguide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27&amp;additional=postoppkrav&amp;additional=evarsling&amp;additional=lordagsutkjoring"
                    data-internal="/proxy/shipping-guide/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27&amp;additional=postoppkrav&amp;additional=evarsling&amp;additional=lordagsutkjoring">…/products/price.json?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27
                &amp;additional=postoppkrav&amp;additional=evarsling
                &amp;additional=lordagsutkjoring</a></pre>
            <p>Response:</p>
            <pre class="code-box json response delay-snippet">Running request...</pre>
        </div>


        <div data-tab="json xml">
            <p>The Shipping Guide API has a lot of optional parameters not covered in this tutorial, and we recommend that you get
               familiar with the reference table and look at all the additional examples for further study.
            </p>
        </div>