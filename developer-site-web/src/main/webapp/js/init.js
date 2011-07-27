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
    }
    
    else if (isPageType("apireference")) {
        $("#navigation").navigation({mode: "breadcrumbs"});
        $("#twittercontent").performTwitterSearch(3, twitterView); 
        
        // Show the correct tab on init
        $(".codetabs").codetabs({
            cookies : true,
            defaultTab : ""
        });
    }
    
    else if (isPageType("article")) {
        $("#navigation").navigation({mode: "breadcrumbs"});
        $("#twittercontent").performTwitterSearch(3, twitterView); 
        $(".codetabs").codetabs({
        	defaultTab : "xml",
        	cookies : true
		});
    }
    
    else if (isPageType("package-overview")) {
        $("#navigation").menu().downloadmenuHider().menutab({defaultTab: 1});
        $("#twittercontent").performTwitterSearch(3, twitterView); 
    }
    
    else if(isPageType("package")) {
        $("#navigation").menu().downloadmenuHider().menutab({defaultTab: 1});
        $("#twittercontent").performTwitterSearch(3, twitterView);
        $(".widgetpreview").codetabs({defaultTab : "preview"});         
                    
        // Dynamic widget generation from code example
        var widgetSource = $($(".widgetpreview .codetab pre.sh_sourceCode:not(.snippet-formatted)")[0]).text();
        //console.debug(widgetSource);
        var previewTab = $(".widgetpreview .previewtab");
        /*console.debug($("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body"));*/
        //$("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body").html(widgetSource);
    }
    
    else if(isPageType("package-subpage")) {
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