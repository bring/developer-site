<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="postalcode" tagdir="/WEB-INF/tags/contenttags/postalcode" %>
<ul class="menu-group collapsing no-shadow">
            <li>
                <a href="#" class="menu-item">Finding the location for postal codes with multiple locations
                    <span class="arrow"></span>
                </a>

                <div class="content-box">
                    <div class="row element-sample">
                        <p>In some countries, such as for example Germany and France, postal codes are non-unique. This
                            means that one postal code might have multiple city names.
                            In these cases the integration APIs (json and xml) will have separate elements containing
                            the list of cities, while the ordinary html response element will remain blank.
                        </p>
                        <div data-tab="xml" class="tab">
                            <div class="api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="https://api.bring.com/shippingguide/api/postalCode.xml?clientUrl=insertYourClientUrlHere&country=DE&amp;pnr=99869"
                                   data-internal="/proxy/shipping-guide/api/postalCode.xml?clientUrl=insertYourClientUrlHere&country=DE&amp;pnr=99869">
                                    /api/postalCode.xml?country=DE&amp;pnr=99869 </a>
                                <p>Response:</p>
                                <pre class="code-box xml response delay-snippet"></pre>
                            </div>
                        </div>
                        <div data-tab="json" class="tab">
                            <div class="api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="https://api.bring.com/shippingguide/api/postalCode.json?clientUrl=insertYourClientUrlHere&country=DE&amp;pnr=99869"
                                   data-internal="/proxy/shipping-guide/api/postalCode.json?clientUrl=insertYourClientUrlHere&country=DE&amp;pnr=99869">
                                    /api/postalCode.json?country=DE&amp;pnr=99869 </a>

                                <p class="right">JSONP Request: <a
                                        href="https://api.bring.com/shippingguide/api/postalCode.json?clientUrl=insertYourClientUrlHere&country=DE&amp;pnr=99869&amp;callbackUrl=functionName">?callback=functionName</a>
                                </p>
                                <p>Response:</p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>
                        <div data-tab="html" class="tab">
                            <div class="api-call">
                                <p>The HTML API will return a <code>span</code> element with <code>id="bringPostnumberQueryResult"</code>,
                                   the postal name as contents and the <code>class</code> either <code>bringPostnumberQueryValidPostnumber</code>
                                   or <code>bringPostnumberQueryInvalidPostnumber</code>.</p><br/>

                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="https://api.bring.com/shippingguide/api/postalCode.html?clientUrl=insertYourClientUrlHere&country=DE&amp;pnr=99869"
                                   data-internal="/proxy/shipping-guide/api/postalCode.html?clientUrl=insertYourClientUrlHere&country=DE&amp;pnr=99869">
                                    /api/postalCode.html?country=DE&amp;pnr=99869 </a>
                                <p>Response:</p>
                                <pre class="code-box html response delay-snippet"></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>