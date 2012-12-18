<%@ tag language="java" pageEncoding="UTF-8"%>
<div data-tab="soap">

        <div class="api-call">
        <h5>Request Reference</h5>
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
                    <td>Identificator String</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/RequestProperties/*</td>
                    <td>Contains optional elements that can be used to affect the response</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/RequestProperties/Language</td>
                    <td>Language of the response. At the moment, only Norwegian is supported.</td>
                    <td>no</td>
                </tr>
                <tr>
                    <td>/RequestProperties/WithPrice/</td>
                    <td>Flag to indicate if prices should be returned.</td>
                    <td>true</td>
                </tr>
                <tr>
                    <td>/RequestProperties/ WithExpectedDelivery</td>
                    <td>Flag to indicate if expected deliver date is to be returned</td>
                    <td>true
                    </td>
                </tr>
                <tr>
                    <td>/RequestProperties/ NumberOfAlternativeDeliveryDates/</td>
                    <td>Number of ”ShipmentDates” the service should calculate. Max value is 9</td>
                    <td>0</td>
                </tr>
                <tr>
                    <td>/RequestProperties/EDI</td>
                    <td>Flag to indicate if the packages are to be sent via EDI</td>
                    <td>true
                    </td>
                </tr>
                <tr>
                    <td>/RequestProperties/PostingAtPostoffice</td>
                    <td>Flag to indicate that the packages will be delivered to a post office (may affect the price in
                        certain cases)
                    </td>
                    <td>false
                    </td>
                </tr>
                <tr>
                    <td>/ProductIds/ProductId</td>
                    <td>List of Product IDs you wish to get alternatives for. See more in table below.</td>
                    <td>No defaults – required field</td>
                </tr>
                <tr>
                    <td>/Packages/Package/@packageId</td>
                    <td>If you ship more than one package, you can add a reference to each package. This reference will be
                        included in the response. Maximum 10 Package elements for each request.
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
                    <td>Volume of package in dm <sup>3</sup></td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/VolumeSpecial</td>
                    <td>Flag to indicate if the package has a shape that may require 'special handling fee'</td>
                    <td>false</td>
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
                        given, you will receive a ”ExpectedDelivery” element in ShippingGuideResponse
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/AdditionalServices/*</td>
                    <td>Element containing additional services you wish to request the prices for.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/AdditionalServices/ AdditionalServiceId</td>
                    <td>Id of additional service you request the price for. See table below.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/AdditionalServices/ AdditionalServiceParameters/*</td>
                    <td>Parameters for the respective additional service. (For future use).</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/EarlyCollectionAtTerminal</td>
                    <td>Postalcode for terminal. If you have an agreement for same-day delivery, and ship a &quot;På Døren&quot;
                        (To the Door) package to the Oslo terminal – within the deadline of the agreement; use code 0024 in this
                        field. Using this field currently only affects shipment times for these packages.
                    </td>
                    <td></td>
                </tr>
        </table>

        <h5>Response Reference</h5>
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
                    <td>Contains the requested packages</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/*</td>
                    <td>A single package. The attribute packageId contains the reference you specified in the request</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Package/Product/*</td>
                    <td>Information about the product. Can contain 0-n products.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ProductId</td>
                    <td>Product ID. See table below.</td>
                    <td>SERVICE PAKKE</td>
                </tr>
                <tr>
                    <td>/Packages/Product/GuiInformation/*</td>
                    <td>Product texts. See more complete description below.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/Price/*</td>
                    <td>Collection for all information related to prices.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/Price/ PackagePriceWithoutAdditionalServices/*</td>
                    <td>Price without any additional services All prices are given -without value added tax (VAT), -with VAT as
                        well as -VAT itself specified. Period is used for separating decimals.
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/Price/ PackagePriceWithAllAdditionalServices/*</td>
                    <td>Price with all requested additional services All prices are given -without value added tax (VAT), -with
                        VAT as well as -VAT itself specified. Period is used for separating decimals.
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ Price/AdditionalServicePrices/*</td>
                    <td>Collection containing all requested additional services with respective prices</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ Price/AdditionalServicePrices/ AdditionalService/AdditionalServiceId</td>
                    <td>Id of additional service.</td>
                    <td>POST OPPKRAV</td>
                </tr>
                <tr>
                    <td>/Packages/Product/ Price/AdditionalServicePrices/ AdditionalService/AdditionalServicePrice</td>
                    <td>Price for the single additional service.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/*</td>
                    <td>Collection for all information related to delivery time</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ WorkingDays</td>
                    <td>Number of week days from pickup to delivery. First day is day 0. NOTE! If this number is used, know that
                        there are special rules surrounding christmas, easter, shipments to Svalbard and certain other
                        destinations. For the complete picture of delivery time, it is important that the message in UserMessage
                        is made available to the end user
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ FormattedExpectedDeliveryDate</td>
                    <td>Expected delivery date based on the request parameters (product, postalcodes and ShipmentDate). This
                        field is preformatted.
                    </td>
                    <td>DD.MM.YYYY</td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ ExpectedDeliveryDate</td>
                    <td>Expected delivery date based on request parameters. Contains elements year, month, day.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ UserMessage</td>
                    <td>Important message to end-user in requested language regarding delivery. We recommend this is forwarded
                        to the end-user.
                    </td>
                    <td>Usually empty response. In special cases a one-liner.</td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ AlternativeDeliveryDates</td>
                    <td>Collection for alternate delivery dates if NumberOfAlternativeDeliveryDates is specified in request. In
                        practise this collection can be used to let the customer decide which day to receive the package. The
                        data structure also provides the sender when to deliver to the postal service in order to reach the
                        customer on the given day
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ AlternativeDeliveryDates/ AlternativeDeliveryDate</td>
                    <td>An alternate delivery date.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ AlternativeDeliveryDates/ AlternativeDeliveryDate/ShippingDate</td>
                    <td>The date the shop must ship the package by make the delivery date</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ AlternativeDeliveryDates/ AlternativeDeliveryDate/
                        ExpectedDeliveryDate
                    </td>
                    <td>Estimated delivery date based on ShippingDate for alternate delivery dates.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>/Packages/Product/ExpectedDelivery/ AlternativeDeliveryDates/ AlternativeDeliveryDate/UserMessage</td>
                    <td>See (...)/ExpectedDelivery/UserMessage</td>
                    <td></td>
                </tr>
            </tbody>
        </table>

        <hr>
        </div>
        </div>