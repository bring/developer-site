<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <misc:contenttype/> <misc:title value="Getting API-keys"/> <misc:css_v2/>
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="developer"/>

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box">
                        <h1>Getting and using API-keys</h1>
                    </div>

                    <div class="box">
                        <h2><a name="introduction"></a>Introduction</h2>

                        <p>Some of Bring APIs require an API-key for authentication. On this page we provide
                           information about getting API-keys and how to use them for authentication.</p>
                    </div>
                    <div class="box">
                        <h2><a name="getting"></a>Getting an API-key</h2>
                        <p><h4>Do you have a mybring-account?</h4>

                        <ul>
                            <li><b>No:</b></br> </br>If you are a developer hired to develop an application for a
                                                     company, you need the API-key associated with that companys mybring-account. Typically,
                                                     as a developer you do not have a mybring account, unless you are running your own
                                                     business and doing the development yourself. So step one is to register a mybring
                                                     account, or tell the company you work for to do so in order for you to get your
                                                     API-keys. To register a new user: </br></br>Please visit: <a
                                        href="https://www.mybring.com/useradmin/open/signup/new" target="_blank">https://www.mybring.com/useradmin/open/signup/new</a></br></br>

                                <div class="information-box">
                                    <b>What's mybring?</b></br>Mybring is a logged-in service for Bring's customers.
                                                               With MyBring the customers get improved possibility to follow up their own goods
                                                               flows, finance and quality. MyBring will also offer existing services such as
                                                               tracking and booking. After you have someone with access to a mybring account, you
                                                               may retrieve the API-key.
                                </div>

                            </li>
                            </br>
                            <li><p>
                                <b>Yes:</b></br></br>Follow the steps below to get the API-key. </p>
                            </li>
                            <h4>1. Log in to <a
                                    href="http://www.bring.com/all-of-bring/products-and-services/mybring"
                                    target="_blank">mybring</a></h4>
                            <img src="../images/mybringLogin.png" alt="Login Screenshot"></br></br>
                            <hr>
                            </br><h4>2. Go to your "profile"</h4>
                            <img src="../images/mybringApi1.png" alt="Mybring Profile Screenshot"></br></br>
                            <hr>
                            </br><h4>3. Get the API-key from the "my api-key" tab.</h4>
                            <img src="../images/mybringapiKey.png" alt="my api-key screenshot"></br></br>
                            <hr>
                            </br><h4>4. Generate the API-key.</h4>
                            <img src="../images/mybringapikeygeneration.png" alt="Key generation screenshot">
                            <hr>
                            </br><h4>5. You now got your API-key.</h4>
                            <img src="../images/mybringapikeyfinish.png" alt="api-key screenshot">
                        </ul>
                        <p>Still need help? Please contact the developer team: <b>developer@bring.com</b></p>
                    </div>


                    <div class="box">
                        <h2><a name="using"></a>Using API-keys</h2>
                        <p>After retrieving an API-key, you may use it to authenticate. We use the mybring authentication framework.
                           This is a proprietary single sign-on solution that applies two HTTP Headers for authentication to the API.
                           All mybring-APIs use a simple authentication-scheme.
                           By adding two headers to all requests, you will authenticate your request. </p>
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
                                <td>This is the mybring login ID.</td>
                            </tr>
                            <tr>
                                <td>X-MyBring-API-Key</td>
                                <td>1234abc-abcd-1234-5678-abcd1234abcd</td>
                                <td>This is the API key of the mybring user.</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>


                    <div class="box">
                    <h2><a name="buyer"></a>How to get authorized with the buyer role</h2>
                    <p>To be able to use the <b>Booking API</b> the customer (mybring user) needs to be authorized with the buyer role.
                    That means having the authorization to receive invoices on behalf of the company.
                    To get this authorization go to mybring and choose the tab "my authorizations" and the relevant company to extend/change the accesses for your customer-profile.
                    You have to check the box: "Receive invoices on behalf of the company" to be authorized with the buyer role.</p>
                    <img src="../images/buyer-role.png" alt="buyer role screenshot">
                        </br></br>
                        <div><p><em>If you're trying to retrieve the customer number with the Booking API and the customer does not have this authorization, an empty list is returned.</em>
                        </p></div>
                    </div>
                </div>
                <div class="span3">
                    <div id="sidebar">

                        <div class="sidebar box">
                            <h4>Getting and using API-keys</h4>
                            <ol>
                                <li><a href="#introduction">Introduction</a></li>
                                <li><a href="#getting">Getting an API-key</a></li>
                                <li><a href="#using">Using the API-key</a></li>
                                <li><a href="#buyer">How to get authorized with the buyer role</a></li>
                            </ol>
                        </div>
                        <misc:sidebar/>
                    </div>

                </div>

            </div>
        </section>
    </div>

</div>
</body>

<misc:footer_v2/> <misc:jqueryblob_v2/>

</html>