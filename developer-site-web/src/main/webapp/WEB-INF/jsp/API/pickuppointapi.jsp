<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Pickup Point API"/>
    <misc:css_v2/>
</head>

<body>

<div class="wrapper">

<misc:header_v2 selected_tab="developer"/>


<div id="page">
<section id="content">
<div class="row-fluid">

<div class="span9">

<div class="box">
    <h1>Pickup Point API</h1>
</div>

<div class="box">
    <h2>Introduction</h2>

    <p>The Pickup point API provides a list of the alternative locations for package pickup.
        Based on a specified postal code or a geographical location, the 10 nearest pickup points are returned.
        Response is available as either XML or JSON.</p>

    <p>A pickup point is defined as any location delivering shipments on behalf of Bring and Posten, such as post
        offices and selected grocery stores.</p>
</div>

<div class="box">

    <h2>Reference</h2>

    <p>Request prefix: <br/><code>http://fraktguide.bring.no/fraktguide/api/pickuppoint</code></p>
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
        <tr class="even">
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
            <td>Returns the 10 nearest pickup points based on the pickup point's id.
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
        <tr class="even">
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
        <tr class="even">
            <td><code>?openOnOrAfter=&lt;time&gt;</code></td>
            <td>Return only pickup points that are open on or before the specified time.
                <ul>
                    <li><code>&lt;time&gt;</code> = format: HHMM</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>

    <p>
</div>

<div class="box">
<h2>How to Use</h2>
<p>First you have to choose whether you want to use a postal code or geographical coordinates to find the 10
    nearest delivery locations.
    The following examples illustrate the different alternatives.
</p>



<div class="row no-back element-sample">
<h5>Example: USING THE POSTAL CODE</h5>
<p>Find pickup points based on the recipient's postal code, 1407 Vinterbro.<br>
    Request:<code>/api/pickuppoint/postalcode/1407.xml</code>
</p>
<ul class="tab-group" data-tabs="tabs">
    <li class="active"><a href="#tab1">xml</a></li>
    <li><a href="#tab2">json</a></li>
</ul>
<div class="tab-content minimal">
<div class="tab-pane active" id="tab1">
<pre class="prettify code-box">
                &lt;pickupPoints&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            121264
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Trollåsen
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0030
        &lt;/address&gt;
        &lt;postalCode&gt;
            1421
        &lt;/postalCode&gt;
        &lt;city&gt;
            TROLLÅSEN
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            OPPEGÅRD
        &lt;/municipality&gt;
        &lt;county&gt;
            AKERSHUS
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            TROLLÅSVEIEN 25
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            1414
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            TROLLÅSEN
        &lt;/visitingCity&gt;
        &lt;locationDescription&gt;
            0
        &lt;/locationDescription&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0900-2100, Lør: 0900-2000
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0900-2100, Sat: 0900-2000
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.817303967904237538
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.777527924211277366
        &lt;/longitude&gt;
        &lt;utmX&gt;
            263289
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6638610
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=121264
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.8173039679042,10.7775279242113
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            8.7
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            121355
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Fagerstrand
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0037
        &lt;/address&gt;
        &lt;postalCode&gt;
            1457
        &lt;/postalCode&gt;
        &lt;city&gt;
            FAGERSTRAND
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            FROGN
        &lt;/municipality&gt;
        &lt;county&gt;
            AKERSHUS
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            MYKLERUDVEIEN 65
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            1454
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            FAGERSTRAND
        &lt;/visitingCity&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0700-2300, Lør: 0700-2100
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0700-2300, Sat: 0700-2100
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.74220159712348277
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.603063676303182916
        &lt;/longitude&gt;
        &lt;utmX&gt;
            252963
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6630895
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=121355
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.7422015971235,10.6030636763032
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            9.4
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            121346
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Prinsdal
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0060 PRINSDAL
        &lt;/address&gt;
        &lt;postalCode&gt;
            1205
        &lt;/postalCode&gt;
        &lt;city&gt;
            OSLO
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            OSLO
        &lt;/municipality&gt;
        &lt;county&gt;
            OSLO
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            NEDRE PRINSDALS VEI 79
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            1263
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            OSLO
        &lt;/visitingCity&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0700-2300, Lør: 0900-2000
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0700-2300, Sat: 0900-2000
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.83315656422257689
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.807027266039179736
        &lt;/longitude&gt;
        &lt;utmX&gt;
            265053
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6640268
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=121346
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.8331565642226,10.8070272660392
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            10.6
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            121107
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Heggedal
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0013
        &lt;/address&gt;
        &lt;postalCode&gt;
            1380
        &lt;/postalCode&gt;
        &lt;city&gt;
            HEGGEDAL
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            ASKER
        &lt;/municipality&gt;
        &lt;county&gt;
            AKERSHUS
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            VOLLENVEIEN 184
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            1389
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            HEGGEDAL
        &lt;/visitingCity&gt;
        &lt;locationDescription&gt;
            Rød mursteinsbygning
        &lt;/locationDescription&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0700-2300, Lør: 0800-2100
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0700-2300, Sat: 0800-2100
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.786654774553383618
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.436353023973524046
        &lt;/longitude&gt;
        &lt;utmX&gt;
            243947
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6636471
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=121107
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.7866547745534,10.4363530239735
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            19.4
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            121352
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Gunerius
        &lt;/name&gt;
        &lt;address&gt;
            STORGATA 32
        &lt;/address&gt;
        &lt;postalCode&gt;
            0184
        &lt;/postalCode&gt;
        &lt;city&gt;
            OSLO
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            OSLO
        &lt;/municipality&gt;
        &lt;county&gt;
            OSLO
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            STORGATA 32
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            0184
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            OSLO
        &lt;/visitingCity&gt;
        &lt;locationDescription&gt;
            Ligger i underetasjen
        &lt;/locationDescription&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0800-2000, Lør: 1000-1800
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0800-2000, Sat: 1000-1800
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.914262970093140837
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.753022333118325449
        &lt;/longitude&gt;
        &lt;utmX&gt;
            262609
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6649481
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=121352
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9142629700931,10.7530223331183
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            19.4
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            173115
        &lt;/id&gt;
        &lt;name&gt;
            Grünerløkka postkontor
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 2024 GRÜNERLØKKA
        &lt;/address&gt;
        &lt;postalCode&gt;
            0505
        &lt;/postalCode&gt;
        &lt;city&gt;
            OSLO
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            OSLO
        &lt;/municipality&gt;
        &lt;county&gt;
            OSLO
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            MARKVEIEN 35 B
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            0554
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            OSLO
        &lt;/visitingCity&gt;
        &lt;locationDescription&gt;
            Postkontoret har flyttet 50 meter lengre ned i gaten ved Kiwi
        &lt;/locationDescription&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0900-1800, Lør: 1000-1500
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0900-1800, Sat: 1000-1500
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.92172556331060207
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.75718958087322541
        &lt;/longitude&gt;
        &lt;utmX&gt;
            262895
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6650296
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=173115
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9217255633106,10.7571895808732
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            20.3
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            174119
        &lt;/id&gt;
        &lt;name&gt;
            Bogstadveien postkontor
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0001 BOGSTADVEIEN
        &lt;/address&gt;
        &lt;postalCode&gt;
            0323
        &lt;/postalCode&gt;
        &lt;city&gt;
            OSLO
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            OSLO
        &lt;/municipality&gt;
        &lt;county&gt;
            OSLO
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            HEGDEHAUGSVEIEN 31
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            0352
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            OSLO
        &lt;/visitingCity&gt;
        &lt;locationDescription&gt;
            Kontoret ligger i samme bygning som KIWI og Peppes Pizza. Til venstre
        &lt;/locationDescription&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0900-1800, Lør: 0900-1500
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0900-1800, Sat: 0900-1500
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.92206519488609473
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.72737821301262251
        &lt;/longitude&gt;
        &lt;utmX&gt;
            261233
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6650441
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=174119
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9220651948861,10.7273782130126
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            20.4
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            122537
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Røykentorget
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0201
        &lt;/address&gt;
        &lt;postalCode&gt;
            3441
        &lt;/postalCode&gt;
        &lt;city&gt;
            RØYKEN
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            RØYKEN
        &lt;/municipality&gt;
        &lt;county&gt;
            BUSKERUD
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            SPIKKESTADVEIEN 80 A
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            3440
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            RØYKEN
        &lt;/visitingCity&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0700-2200, Lør: 0900-2100
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0700-2200, Sat: 0900-2100
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.746522993635537091
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.39026421590257776
        &lt;/longitude&gt;
        &lt;utmX&gt;
            241053
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6632188
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=122537
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.7465229936355,10.3902642159026
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            21.3
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            121357
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Lindeberg
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0060 LINDEBERG
        &lt;/address&gt;
        &lt;postalCode&gt;
            1007
        &lt;/postalCode&gt;
        &lt;city&gt;
            OSLO
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            OSLO
        &lt;/municipality&gt;
        &lt;county&gt;
            OSLO
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            JERIKOVEIEN 3
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            1067
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            OSLO
        &lt;/visitingCity&gt;
        &lt;locationDescription&gt;
            På senteret ved T-bane stasjon
        &lt;/locationDescription&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Fre: 0700-2200, Lør: 0900-2100
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Fri: 0700-2200, Sat: 0900-2100
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.932637211817592515
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.881383125519056065
        &lt;/longitude&gt;
        &lt;utmX&gt;
            269905
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6651071
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=121357
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9326372118176,10.8813831255191
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            22.3
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
    &lt;pickupPoint&gt;
        &lt;id&gt;
            121321
        &lt;/id&gt;
        &lt;name&gt;
            Kiwi Veitvet
        &lt;/name&gt;
        &lt;address&gt;
            POSTBOKS 0099 VEITVET
        &lt;/address&gt;
        &lt;postalCode&gt;
            0518
        &lt;/postalCode&gt;
        &lt;city&gt;
            OSLO
        &lt;/city&gt;
        &lt;countryCode&gt;
            NO
        &lt;/countryCode&gt;
        &lt;municipality&gt;
            OSLO
        &lt;/municipality&gt;
        &lt;county&gt;
            OSLO
        &lt;/county&gt;
        &lt;visitingAddress&gt;
            VEITVETVEIEN 8
        &lt;/visitingAddress&gt;
        &lt;visitingPostalCode&gt;
            0596
        &lt;/visitingPostalCode&gt;
        &lt;visitingCity&gt;
            OSLO
        &lt;/visitingCity&gt;
        &lt;openingHoursNorwegian&gt;
            Man - Lør: 0700-2300
        &lt;/openingHoursNorwegian&gt;
        &lt;openingHoursEnglish&gt;
            Mon - Sat: 0700-2300
        &lt;/openingHoursEnglish&gt;
        &lt;latitude&gt;
            59.943982063782705438
        &lt;/latitude&gt;
        &lt;longitude&gt;
            10.847822902488916341
        &lt;/longitude&gt;
        &lt;utmX&gt;
            268111
        &lt;/utmX&gt;
        &lt;utmY&gt;
            6652450
        &lt;/utmY&gt;
        &lt;postenMapsLink&gt;
            http://www.posten.no/kundeservice/kart?ID=121321
        &lt;/postenMapsLink&gt;
        &lt;googleMapsLink&gt;
            http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9439820637827,10.8478229024889
        &lt;/googleMapsLink&gt;
        &lt;distanceInKm&gt;
            23.1
        &lt;/distanceInKm&gt;
    &lt;/pickupPoint&gt;
&lt;/pickupPoints&gt;

                </pre>
</div>
<div class="tab-pane" id="tab2">

<pre class="prettify code-box">
                 {
    "pickupPoint": [
        {
            "id": "121264",
            "name": "Kiwi Trollåsen",
            "address": "POSTBOKS 0030",
            "postalCode": "1421",
            "city": "TROLLÅSEN",
            "countryCode": "NO",
            "municipality": "OPPEGÅRD",
            "county": "AKERSHUS",
            "visitingAddress": "TROLLÅSVEIEN 25",
            "visitingPostalCode": "1414",
            "visitingCity": "TROLLÅSEN",
            "locationDescription": "0",
            "openingHoursNorwegian": "Man - Fre: 0900-2100, Lør: 0900-2000",
            "openingHoursEnglish": "Mon - Fri: 0900-2100, Sat: 0900-2000",
            "latitude": 59.81730396790424,
            "longitude": 10.777527924211277,
            "utmX": "263289",
            "utmY": "6638610",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=121264",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.8173039679042,10.7775279242113",
            "distanceInKm": "8.7"
        },
        {
            "id": "121355",
            "name": "Kiwi Fagerstrand",
            "address": "POSTBOKS 0037",
            "postalCode": "1457",
            "city": "FAGERSTRAND",
            "countryCode": "NO",
            "municipality": "FROGN",
            "county": "AKERSHUS",
            "visitingAddress": "MYKLERUDVEIEN 65",
            "visitingPostalCode": "1454",
            "visitingCity": "FAGERSTRAND",
            "locationDescription": null,
            "openingHoursNorwegian": "Man - Fre: 0700-2300, Lør: 0700-2100",
            "openingHoursEnglish": "Mon - Fri: 0700-2300, Sat: 0700-2100",
            "latitude": 59.74220159712348,
            "longitude": 10.603063676303183,
            "utmX": "252963",
            "utmY": "6630895",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=121355",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.7422015971235,10.6030636763032",
            "distanceInKm": "9.4"
        },
        {
            "id": "121346",
            "name": "Kiwi Prinsdal",
            "address": "POSTBOKS 0060 PRINSDAL",
            "postalCode": "1205",
            "city": "OSLO",
            "countryCode": "NO",
            "municipality": "OSLO",
            "county": "OSLO",
            "visitingAddress": "NEDRE PRINSDALS VEI 79",
            "visitingPostalCode": "1263",
            "visitingCity": "OSLO",
            "locationDescription": null,
            "openingHoursNorwegian": "Man - Fre: 0700-2300, Lør: 0900-2000",
            "openingHoursEnglish": "Mon - Fri: 0700-2300, Sat: 0900-2000",
            "latitude": 59.83315656422258,
            "longitude": 10.80702726603918,
            "utmX": "265053",
            "utmY": "6640268",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=121346",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.8331565642226,10.8070272660392",
            "distanceInKm": "10.6"
        },
        {
            "id": "121107",
            "name": "Kiwi Heggedal",
            "address": "POSTBOKS 0013",
            "postalCode": "1380",
            "city": "HEGGEDAL",
            "countryCode": "NO",
            "municipality": "ASKER",
            "county": "AKERSHUS",
            "visitingAddress": "VOLLENVEIEN 184",
            "visitingPostalCode": "1389",
            "visitingCity": "HEGGEDAL",
            "locationDescription": "Rød mursteinsbygning",
            "openingHoursNorwegian": "Man - Fre: 0700-2300, Lør: 0800-2100",
            "openingHoursEnglish": "Mon - Fri: 0700-2300, Sat: 0800-2100",
            "latitude": 59.786654774553384,
            "longitude": 10.436353023973524,
            "utmX": "243947",
            "utmY": "6636471",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=121107",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.7866547745534,10.4363530239735",
            "distanceInKm": "19.4"
        },
        {
            "id": "121352",
            "name": "Kiwi Gunerius",
            "address": "STORGATA 32",
            "postalCode": "0184",
            "city": "OSLO",
            "countryCode": "NO",
            "municipality": "OSLO",
            "county": "OSLO",
            "visitingAddress": "STORGATA 32",
            "visitingPostalCode": "0184",
            "visitingCity": "OSLO",
            "locationDescription": "Ligger i underetasjen",
            "openingHoursNorwegian": "Man - Fre: 0800-2000, Lør: 1000-1800",
            "openingHoursEnglish": "Mon - Fri: 0800-2000, Sat: 1000-1800",
            "latitude": 59.91426297009314,
            "longitude": 10.753022333118325,
            "utmX": "262609",
            "utmY": "6649481",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=121352",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9142629700931,10.7530223331183",
            "distanceInKm": "19.4"
        },
        {
            "id": "173115",
            "name": "Grünerløkka postkontor",
            "address": "POSTBOKS 2024 GRÜNERLØKKA",
            "postalCode": "0505",
            "city": "OSLO",
            "countryCode": "NO",
            "municipality": "OSLO",
            "county": "OSLO",
            "visitingAddress": "MARKVEIEN 35 B",
            "visitingPostalCode": "0554",
            "visitingCity": "OSLO",
            "locationDescription": "Postkontoret har flyttet 50 meter lengre ned i gaten ved Kiwi",
            "openingHoursNorwegian": "Man - Fre: 0900-1800, Lør: 1000-1500",
            "openingHoursEnglish": "Mon - Fri: 0900-1800, Sat: 1000-1500",
            "latitude": 59.9217255633106,
            "longitude": 10.757189580873225,
            "utmX": "262895",
            "utmY": "6650296",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=173115",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9217255633106,10.7571895808732",
            "distanceInKm": "20.3"
        },
        {
            "id": "174119",
            "name": "Bogstadveien postkontor",
            "address": "POSTBOKS 0001 BOGSTADVEIEN",
            "postalCode": "0323",
            "city": "OSLO",
            "countryCode": "NO",
            "municipality": "OSLO",
            "county": "OSLO",
            "visitingAddress": "HEGDEHAUGSVEIEN 31",
            "visitingPostalCode": "0352",
            "visitingCity": "OSLO",
            "locationDescription": "Kontoret ligger i samme bygning som KIWI og Peppes Pizza. Til venstre",
            "openingHoursNorwegian": "Man - Fre: 0900-1800, Lør: 0900-1500",
            "openingHoursEnglish": "Mon - Fri: 0900-1800, Sat: 0900-1500",
            "latitude": 59.922065194886095,
            "longitude": 10.727378213012623,
            "utmX": "261233",
            "utmY": "6650441",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=174119",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9220651948861,10.7273782130126",
            "distanceInKm": "20.4"
        },
        {
            "id": "122537",
            "name": "Kiwi Røykentorget",
            "address": "POSTBOKS 0201",
            "postalCode": "3441",
            "city": "RØYKEN",
            "countryCode": "NO",
            "municipality": "RØYKEN",
            "county": "BUSKERUD",
            "visitingAddress": "SPIKKESTADVEIEN 80 A",
            "visitingPostalCode": "3440",
            "visitingCity": "RØYKEN",
            "locationDescription": null,
            "openingHoursNorwegian": "Man - Fre: 0700-2200, Lør: 0900-2100",
            "openingHoursEnglish": "Mon - Fri: 0700-2200, Sat: 0900-2100",
            "latitude": 59.74652299363554,
            "longitude": 10.390264215902578,
            "utmX": "241053",
            "utmY": "6632188",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=122537",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.7465229936355,10.3902642159026",
            "distanceInKm": "21.3"
        },
        {
            "id": "121357",
            "name": "Kiwi Lindeberg",
            "address": "POSTBOKS 0060 LINDEBERG",
            "postalCode": "1007",
            "city": "OSLO",
            "countryCode": "NO",
            "municipality": "OSLO",
            "county": "OSLO",
            "visitingAddress": "JERIKOVEIEN 3",
            "visitingPostalCode": "1067",
            "visitingCity": "OSLO",
            "locationDescription": "På senteret ved T-bane stasjon",
            "openingHoursNorwegian": "Man - Fre: 0700-2200, Lør: 0900-2100",
            "openingHoursEnglish": "Mon - Fri: 0700-2200, Sat: 0900-2100",
            "latitude": 59.93263721181759,
            "longitude": 10.881383125519056,
            "utmX": "269905",
            "utmY": "6651071",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=121357",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9326372118176,10.8813831255191",
            "distanceInKm": "22.3"
        },
        {
            "id": "121321",
            "name": "Kiwi Veitvet",
            "address": "POSTBOKS 0099 VEITVET",
            "postalCode": "0518",
            "city": "OSLO",
            "countryCode": "NO",
            "municipality": "OSLO",
            "county": "OSLO",
            "visitingAddress": "VEITVETVEIEN 8",
            "visitingPostalCode": "0596",
            "visitingCity": "OSLO",
            "locationDescription": null,
            "openingHoursNorwegian": "Man - Lør: 0700-2300",
            "openingHoursEnglish": "Mon - Sat: 0700-2300",
            "latitude": 59.943982063782705,
            "longitude": 10.847822902488916,
            "utmX": "268111",
            "utmY": "6652450",
            "postenMapsLink": "http://www.posten.no/kundeservice/kart?ID=121321",
            "googleMapsLink": "http://maps.google.com/maps?f=q&amp;hl=en&amp;geocode=&amp;q=59.9439820637827,10.8478229024889",
            "distanceInKm": "23.1"
        }
    ]
}
                </pre>
</div>
</div>
</div>




<h5>Example: USING THE POSTAL CODE</h5>

<p>Find pickup points based on the recipient's postal code, 1407 Vinterbro.

<p/>

<p>Request: /api/pickuppoint/postalcode/1407.xml

<p/>

<p>Response: ...

<p/>


<h5>Example: USING GEOGRAPHICAL COORDINATES</h5>

<p>Find pickup points based on the recipient's geographical coordinates, Bergen city (60.395226, 5.321725)

<p/>

<p>Request: /api/pickuppoint/location/60.395226/5.321725.xml

<p/>

<p>Response: ...

<p/>

<p><h4>Using filters</h4>In addition to postal code or location, one or more optional parameters can be added to
the request.
These parameters can be perceived as &quot;filters&quot;, adding additional restrictions to the pickup points
being returned.
One such parameter is <code>searchForText=q&lt;texts&gt;</code>, resulting in a response where all pickup points
have at least a partial match with the search string given in &lt;texts&gt;.
This can be the name of the pickup point, its address, city, county, municipality or location. Go to the
reference table or see additional examples for more information
</p>

<div style="border: 1px solid; padding: 2px">
    <b>Note! </b>If you want to add more than one parameter at the end of a request, separate the subsequent
    parameters using <code>&</code>. For instance: <code>/api/pickuppoint/postalcode/1407.xml?searchForText=&quot;Kiwi&quot;<b>&</b>openOnOrBefore=0800</code>
</div>

<h4>Using the pickup point's id</h4>

<p>If you already know the id of the pickup point, you can retrieve more information such as the geographical
    location, opening hours and county.</p>
<h5>Example: USING ID TO RETRIEVE INFORMATION ABOUT A PICKUP POINT</h5>

<p>Retrieve more information about the pickup point based on its id, 121110</p>

<p>Request: /api/pickuppoint/id/121110.xml</p>

<p>Response: ...</p>

</div>

<div class="box">
    <h2>Additional examples</h2>
    <ul class="menu-group collapsing">


        <li>
            <a href="#" class="menu item"><h4>Find pickup points containing a specified string</h4></a>

            <div class="content-box">
                <p>If you want to return only the pickup points matching a specified string, you may add <code>?searchForText=&lt;text
                    to match&gt;</code> to the request.
                    The string in the <code>&lt;text to match&gt;</code> can be the name of the pickup point, its
                    address, city, county, municipality or location. Partial matches are also allowed.<br><br>
                    Example below: FIND THE PICKUP POINTS NEAR POSTAL CODE 1407 CONTAINING &quot;KIWI&quot;.<br><br>
                    Request: /api/pickuppoint/postalcode/1407.xml?searchForText=KIWI<br><br>
                    Response: ...
                </p>

            </div>
        </li>

        <li>
            <a href="#" class="menu item"><h4>Find pickup points open on specified days</h4></a>

            <div class="content-box">
                <p>If you want to return only the pickup points open on specified days, you may add <code>?openingHoursSearchType=&lt;day&gt;</code>
                    to the request.<br><br>
                    <code>&lt;day&gt; = ALL_WEEKDAYS (default) | MONDAY | TUESDAY | WEDNESDAY | THURSDAY | FRIDAY |
                        SATURDAY | SUNDAY</code><br><br>
                    If you want you can also add openOnOrBefore and / or openOnOrAfter, to limit the search even
                    more.<br><br>
                    Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON SUNDAYS.<br><br>
                    Request: /api/pickuppoint/postalcode/1407.xml?openingHoursSearchType=SUNDAY<br><br>
                    Response: ...
                </p>
            </div>
        </li>

        <li>
            <a href="#" class="menu item"><h4>Find pickup points open at specific hours</h4></a>

            <div class="content-box">
                <p>If you want to return only the pickup points open on specific hours, you may add <code>?openOnOrBefore=&lt;time&gt;</code>
                    and/or <code>?openOnOrAfter=&lt;time&gt;</code> to the request.<br><br>
                    <code>&lt;time&gt; = HHMM</code><br><br>
                    Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR BEFORE 08.00<br><br>
                    Request: /api/pickuppoint/postalcode/1407.xml?openOnOrBefore=0800<br><br>
                    Response: ...
                    <br>
                    Example below: PICKUP POINTS NEAR POSTAL CODE 1407 OPEN ON OR AFTER 22.00
                    Request: /api/pickuppoint/postalcode/1407.xml?openOnOrAfter=2200
                    Response: ...
                </p>
            </div>
        </li>
    </ul>


</div>



</div>


<div class="span3 box">
    <div id="additional-resources">
        <h2>Additonal Resources</h2>

        <h3>Widgets</h3>
        <ul>
            <li><a href="../widget/choose-pickup-point.html">Choose Pickup Point</a></li>
            <li><a href="../widget/choose-pickup-point-with-map.html">Choose Pickup Point With Map</a></li>
        </ul>
    </div>
</div>
</div>


</section>
</div>

</div>


<misc:footer/>
<misc:jqueryblob_v2/>

<script type="text/javascript"> $(function () {
// Hides all content boxes that are not selected
    $('.menu-group.collapsing a:not(.selected) + .content-box').hide();
    $('.menu-group.collapsing a').click(function (e) {
        $(this).toggleClass('selected').siblings('.content-box').slideToggle();
        e.preventDefault();
    });
});
prettyPrint();

</script>

</body>
</html>