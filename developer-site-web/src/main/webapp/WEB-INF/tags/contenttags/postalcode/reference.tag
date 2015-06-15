<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="postalcode" tagdir="/WEB-INF/tags/contenttags/postalcode" %>
<div data-tab="xml">
  <p>
    The XML API lets you query postal code and get results as XML.
  </p>
  <p>
    Example:
    <a target="_blank" href="https://api.bring.com/shippingguide/api/postalCode.xml?clientUrl=insertYourClientUrlHere&country=no&amp;pnr=1337">
      /api/postalCode.xml?country=no&amp;pnr=1337
    </a>
  </p>
  <postalcode:parameter_table show_callback_param="false" />
  <p>
    For Norway, you also get information about the postal code type.
    This is set in the XML attribute <code>postalCodeType</code> in the response:
  </p>
</div>
<div data-tab="json">
  <p>
    The JSON API lets you query postal code and get results as JSON, suitable for embedding in a web page (support for JSONP).
    Note that the JSON API takes an optional <code>callback</code> parameter which enables queries to this service from client browsers with JSONP.<br/>
    Postal Code API supports and recommends <a href="http://en.wikipedia.org/wiki/Cross-origin_resource_sharing">CORS</a> but will continue to support JSONP for older browsers.
  </p>
  <p>
    Example:
    <a target="_blank" href="https://api.bring.com/shippingguide/api/postalCode.json?clientUrl=insertYourClientUrlHere&country=no&amp;pnr=1337">
      /api/postalCode.json?country=no&amp;pnr=1337
    </a>
  </p>
  <postalcode:parameter_table show_callback_param="true" />
  <p>
    For Norway, you also get information about the postal code type.
    This is set in the JSON property <code>postalCodeType</code> in the response:
  </p>
</div>
<div data-tab="html">
  <p>
    The HTML API lets you query postal code and get results as HTML, suitable for embedding in a web page.
  </p>
  <p>
    Example:
  </p>
  <p>
    <a target="_blank" href="https://api.bring.com/shippingguide/api/postalCode.html?clientUrl=insertYourClientUrlHere&country=no&amp;pnr=1337">
      /api/postalCode.html?country=no&amp;pnr=1337
    </a> (view source!)
  </p>
  <postalcode:parameter_table show_callback_param="false" />
  <p>
    The resulting HTML will get the CSS class
    <ul>
      <li><code>bringPostnumberQueryValidPostnumber</code>: Valid postal code</li>
      <li><code>bringPostnumberQueryInvalidPostnumber</code>: Invalid postal code</li>
    </ul>
    For Norway, you also get information about the postal code type.
    This is set in the CSS class name <code>bringPostalCodeType&lt;type&gt;</code> (e.g. <code>bringPostalCodeTypeNORMAL</code>) in the response:
  </p>
</div>

<table>
  <thead>
  <tr>
    <th>postalCodeType</th>
    <th>Description</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>NORMAL</td>
    <td>Normal postal code suitable for delivering packages. Contains street addresses or mix of street and other postal code types.</td>
  </tr>
  <tr>
    <td>POBOX</td>
    <td>Postal code contains only P.O. Box addresses. Only certain Bring products can be delivered to these addresses (see the <a href="/api/shippingguideapi.html">Shipping Guide</a>).</td>
  </tr>
  <tr>
    <td>SPECIALCUSTOMER</td>
    <td>Special, e.g special return postal codes for selected customers.</td>
  </tr>
  <tr>
    <td>SPECIALNOSTREET</td>
    <td>Special, e.g special postal codes for customers with old "serviceboks".</td>
  </tr>
  <tr>
    <td>UNKNOWN</td>
    <td>Unknown postal code type. Used for e.g. international postal codes.</td>
  </tr>
  </tbody>
</table>
