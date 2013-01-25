<%@ tag language="java" pageEncoding="UTF-8"%>
<h4>How to use the Customer API</h4>

<p>
  You must be logged in to mybring to use the Customer API. You can test it as a normal mybring user using a web
  browser, or you can use the mybring API-key to be authenticated to use the service programmatically. </p>

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
