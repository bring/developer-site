<%@ taglib prefix="tracking" tagdir="/WEB-INF/tags/contenttags/tracking" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sidebar" tagdir="/WEB-INF/tags/sidebars" %>
<!DOCTYPE html>
<html>

<head>
    <misc:contenttype/> <misc:title value="Tracking API"/> <misc:css_v2/>
</head>
<body>

<div class="wrapper">
<misc:header_v2 selected_tab="developer"/>
<div id="page">
<section id="content">
<div class="row-fluid">
<div class="span9">
<div class="box">
    <h1>Tracking API</h1>
</div>

<div class="box">
    <h2><a name="introduction"></a>Introduction</h2>
    <tracking:introduction/>
</div>

<div class="multitabs">

<ul class="tab-group">
    <li><a href="#xml" data-tab="xml">XML</a></li>
    <li><a href="#json" data-tab="json">JSON</a></li>
</ul>

 <div class="box">
    <h2><a name="reference"></a>
        Reference</h2>
    <tracking:reference/>
    <hr>

    <h2><a name="HTU"></a>
        How to Use</h2>
    <p>For testing you can use "TESTPACKAGE-AT-PICKUPPOINT" as the tracking number to generate test results. For real
    tracking this must be a valid number.</p>

    <h4>Example: TRACK A SHIPMENT</h4>
    <p>This example is showing a package waiting to be collected at the pickup point .</p>
    <tracking:how_to_use_example_xml/>
    <tracking:how_to_use_example_json/>

    <hr>
    <h2><a name="additionalExamples"></a>
        Additional examples</h2>
    <p>The parcel numbers used in the examples are static identifiers, and will always return the same result. These
       examples are recommended to use for integration testing.</p>
    <tracking:additional_examples_xml/>
    <tracking:additional_examples_json/>

    <h2><a name="loggedInTracking"></a>
        Logged in tracking</h2>
     <p>If you are a user of MyBring you can logg in with your username and api-key to performe tracking.
        Then you will get more specified information about your parcels. And do not have the same limmitation
        of number of requests in a given time frame.<br>
        Note for the signed in tracking you have to add your username and API-Key as header.
        <a href="http://developer.bring.com/additionalresources/getting-api-keys.html"> How to get an API-KEY </a><br/>
        You also have to use the following url:<BR/>
        <a href="https://www.mybring.com/tracking/api/tracking.xml?q=TESTPACKAGE-AT-PICKUPPOINT">https://www.mybring.com/tracking/api/tracking.xml?q=TESTPACKAGE-AT-PICKUPPOINT</a>
     </p>

     <table>
         <thead>
         <tr>
             <th>Header name</th>
             <th>Example header value</th>
             <th>Comment</th>
         </tr>
         </thead>
         <tbody>
         <tr>
             <td>X-MyBring-API-Uid</td>
             <td>example@customer.com</td>
             <td>This is the Mybring login ID.</td>
         </tr>
         <tr>
             <td>X-MyBring-API-Key</td>
             <td>1234abc-abcd-1234-5678-abcd1234abcd</td>
             <td>This is the API key of the Mybring user.</td>
         </tr>
         </tbody>
     </table>

 </div>

</div>
</div>

<div class="span3" id="additional-resources">
    <div id="sidebar">
        <sidebar:tracking-sidebar />
    </div>
</div>


</div>
</section>
</div>
</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>
