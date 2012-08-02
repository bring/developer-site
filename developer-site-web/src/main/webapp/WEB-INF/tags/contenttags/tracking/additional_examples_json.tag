<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="json">
        <div class="row element-sample">
            <ul class="menu-group collapsing no-shadow">

                <li>
                    <a href="#" class="menu-item">Status - notification received
                        <span class="arrow"></span>
                    </a>

                    <div class="content-box" style="display: none;">

                        <p>The example below is showing a package that have been EDI notified, but is not received by
                           Bring</p>

                        <div class="row element-sample">
                                <div data-tab="json" class="tab">
                                    <div class="api-call">
                                        <p>Request:</p>
                                        <a target="_blank" class="request"
                                           href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-EDI"
                                           data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-EDI">
                                            .../sporing.json?q=TESTPACKAGE-EDI </a>

                                        <p class="right">JSONP Request: <a
                                                href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-EDI&amp;callbackUrl=functionName">?callback=functionName</a>
                                        </p>
                                        <p>Response:</p>
                                        <pre class="code-box json response delay-snippet"></pre>
                                    </div>
                                </div>
                        </div>
                    </div>
                </li>

                <li>
                    <a href="#" class="menu-item">Status - waiting at pickup point
                        <span class="arrow"></span>
                    </a>

                    <div class="content-box">
                        <p>The example below is showing a package waiting for the recipient to collect it at a pickup
                           point</p>
                            <div data-tab="json" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT"
                                       data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT">…/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT</a>

                                    <p class="right">JSONP Request: <a
                                            href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-AT-PICKUPPOINT&amp;callbackUrl=functionName">?callback=functionName</a>
                                    </p>
                                    <p>Response:</p>
                                    <pre class="code-box json response delay-snippet"></pre>
                                </div>
                            </div>
                    </div>
                </li>

                <li>
                    <a href="#" class="menu-item">Status - loaded for delivery
                        <span class="arrow"></span>
                    </a>

                    <div class="content-box">
                        <p>The example below is showing a package that has been loaded on a distribution car for delivery to
                           the reciepient</p>

                                <div data-tab="json" class="tab">
                                    <div class="api-call">
                                        <p>Request:</p>
                                        <a target="_blank" class="request"
                                           href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY"
                                           data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY">…/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY</a>

                                        <p class="right">JSONP Request: <a
                                                href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-LOADED-FOR-DELIVERY&amp;callbackUrl=functionName">?callback=functionName</a>
                                        </p>
                                        <p>Response:</p>
                                        <pre class="code-box json response delay-snippet"></pre>
                                    </div>
                                </div>
                    </div>
                </li>

                <li>
                    <a href="#" class="menu-item">Status - delivered
                        <span class="arrow"></span>
                    </a>

                    <div class="content-box">
                        <p>The example below is showing a package that has been delivered to the reciepient</p>

                                <div data-tab="json" class="tab">
                                    <div class="api-call">
                                        <p>Request:</p>
                                        <a target="_blank" class="request"
                                           href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-DELIVERED"
                                           data-internal="/proxy/tracking/sporing.json?q=TESTPACKAGE-DELIVERED">…/sporing.json?q=TESTPACKAGE-DELIVERED</a>

                                        <p class="right">JSONP Request: <a
                                                href="http://sporing.bring.no/sporing.json?q=TESTPACKAGE-DELIVERED&amp;callbackUrl=functionName">?callback=functionName</a>
                                        </p>
                                        <p>Response:</p>
                                        <pre class="code-box json response delay-snippet"></pre>
                                    </div>
                                </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>