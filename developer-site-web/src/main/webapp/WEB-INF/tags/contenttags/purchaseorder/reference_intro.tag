<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="suffix" required="true" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul>
  <li>
      <b>Response type:</b> By querying <a
            href="http://fraktguide.bring.no/fraktguide/products/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500"
            target="_blank"><code>price.${suffix}</code></a> you will get the price of the shipment, while <a
            href="http://fraktguide.bring.no/fraktguide/products/expectedDelivery.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500"
            target="_blank"><code>expectedDelivery.${suffix}</code></a> will show you an estimated delivery time.
    By querying <a
            href="http://fraktguide.bring.no/fraktguide/products/all.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500"
            target="_blank"><code>all.${suffix}</code></a> you will get price, expected delivery, product categories and additional information such as an indication of which alternative has
    the least environmental impact.
  </li>
  <li>
    <b>Products:</b>
    If you set the product name in the URL path (e.g.
    <a target="_blank" href="http://fraktguide.bring.no/fraktguide/products/SERVICEPAKKE/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500">
      <code>/products/SERVICEPAKKE/price.${suffix}?...</code>
    </a>
    ) you specify that you only want results for that product.
    If product is not set in the path, you get the default product list, or (better) you can specify the products explicitly by using
    "product" parameters, e.g.
    <a target="_blank" href="http://fraktguide.bring.no/fraktguide/products/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500&amp;product=servicepakke&amp;product=pa_doren">
      <code>/products/price.${suffix}?product=servicepakke&amp;product=pa_doren</code>
    </a>
  </li>
  <li>
    <b>Origin and destination:</b> For domestic shipments in
    Norway postal codes are sufficient, but for international shipments country
    codes must be specified as well (or city for countries that
    are not using postal codes). To specify a postal code such as "0361" add
            <a
            href="http://fraktguide.bring.no/fraktguide/products/all.${suffix}?from=0361&amp;to=0361&amp;weightInGrams=1500"
            target="_blank"><code>from=0361</code></a>
            and
            <a
            href="http://fraktguide.bring.no/fraktguide/products/all.${suffix}?from=0361&amp;to=0361&amp;weightInGrams=1500"
            target="_blank"><code>&amp;to=0361</code></a>
            to your request. For international shipments use country
            codes (e.g. DK for Denmark) add <a
            href="http://fraktguide.bring.no/fraktguide/products/all.${suffix}?from=0361&amp;to=2100&amp;weightInGrams=1500&amp;toCountry=DK&amp;product=CARRYON_HOMESHOPPING_NORWAY"
            target="_blank"><code>&amp;toCountry=DK</code></a> or <a
            href="http://fraktguide.bring.no/fraktguide/products/all.${suffix}?from=2100&amp;to=0361&amp;weightInGrams=1500&amp;fromCountry=DK&amp;product=CARRYON_HOMESHOPPING_DENMARK"
            target="_blank"><code>&amp;fromCountry=DK</code></a> to your request.
  </li>
  <li>
    <b>Package size:</b> This can either be the weight of the package in grams, its
    dimensions or volume. A weight of 1500 grams can be specified by <a target="_blank"
                                                                        href="http://fraktguide.bring.no/fraktguide/products/price.${suffix}?from=7600&amp;to=1407&amp;weightInGrams=1500"><code>
    &amp;weightInGrams=1500</code></a>, dimensions of 30cm x 40cm x 40cm as <a target="_blank"
                                                                               href="http://fraktguide.bring.no/fraktguide/products/price.${suffix}?from=7600&amp;to=1407&amp;length=30&amp;width=40&amp;height=40">
    <code>&amp;length=30&amp;width=40&amp;height=40</code></a> or volume of 33dm<sup>3</sup> as <a
          target="_blank"
          href="http://fraktguide.bring.no/fraktguide/products/price.${suffix}?from=7600&amp;to=1407&amp;volume=33">
    <code>&amp;volume=33</code></a> .
  </li>
</ul>