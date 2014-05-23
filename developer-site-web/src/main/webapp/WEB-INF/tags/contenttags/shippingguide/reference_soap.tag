<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="soap">
    <h2><a name="reference"></a>Reference</h2>
    <div class="api-call">
        <p>The web service interface offers the most options when performing queries to the Shipping Guide.</p>

        <p><b>To execute the web-service you will need a user code (identification string). To get this, please <a
                href="http://fraktguide.bring.no/fraktguide/registrerBruker.do" target=_blank>register</a>.</b></p>

        <p>
          <a href="/additionalresources/wsdl-xml-schema.html?from=shipping">WSDL and XML Schema documentation</a>
        </p>
        <p>
        The table below lists the most important elements. For complete XML Schema Reference, see the
        automatically generated <a href="http://fraktguide.bring.no/fraktguide/schemaDoc.do" target="_blank">XML Schema Reference</a>.
        </p>
        <h4>Request elements</h4>
        <table>
            <colgroup width="100"></colgroup>
            <colgroup width="100"></colgroup>
            <colgroup width="35"></colgroup>
            <thead>
                <tr>
                    <th>Element (XPath)</th>
                    <th>Description Default</th>
                    <th>Default</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>/UserInformation/Usercode</td>
                    <td>Identifies the client</td>
                    <td></td>
                </tr>
                <tr>
                  <td>/Packages/Package/FromPostalCode</td>
                  <td>Postalcode from (sender)</td>
                  <td></td>
                </tr>
                <tr>
                  <td>/Packages/Package/ToPostalCode</td>
                  <td>Postalcode to (recipient)</td>
                  <td></td>
                </tr>
                <tr>
                  <td>/Packages/Package/ShippingDate/*</td>
                  <td>Date to ship (delivery date to the postal service) within the shipment/pickup date-time. If date is
                    given, you will receive a "ExpectedDelivery" element in ShippingGuideResponse
                  </td>
                  <td></td>
                </tr>
                <tr>
                    <td>/RequestProperties/NumberOfAlternativeDeliveryDates/</td>
                    <td>Number of "ShipmentDates" the service should calculate. Max value is 9</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>/RequestProperties/EDI</td>
                    <td>Flag to indicate if the packages are to be sent via EDI (may affect price and applicable products)</td>
                    <td>true
                    </td>
                </tr>
                <tr>
                    <td>/RequestProperties/PostingAtPostoffice</td>
                    <td>Flag to indicate that the packages will be delivered to a post office (may affect the price in
                        certain cases, e.g. with product codes SERVICEPAKKE and BPAKKE_DOR-DOR after July 1st 2013)
                    </td>
                    <td>false
                    </td>
                </tr>
                <tr>
                    <td>/RequestProperties/Language</td>
                    <td>Which language the descriptive product texts should have. Supported languages are English (en), Swedish (se), Finnish (fi), Danish (da) and Norwegian (no).
                        If no language is set, or text is not available in the requested language, norwegian text is returned.
                    </td>
                    <td>no
                    </td>
                </tr>
                <tr>
                    <td>/ProductIds/ProductId</td>
                    <td>List of Product IDs you wish to get alternatives for. The shipping guide will skip products that are not applicable (e.g. shipment is too large for product type
                    or the postal codes are outside of the service area of the product.</td>
                    <td>No defaults – required field</td>
                </tr>
                <tr>
                  <td>/ProductIds/ProductId/@customerNumber</td>
                  <td>The mybring API customer number for the specified product. E.g. "PARCELS_NORWAY-00012341234" Bring Cargo has different customer numbers from Bring Express and Bring Parcels, therefore the customer number is specified for each requested product. There exists an API /web pages for getting the API customer numbers of your mybring user that also maps customer number to products. See developer.bring.com. If the customerNumber attribute is set, then net (customer agreement) prices will be returned for the specified product. If the attribute is not set, then list (gross) prices will be returned for the product.</td>
                  <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/@packageId</td>
                    <td>If you ship more than one package, you can add a reference to each package. This reference will be
                        included in the response.
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/Height</td>
                    <td>Height of the package in centimeters</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/Width</td>
                    <td>Width of package in centimeters</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/Length</td>
                    <td>Length of package in centimeters</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/GrossWeight</td>
                    <td>Gross Weight of the package in grams</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/Volume</td>
                    <td>Volume of package in dm <sup>3</sup> (litres)</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/VolumeSpecial</td>
                    <td>Flag to indicate if the package has a shape that may require 'special handling fee'</td>
                    <td>false</td>
                </tr>
                <tr>
                    <td>/Packages/Package/AdditionalServices/AdditionalServiceId</td>
                    <td>Additional service code to include in the request (may affect e.g. price and expected delivery).
                      Combinations of products /additional service codes that are not applicable will be ignored.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/EarlyCollectionAtTerminal</td>
                    <td>Postal code for terminal. If you have an agreement for same-day delivery, and ship a &quot;På Døren&quot;
                        (To the Door) package to the Oslo terminal – within the deadline of the agreement; use code 0024 in this
                        field. Using this field currently only affects shipment times for these packages.
                    </td>
                    <td></td>
                </tr>
        </table>

        <h4>Response elements</h4>
        <table>
            <colgroup width="95"></colgroup>
            <colgroup width="100"></colgroup>
            <colgroup width="35"></colgroup>
            <thead>
                <tr>
                    <th>Element (XPath)</th>
                    <th>Description Default</th>
                    <th>Example value</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>/Packages/*</td>
                    <td>Contains the requested packages (and within each package, the products applicable for that package).</td>
                    <td></td>
                </tr>
                <tr>
                  <td>/Packages/Package/Product/*</td>
                  <td>Information about the product. Can contain 0...n products.</td>
                  <td></td>
                </tr>
                <tr>
                  <td>/Consignment/*</td>
                  <td>Element will be included in response if a Consignment element is specified in the request. Contains aggregated prices and delivery information.</td>
                  <td></td>
                </tr>
                <tr>
                    <td>//Product/ProductId</td>
                    <td>Product ID</td>
                    <td>SERVICEPAKKE</td>
                </tr>
                <tr>
                    <td>//Product/GuiInformation/*</td>
                    <td>Product texts and category. See more complete description below.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/Price/*<br/>//Product/NetPrice/*</td>
                    <td>Collection for all information related to prices. The "Price" element shows gross prices, whilst the "NetPrice" element shows net (customer agreement) prices.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/Price/PackagePriceWithoutAdditionalServices/*<br/>//Product/NetPrice/PackagePriceWithoutAdditionalServices/*</td>
                    <td>Price without any additional services. Period is used for separating decimals.
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/Price/PackagePriceWithAllAdditionalServices/*<br/>//Product/NetPrice/PackagePriceWithAllAdditionalServices/*</td>
                    <td>Price with all requested additional services. Period is used for separating decimals.
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/Price/AdditionalServicePrices/*<br/>//Product/NetPrice/AdditionalServicePrices/*</td>
                    <td>Collection containing all requested additional services with respective prices.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/Price/AdditionalServicePrices/AdditionalService/AdditionalServiceId<br/>//Product/NetPrice/AdditionalServicePrices/AdditionalService/AdditionalServiceId</td>
                    <td>Additional service code.</td>
                    <td>POSTOPPKRAV</td>
                </tr>
                <tr>
                    <td>//Product/Price/AdditionalServicePrices/AdditionalService/AdditionalServicePrice<br/>//Product/NetPrice/AdditionalServicePrices/AdditionalService/AdditionalServicePrice</td>
                    <td>Price for the single additional service.</td>
                    <td></td>
                </tr>
                <tr>
                  <td>//Product/ExpectedDelivery/ExpectedDeliveryDate</td>
                  <td>Expected delivery date based on the request parameters (product, postalcodes and shipping date). Contains elements year, month, day.</td>
                  <td></td>
                </tr>
                <tr>
                    <td>//Product/ExpectedDelivery/WorkingDays</td>
                    <td>Number of working days from pickup to delivery. First day is day 0. NOTE! If this number is used, know that
                        there are special rules surrounding christmas, easter, shipments to Svalbard and certain other
                        destinations. If shipping date is specified in the request, then these rules are applied automatically
                        for you when calculating the expected delivery date.
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/ExpectedDelivery/FormattedExpectedDeliveryDate</td>
                    <td>Expected delivery date, preformatted.
                    </td>
                    <td>DD.MM.YYYY</td>
                </tr>
                <tr>
                    <td>//Product/ExpectedDelivery/UserMessage</td>
                    <td>Important message to end-user in requested language regarding delivery. We recommend this is forwarded
                        to the end-user.
                    </td>
                    <td>Usually empty response. In special cases a one-liner.</td>
                </tr>
                <tr>
                    <td>//Product/ExpectedDelivery/AlternativeDeliveryDates</td>
                    <td>Collection for alternate delivery dates if NumberOfAlternativeDeliveryDates is specified in request. In
                        practice this collection can be used to let the customer decide which day to receive the package. The
                        data structure also provides the sender when to deliver to the postal service in order to reach the
                        customer on the given day
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/ExpectedDelivery/AlternativeDeliveryDates/AlternativeDeliveryDate</td>
                    <td>An alternate delivery date.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/ExpectedDelivery/AlternativeDeliveryDates/AlternativeDeliveryDate/ShippingDate</td>
                    <td>The date the shop must ship the package by make the delivery date</td>
                    <td></td>
                </tr>
                <tr>
                    <td>//Product/ExpectedDelivery/AlternativeDeliveryDates/AlternativeDeliveryDate/ExpectedDeliveryDate</td>
                    <td>Estimated delivery date based on ShippingDate for alternate delivery dates.</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
