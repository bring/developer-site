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
         data-internal="/proxy/booking/api/additionalServicesForProduct.json"></a>
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
                 data-internal="/proxy/booking/api/bookingExamples/recipientNotificationRequest.json"></a>
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
                 data-internal="/proxy/booking/api/bookingExamples/cashOnDeliveryRequest.json"></a>
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
                 data-internal="/proxy/booking/api/bookingExamples/quickPackEnvelopeRequest.json"></a>
            </div>
          </div>

        </div>
      </li>
      <li>
        <a href="#" class="menu-item"> Delivery Option <span class="arrow"></span> </a>

        <div class="content-box">

          <additionalServices:deliveryOption/>
          <div data-tab="json" class="tab">
            <div class="api-call">
              <p>Example:</p>
              <pre class="code-box json response delay-snippet"></pre>
              <a target="_blank" class="request"
                 data-internal="/proxy/booking/api/bookingExamples/deliveryOptionRequest.json"></a>
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
                 data-internal="/proxy/booking/api/bookingExamples/flexDeliveryRequest.json"></a>

              <p>Example response:</p>
              <pre class="code-box json response delay-snippet"></pre>
            </div>
          </div>

        </div>
      </li>

    </ul>
  </div>


</div>