<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="developer" uri="http://developer.bring.com"%>

<script type="text/javascript" src="/js/lib/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery.actual.js"></script>
<script type="text/javascript" src="/js/lib/jquery.outerclick.js"></script>
<script type="text/javascript" src="/js/lib/jquery.snippet.js"></script>
<script type="text/javascript" src="/js/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/lib/jquery.tableofcontents.js"></script>
<script type="text/javascript" src="/js/lib/jquery.fancybox.js"></script>
<script type="text/javascript" src="/js/lib/jsonFormatter.js"></script>
<script type="text/javascript" src="/js/navigation/menutab.js"></script>
<script type="text/javascript" src="/js/navigation/menu.js"></script>
<script type="text/javascript" src="/js/twitter.js"></script>
<script type="text/javascript" src="/js/navigation/breadcrumbs.js"></script>
<script type="text/javascript" src="/js/navigation/navigation.js"></script>
<script type="text/javascript" src="/js/syntaxhighligther.js"></script>
<script type="text/javascript" src="/js/codetabs.js"></script>
<script type="text/javascript" src="/js/banner.js"></script>
<script type="text/javascript" src="/js/init_v2.js"></script>
<script type="text/javascript" src="/js/exampleRequest.js"></script>
<script type="text/javascript" src="/js/bootstrap-tabs.js"></script>
<script type="text/javascript" src="/js/prettify.js"></script>
<script type="text/javascript" src="/js/kp-utilities.js"></script>
<script type="text/javascript" src="/js/kp-mobile.menu.js"></script>
<script type="text/javascript" src="/js/stickysidebar.js"></script>



<script type="text/javascript">
    $(function(){
        // Hides all content boxes that are not selected
        $('.menu-group.collapsing a:not(.selected) + .content-box').hide();
        $('.menu-group.collapsing li > a').click(function(e){
            $(this).toggleClass('selected').siblings('.content-box').slideToggle();
            e.preventDefault();
        });


    });

    prettyPrint();

    /* Google Analytics */
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', '<c:out value="${googleTrackerID}" />']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>