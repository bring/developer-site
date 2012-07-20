$(document).ready(function() {

    $(".api-call").each(function() {
        $(this).exampleRequest();
    });

    // Show the correct tab on init
    $(".codetabs").codetabs({
        cookies : false,
        defaultTab : "xml"
    });

    $(function(){
        // Hides all content boxes that are not selected
        $('.menu-group.collapsing a:not(.selected) + .content-box').hide();
        $('.menu-group.collapsing li > a').click(function(e){
            $(this).toggleClass('selected').siblings('.content-box').slideToggle();
            e.preventDefault();
        });


    });

    /* Add syntax highlighting to certain code-snippets on the page */
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

});