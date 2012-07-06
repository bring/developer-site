<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Reports API"/>
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
                        <h1>Reports API</h1>
                    </div>

                    <div class="box">
                        <h2>Introduction</h2>
                        <p>The API lets you view customer accounts associated with your account, find available reports for those accounts and generate and download reports. This is a step-by-step guide on how to use the API.
                        </p>

                        <div class="information-box"><p><b>Note!</b> The Reports API is currently in closed BETA testing. Please contact us at fraktguide@posten.no if you are interested in testing this service</p>
                        </div>

                    </div>

                    <div class="box">
                        <h2>Reference</h2>

                        <p>Common headers for all requests:</p>
                        <table>
                            <thead>
                            <tr>
                                <th>Header</th>
                                <th>Description</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><code>Accept: application/&lt;extension&gt;</code></td>
                                <td>Choose response format.
                                    <ul>
                                        <li><code>&lt;extension&gt;</code> = <code>xml</code> or <code>json</code></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <code>Accept-Language: &lt;lang_code&gt;,&lt;lang_code&gt;</code>
                                </td>
                                <td>
                                    Choose language for text-fields in the responses.
                                    <ul>
                                        <li><code>&lt;lang_code&gt;</code> = a language code such as <code>no</code> for norwegian and <code>en</code> for english.</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <code>X-MyBring-API-Uid: &lt;user@email.com&gt;</code>
                                </td>
                                <td>Specify your email adress.
                                    <ul>
                                        <li>
                                            <code>&lt;user@email.com&gt;</code> = the users email address.
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <code>X-MyBring-API-Key: &lt;api_key&gt;</code>
                                </td>
                                <td>Specify your API-key.
                                    <ul>
                                        <li><code>&lt;api_key&gt;</code> = a valid api-key
                                            such as <code>a141879d-608e-4ee4-95bd-8a083e04b599</code>.</li>
                                    </ul>
                                </td>
                            </tr>

                            </tbody>
                        </table>

                        <p>Request prefix: </p>
                        <code>https://www.mybring.com/reports/api</code>
                        <table>
                            <thead>
                            <tr>
                                <th>Field</th>
                                <th>Description</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><code>.../generate/</code></td>
                                <td>
                                    <p>Get a list of available customer accounts. Rememeber to set the correct headers
                                    (<code>Accept, Accept-Language, X-MyBring-API-Uid</code> and <code>X-MyBring-API-Key</code>)
                                    before performing this call</p>
                                </td>
                            </tr>
                            <tr>
                                <td><code>.../generate/&lt;customer_account_id&gt;/</code></td>
                                <td> Get a list of all available reports for the customer with customer id given
                                    by <code>&lt;customer_account_id&gt;</code>.
                                    <ul>
                                        <li><code>&lt;customer_account_id&gt;</code> = one of the customer account ids
                                            returned by a call to <code>.../generate/</code>.</li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                    </div>

                    <div class="box">
                        <h2>How to Use</h2>

                    </div>

                    <div class="box">
                        <h2>Additional examples</h2>

                    </div>
                </div>

                <div class="span3" id="additional-resources">
                    <div class="box">
                        <h2>Additonal Resources</h2>
                        <ul>

                        </ul>
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
