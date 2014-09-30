<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/> <misc:title value="Tracking widget"/> <misc:css_v2/>
  <script src="../../../bower_components/platform/platform.js"></script>
  <link rel="import" href="../../../bower_components/posten-tracking/posten-tracking.html">
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">

                    <div class="box">
                        <h1>Tracking widget</h1>
                    </div>

                    <div id="tracking-demo" class="box">
                        <div class="content-box">
                          <h1>About</h1>
                          <ul>
                            <li>Show actual shipment tracking information on your own site or webshop</li>
                            <li>Ideal for order status/history in webshops</li>
                            <li>Use both as a tracking search widget, or prefilled with existing tracking number</li>
                            <li>Supports norwegian and english</li>
                            <li>Style to fit your needs</li>
                            <li>Supports all modern browsers. IE9 <i>may</i> work, but 10 or higher is supported/recommended. <a href="https://www.polymer-project.org/resources/compatibility.html">Compatibility notes.</a></li>
                            <li>Open source and free to modify</li>
                          </ul>

                          <h1>Download and documentation</h1>
                          <p></p><a href="https://github.com/bring/tracking-web-component" target="_blank">GitHub</a></p>


                          <h1>Demo</h1>

                          <h2>Search box, no prefilled tracking number</h2>
                          <posten-tracking language="en"></posten-tracking>
                          <h2>Prefilled with tracking number</h2>
                          <posten-tracking trackingNumber="TESTPACKAGE-AT-PICKUPPOINT" language="en"></posten-tracking>

                          <p class="license">
                            The MIT License (MIT)<br><br>

                            Copyright (c) 2014 Posten Norge AS<br><br>

                            Permission is hereby granted, free of charge, to any person obtaining a copy
                            of this software and associated documentation files (the "Software"), to deal
                            in the Software without restriction, including without limitation the rights
                            to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                            copies of the Software, and to permit persons to whom the Software is
                            furnished to do so, subject to the following conditions:<br><br>

                            The above copyright notice and this permission notice shall be included in
                            all copies or substantial portions of the Software.<br><br>

                            THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                            IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                            FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                            AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                            LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                            OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
                            THE SOFTWARE.
                          </p>
                        </div>
                    </div>
                </div>

                <div class="span3">
                    <div id="sidebar">
                        <misc:sidebar />
                    </div>
                </div>

            </div>

        </section>
    </div>

</div>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</body>
</html>