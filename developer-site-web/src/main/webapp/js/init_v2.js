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

    //Create tables dynamically from tags like: <table data-tab="url">
    $("table[data-tab]").tableFromJSON();

    //Add "even" class to every other table row for styling purposes
    $("table").colorizeTable();

    $("div.multitabs").multitabs();

});