<%@ taglib prefix="additionalServices" tagdir="/WEB-INF/tags/contenttags/booking/additionalServices" %>

<div class="additional-services">
  <h4>Additional services</h4>
  <p>The following products have available additional services:</p>
  <table>
      <thead>
      <tr>
          <th>Product</th>
          <th>Additional services</th>
      </tr>
      </thead>
      <tbody class="additional-services-view">
      </tbody>
  </table>

  <div data-tab="json" class="tab">
    <div class="api-call">
      <p>JSON:</p>
      <pre class="code-box json response delay-snippet hidden"></pre>
      <a target="_blank" class="request"
         href="https://www.bring.no/booking/api/additionalServicesForProduct.json"
         data-internal="/proxy/booking/api/additionalServicesForProduct.json">
         https://www.bring.no/booking/api/additionalServicesForProduct.json
      </a>
    </div>
  </div>

  <div data-tab="xml json"><h4><a name="additionalServices"></a>Additional services examples</h4></div>

  <div class="row element-sample">
    <ul class="menu-group collapsing no-shadow">

      <li>
        <a href="#" class="menu-item"> Recipient Notification <span class="arrow"></span> </a>

        <div class="content-box">
          <additionalServices:recipient_notification/>
          <div data-tab="json" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box json response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/recipientNotificationRequest.json"
                 data-internal="/proxy/booking/api/bookingExamples/recipientNotificationRequest.json">
                 https://www.bring.no/booking/api/bookingExamples/recipientNotificationRequest.json
              </a>
            </div>
          </div>

        </div>
      </li>

      <li>
        <a href="#" class="menu-item"> Cash On Delivery <span class="arrow"></span> </a>

        <div class="content-box">
          <additionalServices:cash_on_delivery/>
          <div data-tab="json" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box json response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/cashOnDeliveryRequest.json"
                 data-internal="/proxy/booking/api/bookingExamples/cashOnDeliveryRequest.json">
                https://www.bring.no/booking/api/bookingExamples/cashOnDeliveryRequest.json
              </a>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> QuickPack Envelope <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:quickpack_envelope/>
          <div data-tab="json" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box json response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/quickPackEnvelopeRequest.json"
                 data-internal="/proxy/booking/api/bookingExamples/quickPackEnvelopeRequest.json">
                 https://www.bring.no/booking/api/bookingExamples/quickPackEnvelopeRequest.json
              </a>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Delivery Option <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:deliveryOption_json/>
          <div data-tab="json" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box json response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/deliveryOptionRequest.json"
                 data-internal="/proxy/booking/api/bookingExamples/deliveryOptionRequest.json">
                https://www.bring.no/booking/api/bookingExamples/deliveryOptionRequest.json
              </a>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Flex Delivery <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:flex_delivery/>
          <div data-tab="json" class="tab">
            <div class="api-call">
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/flexDeliveryRequest.json"
                 data-internal="/proxy/booking/api/bookingExamples/flexDeliveryRequest.json">
                https://www.bring.no/booking/api/bookingExamples/flexDeliveryRequest.json
              </a>

              <p>Example response:</p>
              <pre class="code-box json response delay-snippet"></pre>
            </div>
          </div>

        </div>
      </li>
      <li>
          <a href="#" class="menu-item"> Select Pickup Point Norway <span class="arrow"></span> </a>

          <div class="content-box">

              <additionalServices:selectPickupPoint_norway/>
              <div data-tab="json" class="tab">
                <div class="api-call">
                  <p>Example Request:</p>
                  <a target="_blank" class="request"
                     href="https://www.bring.no/booking/api/bookingExamples/basicPickupPointNORequest.json"
                     data-internal="/proxy/booking/api/bookingExamples/basicPickupPointNORequest.json">
                     https://www.bring.no/booking/api/bookingExamples/basicPickupPointNORequest.json
                  </a>
                      <pre class="code-box json response delay-snippet"></pre>
                </div>
              </div>

          </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Select Pickup Point Sweden <span class="arrow"></span> </a>

        <div class="content-box">

            <additionalServices:selectPickupPoint_sweden/>
            <div data-tab="json" class="tab">
                <div class="api-call">
                    <p>Example Request:</p>
                    <a target="_blank" class="request"
                       href="https://www.bring.no/booking/api/bookingExamples/basicPickupPointSERequest.json"
                       data-internal="/proxy/booking/api/bookingExamples/basicPickupPointSERequest.json">
                        https://www.bring.no/booking/api/bookingExamples/basicPickupPointSERequest.json
                    </a>
                    <pre class="code-box json response delay-snippet"></pre>
                </div>
            </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Select Pickup Point Denmark <span class="arrow"></span> </a>

        <div class="content-box">
          <additionalServices:selectPickupPoint_denmark/>
          <div data-tab="json" class="tab">
              <div class="api-call">
                  <p>Example:</p>
                  <pre class="code-box json response delay-snippet"></pre>
                  <a target="_blank" class="request"
                          href="https://www.bring.no/booking/api/bookingExamples/basicPickupPointDKRequest.json"
                          data-internal="/proxy/booking/api/bookingExamples/basicPickupPointDKRequest.json">
                           https://www.bring.no/booking/api/bookingExamples/basicPickupPointDKRequest.json
                       </a>
                       </pre>
                   </div>
               </div>
           </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Express <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:express/>
          <div data-tab="json" class="tab">
            <div class="api-call">
              <p>Request:</p>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/expressRequest.json"
                 data-internal="/proxy/booking/api/bookingExamples/expressRequest.json">
                https://www.bring.no/booking/api/bookingExamples/expressRequest.json </a>
              <pre class="code-box json response delay-snippet"></pre>
            </div>
          </div>

        </div>
      </li>
    </ul>
  </div>


</div>
