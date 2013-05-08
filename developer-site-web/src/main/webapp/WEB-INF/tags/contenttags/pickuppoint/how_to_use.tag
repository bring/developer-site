<%@ tag language="java" pageEncoding="UTF-8"%>

<p>First you have to choose whether you want to use a postal code or geographical coordinates to find the 10 nearest
       delivery locations. The following examples illustrate the different alternatives. </p>

  <div data-tab="xml">
      <div class="row element-sample">

          <h4>Example: USING THE POSTAL CODE</h4>

          <p>Find pickup points based on the recipient's postal code, 1407 Vinterbro. </p>

          <div class="">
                  <div data-tab="xml" class="tab">
                      <div class="api-call">
                          <p>Request:</p>
                          <a target="_blank" class="request"
                             href="https://api.bring.com/shippingguide/api/pickuppoint/postalcode/1407.xml?clientUrl=insertYourClientUrlHere"
                             data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.xml?clientUrl=insertYourClientUrlHere">
                              /api/pickuppoint/postalcode/1407.xml</a>
                          <p>Response:</p>
                          <pre class="code-box xml response delay-snippet"></pre>

                      </div>
                  </div>
          </div>

      </div>
  </div>
  <div data-tab="json">
      <div class="row element-sample">

          <h4>Example: USING THE POSTAL CODE</h4>

          <p>Find pickup points based on the recipient's postal code, 1407 Vinterbro. </p>

          <div class="">
              <div data-tab="json" class="tab">
                  <div class="api-call">
                      <p>Request:</p>
                      <a target="_blank" class="request"
                         href="https://api.bring.com/shippingguide/api/pickuppoint/postalcode/1407.json?clientUrl=insertYourClientUrlHere"
                         data-internal="/proxy/shipping-guide/api/pickuppoint/postalcode/1407.json?clientUrl=insertYourClientUrlHere">
                          /api/pickuppoint/postalcode/1407.json</a>

                      <p class="right">JSONP Request: <a
                              href="https://api.bring.com/shippingguide/api/pickuppoint/postalcode/1407.json?clientUrl=insertYourClientUrlHere&callbackUrl=functionName">?callback=functionName</a>
                      </p>
                      <p>Response:</p>
                      <pre class="code-box json response delay-snippet"></pre>

                  </div>
              </div>
          </div>
      </div>

  </div>

    <h4>Example: USING GEOGRAPHICAL COORDINATES</h4>

    <p>Find pickup points based on the recipient's geographical coordinates, Bergen city (60.395226, 5.321725) </p>

    <div data-tab="xml">
        <div class="row element-sample">
            <div class="">
                <div data-tab="xml" class="tab">
                    <div class="api-call">
                        <p>Request:</p>
                        <a target="_blank" class="request"
                           href="https://api.bring.com/shippingguide/api/pickuppoint/location/60.395226/5.321725.xml?clientUrl=insertYourClientUrlHere"
                           data-internal="/proxy/shipping-guide/api/pickuppoint/location/60.395226/5.321725.xml?clientUrl=insertYourClientUrlHere">
                            /api/pickuppoint/location/60.395226/5.321725.xml </a>
                        <p>Response:</p>
                        <pre class="code-box xml response delay-snippet"></pre>

                    </div>
                </div>
            </div>
            </div>
    </div>
    <div data-tab="json">
        <div class="row element-sample">
            <div class="">
                    <div data-tab="json" class="tab">
                        <div class="api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="https://api.bring.com/shippingguide/api/pickuppoint/location/60.395226/5.321725.json?clientUrl=insertYourClientUrlHere"
                               data-internal="/proxy/shipping-guide/api/pickuppoint/location/60.395226/5.321725.json?clientUrl=insertYourClientUrlHere">
                                /api/pickuppoint/location/60.395226/5.321725.json </a>

                            <p class="right">JSONP Request: <a
                                    href="https://api.bring.com/shippingguide/api/pickuppoint/location/60.395226/5.321725.json?clientUrl=insertYourClientUrlHere&callbackUrl=functionName">?callback=functionName</a>
                            </p>
                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>

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
                          reference table or see additional examples for more information.

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
                <div class="">
                    <div data-tab="xml" class="tab">
                        <div class="api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="https://api.bring.com/shippingguide/api/pickuppoint/id/121110.xml?clientUrl=insertYourClientUrlHere"
                               data-internal="/proxy/shipping-guide/api/pickuppoint/id/121110.xml?clientUrl=insertYourClientUrlHere">
                                /api/pickuppoint/id/121110.xml </a>
                            <p>Response:</p>
                            <pre class="code-box xml response delay-snippet"></pre>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div data-tab="json">
            <div class="row element-sample">
                <div class="">
                    <div data-tab="json" class="tab">
                        <div class="api-call">
                            <p>Request:</p>
                            <a target="_blank" class="request"
                               href="https://api.bring.com/shippingguide/api/pickuppoint/id/121110.json?clientUrl=insertYourClientUrlHere"
                               data-internal="/proxy/shipping-guide/api/pickuppoint/id/121110.json?clientUrl=insertYourClientUrlHere">
                                /api/pickuppoint/id/121110.json </a>

                            <p class="right">JSONP Request: <a
                                    href="https://api.bring.com/shippingguide/api/pickuppoint/id/121110.json?clientUrl=insertYourClientUrlHere&callbackUrl=functionName">?callback=functionName</a>
                            </p>
                            <p>Response:</p>
                            <pre class="code-box json response delay-snippet"></pre>
                        </div>
                    </div>
                </div>
            </div>
        </div>