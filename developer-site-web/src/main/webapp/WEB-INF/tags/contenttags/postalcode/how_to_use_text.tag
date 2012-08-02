<%@ tag language="java" pageEncoding="UTF-8"%>
<p>You have to specify the postal code and the country code to find the location with this API.<br/><br/> The
        following countries are supported:</p>

        <ul>
            <li><code>NO</code> - Norway</li>
            <li><code>DK</code> - Denmark</li>
            <li><code>SE</code> - Sweden</li>
            <li><code>FI</code> - Finland</li>
            <li><code>NL</code> - Netherlands</li>
            <li><code>DE</code> - Germany</li>
            <li><code>US</code> - United States</li>
            <li><code>BE</code> - Belgium</li>
        </ul>

        <p>The service uses <a target="_blank" href="http://www.geonames.org/">GeoNames</a> as source for all countries
            except Norway.</p>

        <p>For unsupported countries, all postal codes will be marked as valid with no city name returned. In these
            cases it is recommended to prompt the user to input the city name himself/herself.</p><br/>

        <p>To illustrate in a simple matter how to use this API, we provide an example.</p>