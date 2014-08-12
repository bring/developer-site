<%@ tag language="java" pageEncoding="UTF-8" %>
<div data-tab="xml">

    <div data-tab="xml json"><h2><a name="additionalExamples"></a>Additional examples</h2></div>

    <div class="row element-sample">
        <ul class="menu-group collapsing no-shadow">

            <li>
                <a href="#" class="menu-item">
                    Verify valid bring customer.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        This request will return false, as 1234 is not a valid customer number.
                        A successful request will only return 'true' in its stead.
                    </p>

                    <div class="">
                        <div class="row element-sample">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://api.bring.com/po/api/v1/purchaseorderCustomer/1234.xml"
                                       data-internal="/proxy/purchaseorder/v1/purchaseorderCustomer/1234.xml">
                                        ../purchaseorderCustomer/1234 </a>
                                    <br><br>

                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <a href="#" class="menu-item">
                    Retrieve a purchaseorder with orderitems.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        This request will return error code PO_STATE_002, which indicates that one needs to be authenticated.
                        However for the purpose of this example, it is a valid request with the exception of missing
                        authorization details, and dummy values for values.
                    </p>

                    <div class="">
                        <div class="row element-sample">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://api.bring.com/po/api/v1/order/1234/1234.xml"
                                       data-internal="/proxy/purchaseorder/v1/order/1234/1234.xml">
                                        ../order/1234/1234.xml </a>
                                    <br><br>

                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </li>


            <li>
                <a href="#" class="menu-item">
                    Create a purchaseorder with orderitems.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                    </p>

                </div>
            </li>

            <li>
                <a href="#" class="menu-item">
                    Retrieve orderitem list belonging to a purchase order.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        This request will return error code PO_STATE_002, which indicates that one needs to be authenticated.
                        However for the purpose of this example, it is a valid request with the exception of missing
                        authorization details, and dummy values for values.
                    </p>

                    <div class="">
                        <div class="row element-sample">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://api.bring.com/po/api/v1/items/1234/1234.xml"
                                       data-internal="/proxy/purchaseorder/v1/items/1234/1234.xml">
                                        ../items/1234/1234.xml </a>
                                    <br><br>

                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <a href="#" class="menu-item">
                    Get packaging list details.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        This request will return error code PO_STATE_002, which indicates that one needs to be authenticated.
                        However for the purpose of this example, it is a valid request with the exception of missing
                        authorization details, and dummy values for values.
                    </p>

                    <div class="">
                        <div class="row element-sample">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://api.bring.com/po/api/v1/transport/1234/1234.xml"
                                       data-internal="/proxy/purchaseorder/v1/transport/1234/1234.xml">
                                        ../transport/1234/1234 </a>
                                    <br><br>

                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <a href="#" class="menu-item">
                    Create a packaginglist.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        <pre>
&lt;CreateTransportOrderRequest xmlns="http://api.bring.com/po"&gt;
    &lt;RequestProperties&gt;
        &lt;SchemaVersion&gt;1&lt;/SchemaVersion&gt;
        &lt;Locale&gt;en&lt;/Locale&gt;
        &lt;DateAndTimes subClass="RequestDate"&gt;2014-07-01T10:00:26.686+02:00&lt;/DateAndTimes&gt;
    &lt;/RequestProperties&gt;
    &lt;CustomerNo&gt;12345&lt;/CustomerNo&gt;
    &lt;PurchaseOrderNo&gt;1234&lt;/PurchaseOrderNo&gt;
    &lt;TransportOrder&gt;
        &lt;ConsignmentId&gt;1353&lt;/ConsignmentId&gt;
        &lt;PackingListSet orderLineId="1"&gt;&lt;/PackingListSet&gt;
    &lt;/TransportOrder&gt;
&lt;/CreateTransportOrderRequest&gt;
                        </pre>
                    </p>


                </div>
            </li>

            <li>
                <a href="#" class="menu-item">
                    Find out if a purchaseorder is open or locked.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        This request will return error code PO_STATE_002, which indicates that one needs to be authenticated.
                        However for the purpose of this example, it is a valid request with the exception of missing
                        authorization details, and dummy values for values.
                    </p>

                    <div class="">
                        <div class="row element-sample">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://api.bring.com/po/api/v1/senderStatus/1234/1234.xml"
                                       data-internal="/proxy/purchaseorder/v1/senderStatus/1234/1234.xml">
                                        ../senderStatus/1234/1234 </a>
                                    <br><br>

                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <a href="#" class="menu-item">
                    Post a TMS Event to Control Tower.
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        <pre class="code-box xml">
&lt;CreateEventRequest xmlns="http://api.bring.com/po"&gt;
    &lt;RequestProperties&gt;
        &lt;SchemaVersion&gt;1&lt;/SchemaVersion&gt;
        &lt;Locale&gt;no&lt;/Locale&gt;
        &lt;DateAndTimes subClass="RequestDate"&gt;2014-07-03T08:03:56.040+02:00&lt;/DateAndTimes&gt;
    &lt;/RequestProperties&gt;
    &lt;Event&gt;
        &lt;ConsignmentId&gt;12345&lt;/ConsignmentId&gt;
        &lt;EventType&gt;{event type}&lt;/EventType&gt;
        &lt;PerformedBy&gt;{some value}&lt;/PerformedBy&gt;
        &lt;Timestamp&gt;2014-07-04T00:00:00+02:00&lt;/Timestamp&gt;
    &lt;/Event&gt;
&lt;/CreateEventRequest&gt;
                    </pre>
                    </p>

                </div>
            </li>

            <li>
                <a href="#" class="menu-item">
                    Retrieve all active error codes for Purchase Order API
                    <span class="arrow"></span>
                </a>

                <div class="content-box">

                    <p>
                        The list is dynamic and contains all error codes that might be returned when using this API.
                    </p>

                    <div class="">
                        <div class="row element-sample">
                            <div data-tab="xml" class="tab">
                                <div class="api-call">
                                    <p>Request:</p>
                                    <a target="_blank" class="request"
                                       href="http://api.bring.com/po/api/v1/errorCodes.xml"
                                       data-internal="/proxy/purchaseorder/v1/errorCodes.xml">
                                        ../errorCodes </a>
                                    <br><br>

                                    <p>Response:</p>
                                    <pre class="code-box xml response delay-snippet"></pre>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>