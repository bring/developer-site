<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="requestUrl" required="true" type="java.lang.String" rtexprvalue="true" %>

<c:out value="${requestUrl}" />

<div class="codetabs">

    <h3><a href="#xml">XML</a></h3>
    <div data-tab="xml" class="tab">

        <div class="api-call">
            Request:
            <pre><a target="_blank" class="request" href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml" data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.xml">…/api/pickuppoint/postalcode/1407.xml</a></pre>

            Response:
            <pre class="xml response delay-snippet">Running request...</pre>
        </div>


    </div>

    <h3><a href="#json">JSON</a></h3>
    <div data-tab="json" class="tab">

        <div class="api-call">
            Request:
            <pre><a target="_blank" class="request" href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json" data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.json">…/api/pickuppoint/postalcode/1407.json</a></pre>

            <p class="right">JSONP request:
                <a target="_blank" href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?callbackUrl=functionName">
                    <code>?callback=functionName</code>
                </a>
            </p>

            Response:
            <pre class="json response delay-snippet">Running request...</pre>
        </div>


    </div>

</div>