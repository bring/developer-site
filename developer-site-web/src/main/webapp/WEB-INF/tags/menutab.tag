<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ attribute name="section" required="true" type="java.lang.String" rtexprvalue="true" %>
<%@ attribute name="breadcrumbs" required="true" type="java.lang.String" rtexprvalue="true" %>
<%

// java.util.Map<String,String[]> menu = new java.util.HashMap<String,String[]>();
// menu.put("1", new String[]{"Shipping guide API", "#"});
// menu.put("1.1", new String[]{"Shipping Introduction", "#"});
// menu.put("1.2", new String[]{"Shipping test", "/home.html"});

// menu.put("2", new String[]{"Tracking API beta", "#"});

// menu.put("3", new String[]{"Postal code validate API", "#"});

// menu.put("4", new String[]{"Post office chooser API", "#"});
%>

<div class="navigation-tabs">
        <misc:breadcrumbs level1="Tracking beta" level2="Introduction" />
        
        <div id="learn" class="menubox">
            <ul class="menulist level1">
                <li>
                    <a class="menubutton" href="/learn/shippingguide/index.html">Shipping guide API</a>
                    <ul class="level2">
                        <li>
                            <a class="menubutton" href="#">Shipping Introduction</a>
                            <ul class="level3">
                                <li>
                                    <a class="menubutton" href="index.html">Shipping test</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a class="menubutton" href="#">Tracking API beta</a>
                    <ul class="level2">
                        <li>
                            <a class="menubutton" href="index.html">Introduction</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a class="menubutton" href="/learn/postalcodevalidation/index.html">Postal code validate API</a>
                </li>
                
                <li>
                    <a class="menubutton" href="/learn/postofficechooser/index.html">Post office chooser API</a>
                </li>
            </ul>
        </div>
        
        <div id="download" class="menubox">
            <ul class="menulist">
                <li><a class="menubutton" href="https://github.com/bring/open-java-api">Java client library (github)</a></li>
            </ul>
        </div>
        
        <misc:talk />
    </div>
