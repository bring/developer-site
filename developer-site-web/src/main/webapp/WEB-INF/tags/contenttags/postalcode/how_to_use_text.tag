<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="postalcode" tagdir="/WEB-INF/tags/contenttags/postalcode" %>

<p>The following countries are supported:</p>
<ul>
  <li><code>NO</code> - Norway</li>
  <li><code>DK</code> - Denmark</li>
  <li><code>SE</code> - Sweden</li>
  <li><code>FI</code> - Finland</li>
  <li><code>NL</code> - Netherlands</li>
  <li><code>DE</code> - Germany</li>
  <li><code>US</code> - United States</li>
  <li><code>BE</code> - Belgium</li>
  <li><code>FO</code> - Faroe Islands</li>
  <li><code>GL</code> - Greenland</li>
</ul>

<p>The service uses <a target="_blank" href="http://www.geonames.org/">GeoNames</a> as source for all countries
    except Norway.</p>

<div class="information-box">For unsupported countries (countries not in the list above), all postal codes will be
  marked as valid with no city name returned. In these cases it is recommended to prompt the user to input the city
  name himself/herself.</div>

<p>For countries that have multiple results (cities) for a given postal code, a list of cities will be returned.
  See example below.</p>
