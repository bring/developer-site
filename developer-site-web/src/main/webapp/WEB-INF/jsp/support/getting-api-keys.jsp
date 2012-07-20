<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <misc:contenttype/> <misc:title value="Getting API-keys"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="support"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>Getting API-keys</h1>
                    </div>

                    <div class="box">
                        <h2>Introduction</h2>
                        <p>On this page you will find information on how to get your API-key for the APIs requesting one.</p>
                    </div>
                    <div class="box">
                        <p><h4>Do you have a mybring-account?</h4>

                        <ul>
                            <li><b>No:</b></br> </br>
                                Then you need to get access to one. The customer dealing with shipments need to become a mybring user and then retrieve the API-key from the user profile on your behalf. With the API-key you will get access to the APIs.
                                You need to register a new user connected to the customer number. </br></br>Please visit: <a href="https://www.mybring.com/useradmin/open/signup/new" target="_blank">https://www.mybring.com/useradmin/open/signup/new</a>
                                </br></br>
                                <div class="information-box">
                                    <b>What's mybring?</b></br>
                                    Mybring is a logged-in service for Bring's customers. With MyBring the customers get improved possibility to follow up their own goods flows, finance and quality.
                                    MyBring will also offer existing services such as tracking and booking. After you have someone with access to a mybring account, you may retrieve your API-key.
                                </div>
                            </li>
                            </br>
                            <li><p>
                                <b>Yes:</b></br></br>
                            Below is a step-by-step guide on how to get the API-key.
                            </p>
                            </li>
                            </br>

                            <h4>1. First you have to Log in to <a href="http://www.bring.com/all-of-bring/products-and-services/mybring" target="_blank">mybring</a></h4>
                            <img src="../images/mybringLogin.png" alt="Login Screenshot">
                            </br></br><hr></br>
                            <h4>2. Then you go to your profile</h4>
                            <img src="../images/mybringApi1.png" alt="Mybring Profile Screenshot">
                            </br></br><hr></br>
                            <h4>3. Get the API-key from the "my api-key" tag.</h4>
                            <img src="../images/mybringapiKey.png" alt="my api-key screenshot">
                            </p>
                        </ul>
                    </div>
                </div>
                <div class="span3">
                    <div class="sidebar" id="sidebar">
                        <div class="box">
                            <a class="black" href="/support.html">
                                <h4>Support</h4>
                            </a>
                        </div>
                        <div class="box">
                            <h2>Additional Resources</h2>
                            <ul>
                                <li><a href="http://getsatisfaction.com/bring">GetSatisfaction</a></li>
                                <li><a href="support/getting-api-keys.html">Getting an API-key</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>

</div>
</body>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</html>