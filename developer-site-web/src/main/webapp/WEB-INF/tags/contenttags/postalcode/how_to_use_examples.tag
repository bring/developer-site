<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="postalcode" tagdir="/WEB-INF/tags/contenttags/postalcode" %>
<h4><p>Example: Look up city using postal code and country code</p></h4>

            <div data-tab="xml" class="tab">
                <div class="api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://fraktguide.bring.no/fraktguide/api/postalCode.xml?country=no&amp;pnr=1337"
                       data-internal="/proxy/shipping-guide/api/postalCode.xml?country=no&amp;pnr=1337">
                        /api/postalCode.xml?country=no&amp;pnr=1337 </a>
                    <p>Response:</p>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>
            <div data-tab="json" class="tab">
                <div class="api-call">
                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://fraktguide.bring.no/fraktguide/api/postalCode.json?country=no&amp;pnr=1337"
                       data-internal="/proxy/shipping-guide/api/postalCode.json?country=no&amp;pnr=1337">
                        /api/postalCode.json?country=no&amp;pnr=1337 </a>

                    <p class="right">JSONP Request: <a
                            href="http://fraktguide.bring.no/fraktguide/api/postalCode.json?country=no&amp;pnr=1337&amp;callbackUrl=functionName">?callback=functionName</a>
                    </p>
                    <p>Response:</p>
                    <pre class="code-box json response delay-snippet"></pre>
                </div>
            </div>
            <div data-tab="html" class="tab">
                <div class="api-call">
                    <p>The HTML API will return a <code>span</code> element with <code>id="bringPostnumberQueryResult"</code>,
                       with the city as contents.</p><br/>

                    <p>Request:</p>
                    <a target="_blank" class="request"
                       href="http://fraktguide.bring.no/fraktguide/api/postalCode.html?country=no&amp;pnr=1337"
                       data-internal="/proxy/shipping-guide/api/postalCode.html?country=no&amp;pnr=1337">
                        /api/postalCode.html?country=no&amp;pnr=1337 </a>
                    <p>Response:</p>
                    <pre class="code-box html response delay-snippet"></pre>
                </div>
            </div>