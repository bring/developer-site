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

});