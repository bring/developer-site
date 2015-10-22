<%@ tag language="java" pageEncoding="UTF-8"%>

<pre class="code-box">Request prefix:
    https://api.bring.com/pickuppoint/api/pickuppoint</pre>

    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>/&lt;countryCode&gt;/postalCode/&lt;postalCode&gt;.&lt;extension&gt;</code></td>
            <td>Returns the 10 nearest pickup points based on the given postal code.
                <ul>
                    <li><code>&lt;countryCode&gt;</code> = a valid ISO 3166-1 country code; NO, DK, SE and FI supported</li>
                    <li><code>&lt;postalCode&gt;</code> = any valid postal code in specified country</li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr >
            <td><code>/&lt;countryCode&gt;/location/&lt;latitude&gt;,&lt;longitude&gt;.&lt;extension&gt;</code></td>
            <td>Returns the 10 nearest pickup points based on the given location.
                <ul>
                    <li><code>&lt;countryCode&gt;</code> = a valid ISO 3166-1 country code; NO, DK and FI supported</li>
                    <li><code>&lt;latitude&gt;</code> = geographic coordinate specifying the north-south position.</li>
                    <li><code>&lt;longitude&gt;</code> = geographic coordinate specifying the east-west position.</li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/&lt;countryCode&gt;/id/&lt;id&gt;.&lt;extension&gt;</code></td>
            <td>Returns information about the pickup point based on the pickup point's id.
                <ul>
                  <li><code>&lt;countryCode&gt;</code> = a valid ISO 3166-1 country code; NO, DK, SE and FI supported</li>
                  <li><code>&lt;id&gt;</code> = The pickup point's id.</li>
                  <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/&lt;countryCode&gt;/all</code></td>
            <td>Returns information about all pickup points in a country
                <ul>
                  <li><code>&lt;countryCode&gt;</code> = a valid ISO 3166-1 country code; NO, DK and FI supported</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>

    <table>
        <thead>
        <tr>
            <th>Optional filter</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>?searchForText=&lt;text&gt;</code></td>
            <td>Return only pickup points containing the specified text.
                <ul>
                    <li><code>&lt;text&gt;</code> = name, address, city, municipality name, county name or location
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?openingHoursSearchType=&lt;day&gt;</code></td>
            <td>Return only pickup points that are open on the specified day.
                <ul>
                    <li><code>&lt;day&gt;</code> = ALL_WEEKDAYS | MONDAY | TUESDAY | WEDNESDAY | THURSDAY | FRIDAY |
                                                 SATURDAY | SUNDAY
                    </li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?openOnOrBefore=&lt;time&gt;</code></td>
            <td>Return only pickup points that are open on or before the specified time.
                <ul>
                    <li><code>&lt;time&gt;</code> = format: HHMM</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?openOnOrAfter=&lt;time&gt;</code></td>
            <td>Return only pickup points that are open on or before the specified time.
                <ul>
                    <li><code>&lt;time&gt;</code> = format: HHMM</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?numberOfResponses=&lt;integer&gt;</code></td>
            <td>Return the number of specified responses instead of the default 10.
                <ul>
                    <li><code>&lt;integer&gt;</code> = number between 1 and 100</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?street=&lt;street&gt;</code></td>
            <td>Searches for the nearest pickup points to the street with name = <code>&lt;street&gt;</code>
                <ul>
                    <li><code>&lt;street&gt;</code> = The street name to find nearest pickup points for. The street name supports partial searches by specifying a wildcard "*". Supported countries are DK and SE.</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?streetNumber=&lt;streetNumber&gt;</code></td>
            <td>Searches for the nearest pickup points to the street with street number = <code>&lt;streetNumber&gt;</code>
                <ul>
                    <li><code>&lt;streetNumber&gt;</code> = The street number to find pickup points for. The street number supports partial searches by specifying a wildcard "*". Supported countries are DK and SE.</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?callback=&lt;callback&gt;</code></td>
            <td>Support for JSONP
                <ul>
                    <li><code>&lt;callback&gt;</code> = The name of the function that should be called on the client side</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>?pickupPointType=&lt;manned|locker&gt;</code></td>
            <td>Support for JSONP
                <ul>
                    <li><code>&lt;manned|locker&gt;</code> = manned means Manned pickup point, locker means Digital locker pickup point. </li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>

    <p>
        New field <code>&lt;distanceType&gt;&lt;/distanceType&gt;</code> is added in the response which specifies whether distance return by pickup point api is driving distance using road/ferries or
        it is the aerial distance between source and pickup points.<br />
        At present driving distance is returned only for Denmark and Sweden. If driving distance is not available for a pickup point then aerial distance is returned.
    </p>