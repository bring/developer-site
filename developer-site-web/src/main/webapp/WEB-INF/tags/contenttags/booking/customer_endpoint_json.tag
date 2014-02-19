<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="json" class="tab">
  <a name="customers_json"></a>
  <h3 class="with-padding">Customer Endpoint</h3>

  <h4 class="no-top-pad">How to use the Customer API</h4>
  <p>
    You must be logged in to Mybring to use the Customer API. You can test it as a normal Mybring user using a web
    browser, or you can use the Mybring API-key to be authenticated to use the service programmatically. </p>

  <p>
    The customer numbers are prefixed with the specialist, followed by the number. For Courier and Bring
    Express-products, we use a UUID to identify users. </p>
  <p>The customer API will return for each specialist a list with the products that you can order through the booking API</p>
  <table>
    <thead>
    <tr>
      <th>Specialist</th>
      <th>Example products</th>
      <th>Example customerNumber</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>Bring Parcels, Norway</td>
      <td>BPAKKE_DOR-DOR, PA_DOREN, EKSPRESS09</td>
      <td>PARCELS_NORWAY-10001123123</td>
    </tr>
    <tr>
      <td>Bring Cargo, Norway</td>
      <td>CARGO_GROUPAGE</td>
      <td>CARGO_NORWAY-10001123123</td>
    </tr>
    <tr>
      <td>Bring Express, Norway</td>
      <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
      <td>EXPRESS_NORWAY-2caedf20-27da-012f-3858-58b0357c4f66</td>
    </tr>
    <tr>
      <td>Bring Express, Sweden</td>
      <td>COURIER_4H, QUICKPACK_SAMEDAY, QUICKPACK_DAY_CERTAIN</td>
      <td>EXPRESS_SWEDEN-406077f0-27da-012f-3859-58b0357c4f66</td>
    </tr>
    </tbody>
  </table>

  <h5>Customer API - Sample JSON API Request</h5>
  <pre class="code-box">GET /booking/api/customers HTTP/1.1
Content-Type: application/json
Accept: application/json
X-MyBring-API-Uid: mybringuser@example.org
X-MyBring-API-Key: f00f000f-00f0-f0f0-f0f0-f0f0f0f0ff00
X-Bring-Client-URL: http://example.org/shop
Host: api.bring.com
</pre>


  <div class="api-call">
    <p>Example response:</p>
    <pre class="code-box json response delay-snippet"></pre>
    <a target="_blank" class="request"
       href="https://bring.no/booking/api/bookingExamples/customers.json"
       data-internal="/proxy/booking/api/bookingExamples/customers.json"> https://bring.no/booking/api/bookingExamples/customers.json</a>
  </div>

  <h5>Getting customers when logged into Mybring</h5>
  <p>
    You can also get the API customer numbers from a page in Mybring. Log into mybring and go to <a
          href="https://www.mybring.com/useradmin/account/apicustomernumber">https://www.mybring.com/useradmin/account/apicustomernumber</a>
    to see your customer numbers and corresponding API customer numbers.
  </p>
</div>
