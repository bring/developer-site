<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shippingguide" tagdir="/WEB-INF/tags/contenttags/shippingguide" %>
<div data-tab="xml json">
  <h2><a name="HTU"></a>How to Use</h2>
  <p>
    For a given shipment from A to B, the core way to use the Shipping Guide is to query for <em>all</em> the products you know how to send (e.g. the products you have a customer agreement for).
    From that given set of products specified in the request, the Shipping Guide will return the products that are relevant for the shipment, based on product attributes (e.g. max package size and weight)
    and service area (norwegian: dekningsområde), e.g. not all products are offered to all postal codes.
  </p>
  <p><b>Example:</b> You have a package of 2,5 kilos from postal codes 0484 to 5600 that you want to send.
    Your webshop knows how to send (e.g. has a customer agreement) for sending the following Bring products:
  <ul>
    <li>Servicepakke</li>
    <li>Bedriftspakke</li>
    <li>Bedriftspakke Ekspress - Over Natten</li>
    <li>På Døren</li>
    <li>A-Post</li>
    <li>B-Post</li>
  </ul>
  The Shipping Guide request should then be made for all the products (explicitly set using multiple product parameters), and the Shipping Guide will tell you which products are applicable.
  E.g. A-Post and B-Post are not applicable since the package is greater than 2 kg, and postal code 5600 is outside the service area for "På Døren".
  </p>
</div>

<div data-tab="json" class="tab api-call">
  <p>Request:</p>
  <a target="_blank" class="request"
     href="http://fraktguide.bring.no/fraktguide/products/all.json?weightInGrams=2500&amp;from=0484&amp;to=5600&amp;product=servicepakke&amp;product=bpakke_dor-dor&amp;product=ekspress09&amp;product=pa_doren&amp;product=a-post&amp;product=b-post"
     data-internal="/proxy/shipping-guide/products/all.json?weightInGrams=2500&amp;from=0484&amp;to=5600&amp;product=servicepakke&amp;product=bpakke_dor-dor&amp;product=ekspress09&amp;product=pa_doren&amp;product=a-post&amp;product=b-post">
    ../all.json?weightInGrams=2500&amp;from=0484&amp;to=5600&amp;product=servicepakke&amp;product=bpakke_dor-dor&amp;product=ekspress09&amp;product=pa_doren&amp;product=a-post&amp;product=b-post</a>
  <br><br><p>Response:</p>
  <pre class="code-box json response delay-snippet"></pre>
</div>

<div data-tab="xml">
  <div class="tab api-call">
    <p>Request:</p>
    <a target="_blank" class="request"
       href="http://fraktguide.bring.no/fraktguide/products/all.xml?weightInGrams=2500&amp;from=0484&amp;to=5600&amp;product=servicepakke&amp;product=bpakke_dor-dor&amp;product=ekspress09&amp;product=pa_doren&amp;product=a-post&amp;product=b-post"
       data-internal="/proxy/shipping-guide/products/all.xml?weightInGrams=2500&amp;from=0484&amp;to=5600&amp;product=servicepakke&amp;product=bpakke_dor-dor&amp;product=ekspress09&amp;product=pa_doren&amp;product=a-post&amp;product=b-post">
      ../all.xml?weightInGrams=2500&amp;from=0484&amp;to=5600&amp;product=servicepakke&amp;product=bpakke_dor-dor&amp;product=ekspress09&amp;product=pa_doren&amp;product=a-post&amp;product=b-post</a>
    <br><br><p>Response:</p>
    <pre class="code-box xml response delay-snippet"></pre>
  </div>

  <p>Please refer to the <a href="../additionalresources/wsdl-xml-schema.html?from=shipping">XML schema</a> for
    information on elements in the response.
  </p>
</div>

<div data-tab="xml json">
    <div class="information-box"> Please add the name of the web-shop to the HTTP header "User-Agent" on
                                  each request to the service. If available, the name of the web-shop
                                  owner should also be added to the request. If you have a registered
                                  user at fraktguide.bring.no, please also include XML API's Public ID
                                  parameter in the query. Public ID is your personal Shipping Guide
                                  account id. It is a sequence of alphanumeric characters after the last
                                  dash in your identification. (Please login to see your identification
                                  string). If your Shipping Guide IE is: 372b269a-4f07-4c4e-92b9-<b>460cb92b0767</b>
                                  your pid is <b>460cb92b0767</b>. This makes it possible for us to send
                                  any relevant messages via the registered e-mail address.
    </div>

    <shippingguide:evarsling_notice/>

</div>


<div data-tab="xml json">
    <div class="information-box">When using the Shipping Guide, it is important to handle errors gracefully. Your web shop's
                                 users should still be able to order, even if the Shipping Guide returns an error or a
                                 timeout occurs.
      <a href="../additionalresources/errorhandling.html?from=shipping">
        Read more about error handling and error codes.
      </a>
    </div>

</div>

<div data-tab="json xml">
    <div class="information-box">Shipping Guide specifies VAT related to senders country. It's up to the client to decide if
                                 VAT is applicable to their situation of sale
    </div>
</div>

<div data-tab="json xml">
    <p>The Shipping Guide API has a lot of optional parameters not covered in this tutorial, and we recommend that you get
       familiar with the reference table and look at all the additional examples for further study.
    </p>
</div>
