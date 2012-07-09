<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8" %>
<%@ taglib prefix = "misc" tagdir = "/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value = "Fraktpriser for osCommerce"/>
    <misc:css_v2/>
</head>


<body>

<div class = "wrapper">

    <misc:header_v2 selected_tab = "developer"/>

    <div id = "page">
        <section id = "content">
            <div class = "row-fluid">
                <div class = "span9">

                    <div class = "box">
                        <h1>Fraktpriser for osCommerce</h1>

                        <p>
                            This osCommerece module adds the possibility of letting users pick their preferred shipping
                            method. It connects to Bring's Shipping Guide API to fetch prices, estimated delivery times
                            and product descriptions.
                        </p>
                    </div>

                    <div class = "box">
                        <h4>How to install</h4>
                        <ol>
                            <li>First backup your osCommerce install.</li>
                            <li>Download and extract the plugin.</li>
                            <li>Upload the <code>catalog</code> folder from the extracted plugin to your osCommerce webshop's root directory.</li>
                            <li>Follow the instructions in the <code>lesmeg.txt</code> file in the package.</li>
                        </ol>
                    </div>

                    <div class = "box">

                        <h4>Screenshot</h4>

                        <div class = "box lightBorder">
                            <img class = "fitted-width"
                                 src = ""/>
                        </div>
                    </div>
                </div>

                <div class = "span3 box">
                    <h4>Made by</h4>
                    <ul>
                        <li>
                        </li>
                        <li>
                        </li>
                    </ul>
                    <div class = "box">
                        <a href = ""
                           class = "btn enhanced">Download</a>
                        <br/>
                        <br/>
                        <a href = "" class = "btn">Repository</a>
                    </div>
                </div>

            </div>

        </section>
    </div>


</div>

<misc:footer/>
<misc:jqueryblob_v2/>

</body>
</html>