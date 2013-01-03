<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="suffix" required="true" type="java.lang.String" %>

<table>
  <thead>
  <tr>
    <th class="shippingguidereferencecolumn">Parameter</th>
    <th>Description</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>Postal code</td>
    <td>Specified by adding <a target="_blank"
                               href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.${suffix}?from=7600&amp;to=1407">?from=7600&amp;to=1407</a>.
    </td>
  </tr>
  <tr class="even">
    <td>Country code</td>
    <td>
      Specified by adding <a target="_blank"
                             href="http://fraktguide.bring.no/fraktguide/products/CARRYON_HOMESHOPPING_NORWAY/expectedDelivery.${suffix}?from=2100&amp;to=2100&amp;fromCountry=NO&amp;toCountry=DK">?fromCountry=NO&amp;toCountry=DK</a>.
      Country code <a tabindex="99"
                      href="http://www.iso.org/iso/english_country_names_and_code_elements"
                      target="_blank">ISO-code</a>. Norway is default when country code is not set.
    </td>
  </tr>
  <tr>
    <td>Weight in grams</td>
    <td>Specified by adding <a target="_blank"
                               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500">?weightInGrams=1500</a>.
      Note that weight is given in grams.
    </td>

  </tr>
  <tr class="even">
    <td>Dimensions</td>
    <td>Specified by adding <a target="_blank"
                               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40">
      &amp;length=30&amp;width=40&amp;height=40</a>.
    </td>
  </tr>
  <tr>

    <td>Volume</td>
    <td>Specified by adding <a target="_blank"
                               href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;volume=33">
      &amp;volume=33</a>. Volume is in dm<sup>3</sup> (litres).
    </td>
  </tr>
  <tr class="even">
    <td>Shipping date</td>
    <td>
      Shipping date specifies which date the parcel will be delivered to Bring (within the timelimit),
      and is used to calculate the delivery date. Specified by adding e.g. <a target="_blank"
                                                                              href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;volume=33&amp;date=2012-12-18">
      &amp;date=2012-12-18</a>. Date is specified in ISO-format, YYYY-MM-DD.
    </td>
  </tr>
  <tr>
    <td>Shipping time</td>
    <td>
      Shipping time may be specified. Note that Bring's courier products are the only one affected by
      this parameter. <a target="_blank"
                         href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;volume=33&amp;date=2012-12-18&amp;time=12:30">
      &amp;date=2012-12-18&amp;time=12:30</a>. Time is specified in ISO-format, HH:mm.
    </td>
  </tr>
  <tr class="even">
    <td>EDI setting</td>
    <td>
      Flag that tells if the parcel is registred using EDI. Specified by adding <a target="_blank"
                                                                                   href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;edi=true">
      &amp;edi=true</a>. Default is <b>true</b>. Note that this flag may affect price and which
      products are available.
    </td>
  </tr>
  <tr>
    <td>Shipped from post office</td>
    <td>
      Flag that tells whether the parcel is delivered at a post office when it is sent. Specified by adding
      <a target="_blank"
         href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;postingAtPostoffice=true">
        &amp;postingAtPostoffice=true</a>. Default is <b>false</b>.
    </td>
  </tr>
  <tr class="even">
    <td>Additional services</td>
    <td>
      Request additional services for the package. Specified by adding one or more "additional" parameters to the
      request, e.g.
      <a target="_blank"
         href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;date=2009-3-27&amp;additional=postoppkrav&amp;additional=evarsling&amp;additional=lordagsutkjoring">
        &amp;additional=postoppkrav&amp;additional=evarsling</a>. See the <a
            href="/additionalresources/productlist.html?from=shipping#additionalServices">additional services list</a>.
        The Shipping Guide will match the additional service codes to the requested products and ignore product / additional service codes that are not applicable.
    </td>
  </tr>
  <tr>
    <td>Price adjustments</td>
    <td>
      Option to adjust the price returned. Specified by adding <a target="_blank"
                                                                  href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;priceAdjustment=m20p">
      &amp;priceAdjustment=m20p</a>. Note that price adjustments is on prices without VAT. Refer to
      additional examples to read more.
    </td>
  </tr>
  <tr class="even">
    <td>Public ID</td>
    <td>
      Public ID is the last part (after the last dash) of your identification string
      (logged in information for user of Shipping Guide) Specified by adding the parameter "pid", e.g.
      pid=abc123456789. This makes the Shipping Guide know who performs the query, so we may contact
      the correct shipping guide user for potential follow ups.
    </td>
  </tr>
  <tr>
    <td>Products</td>
    <td>
      This parameter lets you specify which products you want to return information about.
      If you omit this parameter, you get the default product list (not recommended for production usage).
      Product is specified by adding one or more product parameters, e.g.
      <a target="_blank"
         href="http://fraktguide.bring.no/fraktguide/products/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=servicepakke&product=bpakke_dor-dor">
        product=servicepakke&product=bpakke_dor-dor</a>.
    </td>
  </tr>
  </tbody>
</table>