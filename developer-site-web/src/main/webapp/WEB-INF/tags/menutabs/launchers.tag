<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="cssClass" required="true" type="java.lang.String" rtexprvalue="true"%>

<div class="navigation-launchers group">
    <div id="learn-launcher" class="section-launcher ${cssClass} span-2">
       <div class="section-title"><a href="#learn"><span>LEARN</span></a></div>
       <span class="section-description">TUTORIALS, EXAMPLES, API REFERENCE</span>
    </div>
    <div id="use-launcher" class="section-launcher ${cssClass} span-2">
       <div class="section-title"><a href="#use"><span>USE</span></a></div>
       <span class="section-description">PLUGINS, WIDGETS, CLIENT LIBRARIES</span>
    </div>
    <div id="talk-launcher" class="section-launcher ${cssClass} span-2 last">
       <div class="section-title"><a href="#talk"><span>TALK</span></a></div>
       <span class="section-description">ASK, WRITE, CODE, LEARN</span>
    </div>
</div>