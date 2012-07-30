<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/> <misc:title value="Pickup Point API"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

<misc:header_v2 selected_tab="developer"/>

<div id="page">
<section id="content">
<div class="row-fluid">

<div class="span9">

<div class="box">
    <h1>Pickup Point API</h1>

</div>

<%--Introduction--%>
<div class="box">
    <h2><a name="introduction"></a>Introduction</h2>

    <p>The Pickup point API provides a list of the alternative locations for package pickup. Based on a specified postal
        code or a geographical location, the 10 nearest pickup points are returned. Response is available as either XML
        or JSON.</p>

    <p>A pickup point is defined as any location delivering shipments on behalf of Bring and Posten, such as post
        offices and selected grocery stores.</p>
</div>


<div class="multitabs">

<ul class="tab-group">
    <li><a href="#xml" data-tab="xml">XML</a></li>
    <li><a href="#json" data-tab="json">JSON</a></li>
</ul>

<%--Reference table--%>
<div class="box">

    <h2><a name="reference"></a>Reference</h2>

    <pre class="code-box">Request prefix:
http://fraktguide.bring.no/fraktguide/api/pickuppoint</pre>

    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>/postalcode/&lt;postalcode&gt;.&lt;extension&gt;</code></td>
            <td>Returns the 10 nearest pickup points based on the given postalcode.
                <ul>
                    <li><code>&lt;postalcode&gt;</code> = any valid postal code</li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr >
            <td><code>/location/&lt;latitude&gt;/&lt;longitude&gt;.&lt;extension&gt;</code></td>
            <td>Returns the 10 nearest pickup points based on the given location.
                <ul>
                    <li>
                        <code>&lt;latitude&gt;</code> = geographic coordinate specifying the north-south position.
                    </li>
                    <li><code>&lt;longitude&gt;</code> = geographic coordinate specifying the east-west position.
                    </li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/id/&lt;id&gt;.&lt;extension&gt;</code></td>
            <td>Returns information about the pickup point based on the pickup point's id.
                <ul>
                    <li>
                        <code>&lt;id&gt;</code> = The pickup point's id.
                    </li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>

    <table>
        <thead>
        <tr>
            <th>Optional filter</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>?searchForText=&lt;text&gt;</code></td>
            <td>Return only pickup points containing the specified text.
                <ul>
                    <li><code>&lt;text&gt;</code> = name, address, city, municipality name, county name or location
                    </li>
                </ul>
            </td>
        </tr>
        <tr >
            <td><code>?openingHoursSearchType=&lt;day&gt;</code></td>
            <td>Return only pickup points that are open on the specified day.
                <ul>
                    <li><code>&lt;day&gt;</code> = ALL_WEEKDAYS | MONDAY | TUESDAY | WEDNESDAY | THURSDAY | FRIDAY |
                                                 SATURDAY | SUNDAY
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?openOnOrBefore=&lt;time&gt;</code></td>
            <td>Return only pickup points that are open on or before the specified time.
                <ul>
                    <li><code>&lt;time&gt;</code> = format: HHMM</li>
                </ul>
            </td>
        </tr>
        <tr >
            <td><code>?openOnOrAfter=&lt;time&gt;</code></td>
            <td>Return only pickup points that are open on or before the specified time.
                <ul>
                    <li><code>&lt;time&gt;</code> = format: HHMM</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>




   </br><hr></br>
    <h2><a name="HTU"></a>How to Use</h2>
    <p>First you have to choose whether you want to use a postal code or geographical coordinates to find the 10 nearest
       delivery locations. The following examples illustrate the different alternatives. </p>

  <div data-tab="xml">
      <div class="row element-sample">

          <h4>Example: USING THE POSTAL CODE</h4>

          <p>Find pickup points based on the recipient's postal code, 1407 Vinterbro. </p>

          <div class="lightBorder">
              <div class="codetabs">

                  <ul class="tab-group minimal" data-tabs="tabs">
                      <li><a href="#xml"></a></li>
                  </ul>

                  <div data-tab="xml" class="tab">
                      <div class="api-call">
                          <p>Request:</p>
                          <a target="_blank" class="request"
                             href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.xml"
                             data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.xml">
                              /api/pickuppoint/postalcode/1407.xml </a>
                          <p>Response:</p>
                          <pre class="code-box xml response delay-snippet"></pre>

                      </div>
                  </div>

              </div>
          </div>

      </div>
  </div>
  <div data-tab="json">
      <div class="row element-sample">

          <h4>Example: USING THE POSTAL CODE</h4>

          <p>Find pickup points based on the recipient's postal code, 1407 Vinterbro. </p>

          <div class="lightBorder">
              <div class="codetabs">

                  <ul class="tab-group minimal" data-tabs="tabs">
                      <li><a href="#json"></a></li>
                  </ul>

                  <div data-tab="json" class="tab">
                      <div class="api-call">
                          <p>Request:</p>
                          <a target="_blank" class="request"
                             href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json"
                             data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.json">
                              /api/pickuppoint/postalcode/1407.json </a>

                          <p class="right">JSONP Request: <a
                                  href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/postalcode/1407.json?callbackUrl=functionName">?callback=functionName</a>
                          </p>
                          <p>Response:</p>
                          <pre class="code-box json response delay-snippet"></pre>

                      </div>
                  </div>

              </div>
          </div>

      </div>

  </div>


    <h4>Example: USING GEOGRAPHICAL COORDINATES</h4>

    <p>Find pickup points based on the recipient's geographical coordinates, Bergen city (60.395226, 5.321725) </p>

    <div data-tab="xml">
        <div class="row element-sample">
            <div class="lightBorder">
                <div class="codetabs">
                    <ul class="tab-group minimal" data-tabs="tabs">
                        <li><a href="#xml"></a></li>
                    </ul>
                    <div data-tab="xml" class="tab">
                        <div class="api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/location/60.395226/5.321725.xml"
                               data-internal="/proxy/shipping-guide/api/pickuppoint/location/60.395226/5.321725.xml">
                                /api/pickuppoint/location/60.395226/5.321725.xml </a>
                            <p>Response:</p>
                            <pre class="code-box xml response delay-snippet"></pre>

                        </div>
                    </div>
                </div>
            </div>
            </div>
    </div>
    <div data-tab="json">
        <div class="row element-sample">
            <div class="lightBorder">
                <div class="codetabs">
                    <ul class="tab-group minimal" data-tabs="tabs">
                        <li><a href="#json"></a></li>
                    </ul>
                    <div data-tab="json" class="tab">
                        <div class="api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/location/60.395226/5.321725.json"
                               data-internal="/proxy/shipping-guide/api/pickuppoint/location/60.395226/5.321725.json">
                                /api/pickuppoint/location/60.395226/5.321725.json </a>

                            <p class="right">JSONP Request: <a
                                    href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/location/60.395226/5.321725.json?callbackUrl=functionName">?callback=functionName</a>
                            </p>
                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>

                        </div>
                    </div>
                    </div>
                </div>
            </div>
    </div>

    <h3>Using filters</h3>In addition to postal code or location, one or more optional parameters can be added to
                          the request. These parameters can be perceived as &amp;filters&amp;, adding additional restrictions to the
                          pickup points being returned. One such parameter is <code>searchForText=&lt;texts&gt;</code>, resulting in a
                          response where all pickup points have at least a partial match with the search string given in &lt;texts&gt;.
                          This can be the name of the pickup point, its address, city, county, municipality or location. Go to the
                          reference table or see additional examples for more information</p>

    <div class="information-box">
        <b>Note! </b>If you want to add more than one parameter at the end of a request, separate the subsequent
                     parameters using <code>&amp;</code>. For instance: <code>/api/pickuppoint/postalcode/1407.xml?searchForText=Kiwi<b>
        &amp;</b>openOnOrBefore=0800</code>
    </div>

    <h3>Using the pickup point's id</h3>

    <p>If you already know the id of the pickup point, you can retrieve more information such as the geographical
       location, opening hours and county.</p>

    <h4>Example: USING ID TO RETRIEVE INFORMATION ABOUT A PICKUP POINT</h4>

    <p>Retrieve more information about the pickup point based on its id, 121110 </p>


        <div data-tab="xml">
            <div class="row element-sample">
                <div class="lightBorder">
                    <div class="codetabs">
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li><a href="#xml"></a></li>
                        </ul>
                        <div data-tab="xml" class="tab">
                            <div class="api-call">

                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/id/121110.xml"
                                   data-internal="/proxy/shipping-guide/api/pickuppoint/id/121110.xml">
                                    /api/pickuppoint/id/121110.xml </a>
                                <p>Response:</p>
                                <pre class="code-box xml response delay-snippet"></pre>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div data-tab="json">
            <div class="row element-sample">
                <div class="lightBorder">
                    <div class="codetabs">
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li><a href="#json"></a></li>
                        </ul>

                        <div data-tab="json" class="tab">
                            <div class="api-call">
                                <p>Request:</p>
                                <a target="_blank" class="request"
                                   href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/id/121110.json"
                                   data-internal="/proxy/shipping-guide/api/pickuppoint/id/121110.json">
                                    /api/pickuppoint/id/121110.json </a>

                                <p class="right">JSONP Request: <a
                                        href="http://fraktguide.bring.no/fraktguide/api/pickuppoint/id/121110.json?callbackUrl=functionName">?callback=functionName</a>
                                </p>
                                <p>Response:</p>
                                <pre class="code-box json response delay-snippet"></pre>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </br><hr></br>
    <h2><a name="additionalExamples"></a>Additional examples</h2>
    <ul class="menu-group collapsing no-shadow">

        <li>
            <a href="#" class="menu-item"><h4>Find pickup points containing a specified string</h4></a>

            <div class="content-box">
                <p>If you want to return only the pickup points matching a specified string, you may add <code>?searchForText=&lt;text
                    to match&gt;</code> to the request. The string in the <code>&lt;text to match&gt;</code> can be the
                    name of the pickup point, its address, city, county, municipality or location. Partial matches are
                    also allowed.

                <div class="row element-sample">
                    <h4><p>Example below: FIND THE PICKUP POINTS NEAR POSTAL CODE 1407 CONTAINING &quot;KIWI&quot;.</p>
                    </h4>
                    <div class="codetabs">
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li><a href="#xml"></a></li>
                        </ul>
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
                            <ul class="tab-group minimal" data-tabs="tabs">
                                <li><a href="#json"></a></li>
                            </ul>

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
            <a href="#" class="menu-item"><h4>Find pickup points open on specified days</h4></a>

            <div class="content-box">

                <p>If you want to return only the pickup points open on specified days, you may add <code>?openingHoursSearchType=&lt;day&gt;</code>to
                    the request. <code>&lt;day&gt; = ALL_WEEKDAYS (default) | MONDAY | TUESDAY | WEDNESDAY | THURSDAY |
                        FRIDAY | SATURDAY | SUNDAY</code> If you want you can also add openOnOrBefore and / or
                    openOnOrAfter, to limit the search even more. </p>

                <div class="row element-sample">

                    <h4><p>Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON SUNDAYS.</p></h4>

                        <div class="codetabs">
                            <ul class="tab-group minimal" data-tabs="tabs">
                                <li><a href="#xml"></a></li>
                            </ul>
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

                        <div class="codetabs">
                            <ul class="tab-group minimal" data-tabs="tabs">
                                <li><a href="#json"></a></li>
                            </ul>
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
            <a href="#" class="menu-item"><h4>Find pickup points open at specific hours</h4></a>

            <div class="content-box">
                <p>If you want to return only the pickup points open on specific hours, you may add <code>?openOnOrBefore=&lt;time&gt;</code>
                    and/or <code>?openOnOrAfter=&lt;time&gt;</code> to the request. <code>&lt;time&gt; = HHMM</code>
                </p>

                <div class="row element-sample">

                    <h4><p>Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR BEFORE 08.00</p></h4>

                        <div class="codetabs">
                            <ul class="tab-group minimal" data-tabs="tabs">
                                <li><a href="#xml"></a></li>
                            </ul>
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
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li><a href="#json"></a></li>
                        </ul>

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

                    <h4><p>Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR AFTER 22.00</p></h4>


                        <div class="codetabs">
                            <ul class="tab-group minimal" data-tabs="tabs">
                                <li><a href="#xml"></a></li>
                            </ul>
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
                        <ul class="tab-group minimal" data-tabs="tabs">
                            <li><a href="#json"></a></li>
                        </ul>

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
</div>


</div>
</div>
<div class="span3">
    <div id="sidebar">
        <misc:sidebar/>
    </div>
</div>
</div>
</section>
</div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>