$(document).ready(function() {

    $(".api-call").each(function() {
        $(this).exampleRequest();
    });

    // Show the correct tab on init
    $(".codetabs").codetabs({
        cookies : false,
        defaultTab : "xml"
    });

});