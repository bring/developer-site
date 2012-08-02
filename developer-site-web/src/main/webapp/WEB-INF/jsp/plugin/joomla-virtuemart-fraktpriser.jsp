<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>

<html>

<head>
    <misc:contenttype/>
    <misc:title value="Fraktpriser for Joomla! Virtuemart"/>
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
                        <h1>Fraktpriser for Joomla! Virtuemart
                        </h1>

                    </div>

                    <div class="box">
                        <p>
                            This is a shipping module for Joomla Virtuemart. It uses the Bring Fraktguide XML API to
                            get shipping quotes. It will get accurate prices based on delivery postcode, weight, length, width, height and volume.
                        </p>
                        <h4>How to install</h4>
                        <ol>
                            <li>Use instructions within the downloaded file. Please commit your updates to the Google Code project</li>
                            <li>Se også <a target="_blank" href="http://forum.joomla.org/viewtopic.php?t=377821">denne tråden</a></li>
                        </ol>
                    </div>

                    <div class="box">

                        <h4>Screenshot</h4>

                        <div class="box lightBorder">
                            <img class="fitted-width" src="/images/joomla-virtuemart-screenshot.png" />
                        </div>
                    </div>

                    <div class="box">


                        <div class="span4 box">     <h4>Made by</h4>
                            <ul>
                                <li>
                                    <a href="http://www.magnusfeiring.com/" target="_blank">
                                        Magnus Feiring
                                    </a>
                                </li>
                                <li>
                                    <a href="http://syntaxerror.no/" target="_blank">
                                        Rune Rassmusen
                                    </a>
                                </li>
                            </ul></div>

                        <div class="span4 box"></div>

                        <div class="span4 box">
                            <a href="http://code.google.com/p/fraktpriservirtuemart/downloads/list" class="btn enhanced">Download</a>
                            <br/>
                            <br/>
                            <a href="http://code.google.com/p/fraktpriservirtuemart/" class="btn">Repository</a>
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

<misc:footer_v2/>
<misc:jqueryblob_v2/>

</body>
</html>