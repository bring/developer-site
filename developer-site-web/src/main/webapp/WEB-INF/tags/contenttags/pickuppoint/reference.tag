<%@ tag language="java" pageEncoding="UTF-8"%>

<pre class="code-box">Request prefix:
http://fraktguide.bring.no/fraktguide/api/pickuppoint</pre>

    <table>
        <thead>
        <tr>
            <th>Field</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>/postalcode/&lt;postalcode&gt;.&lt;extension&gt;</code></td>
            <td>Returns the 10 nearest pickup points based on the given postalcode.
                <ul>
                    <li><code>&lt;postalcode&gt;</code> = any valid postal code</li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr >
            <td><code>/location/&lt;latitude&gt;/&lt;longitude&gt;.&lt;extension&gt;</code></td>
            <td>Returns the 10 nearest pickup points based on the given location.
                <ul>
                    <li>
                        <code>&lt;latitude&gt;</code> = geographic coordinate specifying the north-south position.
                    </li>
                    <li><code>&lt;longitude&gt;</code> = geographic coordinate specifying the east-west position.
                    </li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                </ul>
            </td>
        </tr>
        <tr>
            <td><code>/id/&lt;id&gt;.&lt;extension&gt;</code></td>
            <td>Returns information about the pickup point based on the pickup point's id.
                <ul>
                    <li>
                        <code>&lt;id&gt;</code> = The pickup point's id.
                    </li>
                    <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
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
        <tr >
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
        <tr >
            <td><code>?openOnOrAfter=&lt;time&gt;</code></td>
            <td>Return only pickup points that are open on or before the specified time.
                <ul>
                    <li><code>&lt;time&gt;</code> = format: HHMM</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>