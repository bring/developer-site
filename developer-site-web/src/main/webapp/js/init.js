$(document).ready(function() {
    
    /*
     * Initialization for all pages
     */

    // Display twitter message in navigation element
    $("#talk").performTwitterSearch(1, function(image, user, text, time) {
        return '<div class="talkbox dropdown-menu">' + 
                    '<div class="talkbox-header group">' +
                        '<a href="http://twitter.com/bringapi">@bringapi</a>' + 
                    '</div>' + 
                    '<div class="quote"><blockquote id="twittertalkquote">' + text + '</blockquote></div>' + 
                    '<div class="talkbox-footer">' + 
                        '<img id="twittertalkimage" class="talkbox-image" src="' + image + '" />' + 
                        '<span id="twittertalkuser" class="user">' + user + '</span><span id="twittertalktime" class="time">' + time + '</span>' + 
                    '</div>' + 
                '</div>';   
    });
    
    /*
     * Initialization based on page type
     */
    
    if (isPageType("home")) {
        $("#navigation").navigation({mode: "hidden"});
        $("#twittercontent").performTwitterSearch(1, twitterView);
        $(".big-banner").bringBanner();
    }
    
    else if (isPageType("apireference")) {
        $("#navigation").navigation({mode: "breadcrumbs"});
        
        $(".api-call").each(function() {
            $(this).exampleRequest();
        });
            
        // Show the correct tab on init
        $(".codetabs").codetabs({
            cookies : true,
            defaultTab : ""
        });
        
        $(".toc").tableOfContents($(".article"), {
        	startLevel: 2,
        	depth: 1
        });
    }
    
    else if (isPageType("article")) {
        $("#navigation").navigation({mode: "breadcrumbs"});
        $(".codetabs").codetabs({
        	defaultTab : "xml",
        	cookies : true
		});
    }
    
    else if (isPageType("package-overview")) {
        $("#navigation").menu().downloadmenuHider().menutab({defaultTab: 1});
    }
    
    else if(isPageType("package")) {
        $("#navigation").menu().downloadmenuHider().menutab({defaultTab: 1});
        $(".widgetpreview").codetabs({defaultTab : "preview"});         
                    
        // Dynamic widget generation from code example
        var widgetSource = $($(".widgetpreview .codetab pre.sh_sourceCode:not(.snippet-formatted)")[0]).text();
        var previewTab = $(".widgetpreview .previewtab");
    }
    
    else if(isPageType("package-subpage")) {
    }
    
    else if (isPageType("productlist")) {
        $("#navigation").navigation({mode: "breadcrumbs"});
    }
    
    /*
     * Helper functions
     */
    
    function twitterView(image, user, text, time) {
        return '<li class="group"><img class="avatar" src="' + 
        image + '"/><div class="avatar-list-text"><div class="question-title">' +
        user + '</div><div class="question-text"><blockquote>' + 
        text + '</blockquote></div>' + '<div class="datetime">' + 
        time + '</div></div></li>';
    }
    
    function isPageType(type) {
        return $("body").hasClass("page-"+type);
    }
});