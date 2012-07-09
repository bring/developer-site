<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
                        <p>
                            This is a shipping module for Joomla Virtuemart. It uses the Bring Fraktguide XML API to
                            get shipping quotes. It will get accurate prices based on delivery postcode, weight, length, width, height and volume.
                        </p>
                    </div>

                    <div class="box">
                        <h4>How to install</h4>
                        <ol>
                            <li>Use instructions within the downloaded file. Please commit your updates to the Google Code project</li>
                            <li>Se også <a target="_blank" href="http://forum.joomla.org/viewtopic.php?t=377821">denne tråden</a></li>
                        </ol>
                    </div>

                            <div class="box">

                                <h4>Screenshot</h4>

                                <div class="box lightBorder">
                                <img class="fitted-width" src="http://developer.bring.com/media/plugin/joomlavirtuemartfraktpriser/screenshot.png" />
                                </div>
                            </div>
                </div>

                <div class="span3 box">
                    <h4>Made by</h4>
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
                    </ul>
                    <div class="box">
                        <a href="http://code.google.com/p/fraktpriservirtuemart/downloads/list" class="btn enhanced">Download</a>
                        <br/>
                        <br/>
                        <a href="http://code.google.com/p/fraktpriservirtuemart/" class="btn">Repository</a>
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