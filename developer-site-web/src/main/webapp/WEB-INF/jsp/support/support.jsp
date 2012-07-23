<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
    <misc:contenttype />
    <misc:title value="Support" />
    <misc:css_v2 />
</head>

<body>

<div class="wrapper">

    <misc:header_v2 selected_tab="support" />

    <div id="page">
        <section id="content">
            <div class="row-fluid">
                <div class="span9">
                    <div class="box"><h1>Support</h1></div>
                    <div class="box">
                        <div class="span5">
                            </br>
                            <h3><a name="getSatisfaction"></a>GetSatisfaction</h3>
                            <p>Bring uses getSatisfaction as a community for support. Here you have the opportunity to ask questions and give feedback regarding technical issues integrating with Bring APIs. </p>
                            </br>
                            <p class="getSatisfactiontext"><a href="http://getsatisfaction.com/bring?view=recent" target="_blank">Visit Bring's community on getSatisfaction.</a> </p>
                        </div>

                        <div class="text-center span7">
                            <a href="http://getsatisfaction.com/bring?view=recent" target="_blank"><img src="../images/getSatisfactionScreenshot1.png" alt="Screenshot GetSatisfaction"></a>
                        </div>
                    </div>
                    <div class="box">
                        <div class="span5">
                            </br>
                            <h3><a name="feedback"></a>Feedback</h3>
                            <p>It is appreciated if you use getSatisfaction as a channel to get in touch with the developer team. There we have the opportunity to discuss and answer potential problems fast.
                               </br></br>However, if you prefer sending us a direct message, feel free to do so with the feedback form. We will try to answer as soon as possible.    </p>
                        </div>
                        </br>
                        </br>
                        <div class="span7">
                            <div class="lightBorder" id="wufoo-z7x0r3">
                            </div>
                            <script type="text/javascript">var z7x0r3;(function(d, t) {
                                var s = d.createElement(t), options = {
                                    'userName':'bringdev',
                                    'formHash':'z7x0r3',
                                    'autoResize':true,
                                    'height':'517',
                                    'async':true,
                                    'header':'show',
                                    'ssl':true};
                                s.src = ('https:' == d.location.protocol ? 'https://' : 'http://') + 'wufoo.com/scripts/embed/form.js';
                                s.onload = s.onreadystatechange = function() {
                                    var rs = this.readyState; if (rs) if (rs != 'complete') if (rs != 'loaded') return;
                                    try { z7x0r3 = new WufooForm();z7x0r3.initialize(options);z7x0r3.display(); } catch (e) {}};
                                var scr = d.getElementsByTagName(t)[0], par = scr.parentNode; par.insertBefore(s, scr);
                            })(document, 'script');</script>
                        </div>
                    </div>
                </div>
                <div class="span3">
                    <div class="sidebar" id="sidebar">
                        <sidebar:support-sidebar/>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>
</body>

<misc:footer_v2 />
<misc:jqueryblob_v2 />

</html>