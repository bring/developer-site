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
         href="https://api.bring.com/booking/api/additionalServicesForProduct.xml"
         data-internal="/proxy/booking/api/additionalServicesForProduct.xml">
        https://api.bring.com/booking/api/additionalServicesForProduct.xml</a>
    </div>
  </div>

  <div data-tab="xml"><h4><a name="additionalServices"></a>Additional services examples</h4></div>

  <div class="row element-sample">
    <ul class="menu-group collapsing no-shadow">

      <li>
        <a href="#" class="menu-item"> Recipient Notification <span class="arrow"></span> </a>

        <div class="content-box">
          <additionalServices:recipient_notification/>
          <div data-tab="xml" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box xml response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/recipientNotificationRequest.xml"
                 data-internal="/proxy/booking/api/bookingExamples/recipientNotificationRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/recipientNotificationRequest.xml </a>
            </div>
          </div>

        </div>
      </li>

      <li>
        <a href="#" class="menu-item"> Cash On Delivery <span class="arrow"></span> </a>

        <div class="content-box">
          <additionalServices:cash_on_delivery/>
          <div data-tab="xml" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box xml response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/cashOnDeliveryRequest.xml"
                 data-internal="/proxy/booking/api/bookingExamples/cashOnDeliveryRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/cashOnDeliveryRequest.xml </a>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> QuickPack Envelope <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:quickpack_envelope/>
          <div data-tab="xml" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box xml response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/quickPackEnvelopeRequest.xml"
                 data-internal="/proxy/booking/api/bookingExamples/quickPackEnvelopeRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/quickPackEnvelopeRequest.xml </a>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Delivery Option <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:deliveryOption_xml/>
          <div data-tab="xml" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box xml response delay-snippet"></pre>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/deliveryOptionRequest.xml"
                 data-internal="/proxy/booking/api/bookingExamples/deliveryOptionRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/deliveryOptionRequest.xml </a>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Flex Delivery <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:flex_delivery/>
          <div data-tab="xml" class="tab">
            <div class="api-call">
              <p>Request:</p>
              <a target="_blank" class="request"
                 href="https://www.bring.no/booking/api/bookingExamples/flexDeliveryRequest.xml"
                 data-internal="/proxy/booking/api/bookingExamples/flexDeliveryRequest.xml">
                https://www.bring.no/booking/api/bookingExamples/flexDeliveryRequest.xml </a>

              <p>Example request:</p>
              <pre class="code-box xml response delay-snippet"></pre>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Select Pickup Point Norway <span class="arrow"></span> </a>

        <div class="content-box">

            <additionalServices:selectPickupPoint_norway/>
            <div data-tab="xml" class="tab">
                <div class="api-call">
                    <p>Example Request:</p>
                    <a target="_blank" class="request"
                       href="https://www.bring.no/booking/api/bookingExamples/basicPickupPointNORequest.xml"
                       data-internal="/proxy/booking/api/bookingExamples/basicPickupPointNORequest.xml">
                        https://www.bring.no/booking/api/bookingExamples/basicPickupPointNORequest.xml </a>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Select Pickup Point Sweden <span class="arrow"></span> </a>

        <div class="content-box">

            <additionalServices:selectPickupPoint_sweden/>
            <div data-tab="xml" class="tab">
                <div class="api-call">
                    <p>Example Request:</p>
                    <a target="_blank" class="request"
                       href="https://www.bring.no/booking/api/bookingExamples/basicPickupPointSERequest.xml"
                       data-internal="/proxy/booking/api/bookingExamples/basicPickupPointSERequest.xml">
                        https://www.bring.no/booking/api/bookingExamples/basicPickupPointSERequest.xml </a>
                    <pre class="code-box xml response delay-snippet"></pre>
                </div>
            </div>

        </div>
      </li>
        <li>
            <a href="#" class="menu-item"> Select Pickup Point Denmark <span class="arrow"></span> </a>

            <div class="content-box">
                <additionalServices:selectPickupPoint_denmark/>
                <div data-tab="xml" class="tab">
                    <div class="api-call">
                        <p>Example Request:</p>
                        <a target="_blank" class="request"
                           href="https://www.bring.no/booking/api/bookingExamples/basicPickupPointDKRequest.xml"
                           data-internal="/proxy/booking/api/bookingExamples/basicPickupPointDKRequest.xml">
                            https://www.bring.no/booking/api/bookingExamples/basicPickupPointDKRequest.xml
                        </a>
                        <pre class="code-box xml response delay-snippet"></pre>
                    </div>
                </div>
            </div>
        </li>
    </ul>
  </div>


</div>
