<ul class="menu-group collapsing no-shadow">
        <li>
            <a href="#" class="menu-item">Find pickup points containing a specified string
                <span class="arrow"></span>
            </a>

            <div class="content-box">
                <p>If you want to return only the pickup points matching a specified string, you may add <code>?searchForText=&lt;text
                    to match&gt;</code> to the request. The string in the <code>&lt;text to match&gt;</code> can be the
                    name of the pickup point, its address, city, county, municipality or location. Partial matches are
                    also allowed.

                <div class="row element-sample">
                    <h4>Example: FIND THE PICKUP POINTS NEAR POSTAL CODE 1407 CONTAINING &quot;KIWI&quot;.</h4>
                    <div class="codetabs">
                        <div data-tab="xml" class="tab">
                            <div class="api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml?searchForText=KIWI"
                                   data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.xml?searchForText=KIWI">
                                    /api/pickuppoint/postalcode/1407.xml?searchForText=KIWI </a>
                                <p>Response:</p>
                                <pre class="code-box xml response delay-snippet"></pre>
                            </div>
                        </div>
                    </div>
            </div>
                        <div class="codetabs">
                            <div data-tab="json" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?searchForText=KIWI"
                                       data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.json?searchForText=KIWI">
                                        /api/pickuppoint/postalcode/1407.json?searchForText=KIWI </a>

                                    <p class="right">JSONP Request: <a
                                            href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?searchForText=KIWI&amp;callbackUrl=functionName">?callback=functionName</a>
                                    </p>
                                    <p>Response:</p>
                                    <pre class="code-box json response delay-snippet"></pre>
                                </div>
                            </div>

                        </div>
                    </div>
        </li>
        <li>
            <a href="#" class="menu-item">Find pickup points open on specified days
                <span class="arrow"></span>
            </a>

            <div class="content-box">

                <p>If you want to return only the pickup points open on specified days, you may add <code>?openingHoursSearchType=&lt;day&gt;</code>to
                    the request. <code>&lt;day&gt; = ALL_WEEKDAYS (default) | MONDAY | TUESDAY | WEDNESDAY | THURSDAY |
                        FRIDAY | SATURDAY | SUNDAY</code> If you want you can also add openOnOrBefore and / or
                    openOnOrAfter, to limit the search even more. </p>

                <div class="row element-sample">

                    <h4>Example: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON SUNDAYS.</h4>

                        <div class="codetabs">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml?openingHoursSearchType=SUNDAY"
                                       data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.xml?openingHoursSearchType=SUNDAY">
                                        /api/pickuppoint/postalcode/1407.xml?openingHoursSearchType=SUNDAY </a>
                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>
                            </div>

                            <div data-tab="json" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?openingHoursSearchType=SUNDAY"
                                       data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.json?openingHoursSearchType=SUNDAY">
                                        /api/pickuppoint/postalcode/1407.json?openingHoursSearchType=SUNDAY </a>

                                    <p class="right">JSONP Request: <a
                                            href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?openingHoursSearchType=SUNDAY&amp;callbackUrl=functionName">?callback=functionName</a>
                                    </p>
                                    <p>Response:</p>
                                    <pre class="code-box json response delay-snippet"></pre>
                                </div>
                            </div>

                        </div>
                </div>
            </div>
        </li>
        <li>
            <a href="#" class="menu-item">Find pickup points open at specific hours
                <span class="arrow"></span>
            </a>

            <div class="content-box">
                <p>If you want to return only the pickup points open on specific hours, you may add <code>?openOnOrBefore=&lt;time&gt;</code>
                    and/or <code>?openOnOrAfter=&lt;time&gt;</code> to the request. <code>&lt;time&gt; = HHMM</code>
                </p>

                <div class="row element-sample">

                    <h4>Example: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR BEFORE 08.00</h4>

                        <div class="codetabs">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml?openOnOrBefore=0800"
                                       data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.xml?openOnOrBefore=0800">
                                        /api/pickuppoint/postalcode/1407.xml?openOnOrBefore=0800 </a>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>
                            </div>
                        </div>

                    <div class="codetabs">
                        <div data-tab="json" class="tab">
                            <div class="api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?openOnOrBefore=0800"
                                   data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.json?openOnOrBefore=0800">
                                    /api/pickuppoint/postalcode/1407.json?openOnOrBefore=0800 </a>

                                <p class="right">JSONP Request: <a
                                        href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?openOnOrBefore=0800&amp;callbackUrl=functionName">?callback=functionName</a>
                                </p>
                                <p>Response:</p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="row element-sample">

                    <h4>Example: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR AFTER 22.00</h4>


                        <div class="codetabs">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml?openOnOrAfter=2200"
                                       data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.xml?openOnOrAfter=2200">
                                        /api/pickuppoint/postalcode/1407.xml?openOnOrAfter=2200 </a>
                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>
                            </div>

                        </div>

                    <div class="codetabs">
                        <div data-tab="json" class="tab">
                            <div class="api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?openOnOrAfter=2200"
                                   data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.json?openOnOrAfter=2200">
                                    /api/pickuppoint/postalcode/1407.json?openOnOrAfter=2200 </a>

                                <p class="right">JSONP Request: <a
                                        href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?openOnOrAfter=2200&amp;callbackUrl=functionName">?callback=functionName</a>
                                </p>
                                <p>Response:</p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </li>
    </ul>