<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
    <misc:contenttype/>
    <misc:title value="Choose Pickup Point"/>
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
                        <h1>Choose pickup point</h1>

                    </div>

                    <div class="box">
                        <p>This widget uses Bring's Pickup point API to allow the user to choose their preferred post office.
                            This is mainly intended for online shopping to allow the user to choose another pickup point than the default to their shipping address.
                        </p>
                        <h4>How to install</h4>
                        <ol>
                            <li>This widget depends on jQuery, so please add jQuery to your site first.</li>
                            <li>Add the Post Office widget:<br/>
                                <code>&lt;script type="text/javascript" src="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js"&gt;&lt;/script&gt;</code></li>
                            <li>Initialize it<br/>
                                <code>$("divid").utleveringsenhet();</code></li>
                        </ol>

                        <div class="content-box">
                            <div class="row element-sample">

                                <h4><p>Widget Example</p></h4>
                                <ul class="tab-group minimal" data-tabs="tabs">
                                    <li class="active"><a href="#tab1-5">DEMO</a></li>
                                    <li><a href="#tab2-5">CODE</a></li>
                                </ul>
                                <div class="tab-content tab-minimal">

                                    <div class="tab-pane active" id="tab1-5">
                                        <div class="box lightBorder"><iframe class="widget-demo" src="http://developer.bring.com/use/widget/choosepickuppoint/preview.html"></iframe></div>
                                    </div>

                                    <div class="tab-pane" id="tab2-5">
                                  <pre class="prettyprint">&lt;script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"&gt;
&lt;/script&gt;
&lt;script type="text/javascript" src="http://fraktguide.bring.no/fraktguide/js/
utleveringsenhet-1.0.1.js"&gt;
&lt;/script&gt;
&lt;script type="text/javascript"&gt;
    $(document).ready(function() {
        $('#divid').utleveringsenhet();
    });
&lt;/script&gt;
&lt;form&gt;
    &lt;div id="divid"&gt;&lt;/div&gt;
&lt;/form&gt;</pre>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="span3 box">
                    <h4>Made by</h4>
                    <ul>
                        <li><a href="http://www.bekk.no" target="_blank">Stian Mathiassen</a></li>
                        <li><a href="http://www.bekk.no" target="_blank">Nina Volstad</a></li>
                    </ul>
                    <a href="http://fraktguide.bring.no/fraktguide/js/utleveringsenhet-1.0.1.js" class="btn enhanced">Download</a>
                </div>

            </div>

        </section>
    </div>


</div>

<misc:footer_v2/>
<misc:jqueryblob_v2/>

</body>
</html>