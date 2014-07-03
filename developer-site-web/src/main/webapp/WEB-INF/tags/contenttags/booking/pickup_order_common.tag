<%@ tag language="java" pageEncoding="UTF-8"%>
<p>The Pickup Order Api is for ordering a single pickup at a particular address.</p>
<p>
    Parcels Norway, Parcels Sweden, Parcels Denmark and Cargo Customers with a Mybring user ID can use this service.
    Customer numbers in this API is the same as to booking API, obtained either through your Mybring profile or
    the customer number API.
</p>
<p>Pickup in the different countries requires different customer numbers.</p>

<p><strong>Endpoint:</strong> <code class="inline-code">https://api.bring.com/booking/api/pickupOrder</code></p>

<table>
    <thead>
        <tr>
            <th>Customernumber prefix</th>
            <th>Pickup in country</th>
            <th>Required information element</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>PARCELS_NORWAY</td>
            <td>Norway (parcels)</td>
            <td><code>parcelsInformation</code></td>
        </tr>
        <tr>
            <td>CARGO</td>
            <td>Norway (cargo)</td>
            <td><code>cargoInformation</code></td>
        </tr>
        <tr>
            <td>
                PARCELS_NORWAY_INTERNATIONAL
                PARCELS_SWEDEN
                PARCELS_DENMARK
                PARCELS_FINLAND
                BRING_DENMARK_AS
            </td>
            <td>Sweden, Denmark</td>
            <td><code>parcelsInternationalInformation</code></td>
        </tr>
    </tbody>
</table>