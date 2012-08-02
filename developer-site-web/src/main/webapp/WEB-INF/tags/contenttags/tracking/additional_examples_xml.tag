<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="xml">
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
                                <div data-tab="xml" class="tab">
                                    <div class="api-call">
                                        <p>Request:</p>
                                        <a target="_blank" class="request"
                                           href="http://sporing.bring.no/sporing.xml?q=TESTPACKAGE-EDI"
                                           data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-EDI">
                                            .../sporing.xml?q=TESTPACKAGE-EDI </a>
                                        <p>Response:</p>
                                        <pre class="code-box xml response delay-snippet"></pre>
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
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://sporing.bring.no/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT"
                                       data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT">…/sporing.xml?q=TESTPACKAGE-AT-PICKUPPOINT</a>
                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
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
                           the recipient</p>

                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://sporing.bring.no/sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY"
                                       data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY">…/sporing.xml?q=TESTPACKAGE-LOADED-FOR-DELIVERY</a>
                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>
                        </div>
                    </div>
                </li>

                <li>
                    <a href="#" class="menu-item">Status - delivered
                        <span class="arrow"></span>
                    </a>

                    <div class="content-box">
                        <p>The example below is showing a package that has been delivered to the recipient</p>

                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://sporing.bring.no/sporing.xml?q=TESTPACKAGE-DELIVERED"
                                       data-internal="/proxy/tracking/sporing.xml?q=TESTPACKAGE-DELIVERED">…/sporing.xml?q=TESTPACKAGE-DELIVERED</a>
                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>
                            </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>