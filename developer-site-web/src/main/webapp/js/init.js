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
        var menu = new TopMenu($('.navigation-tabs'), '/', menuJsonData);

        $(".api-call").each(function() {
            $(this).exampleRequest();
        });
            
        // Show the correct tab on init
        $(".codetabs").codetabs({
            cookies : true,
            defaultTab : "xml"
        });
        
        $(".toc").tableOfContents($(".article"), {
        	startLevel: 2,
        	depth: 1
        });
    }
    
    else if (isPageType("article")) {
        var menu = new TopMenu($('.navigation-tabs'), '/', menuJsonData);
        
        $(".api-call").each(function() {
            $(this).exampleRequest();
        });
        $(".codetabs").codetabs({
        	defaultTab : "xml",
        	cookies : true
		});
    }
    
    else if (isPageType("package-overview")) {
        var menu = new TopMenu($('.navigation-tabs'), '/', menuJsonData);
    }
    
    else if(isPageType("package")) {
        var menu = new TopMenu($('.navigation-tabs'), '/', menuJsonData);
        
        $(".widgetpreview").codetabs({defaultTab : "preview"});         
                    
        // Dynamic widget generation from code example
        var widgetSource = $($(".widgetpreview .codetab pre.sh_sourceCode:not(.snippet-formatted)")[0]).text();
        var previewTab = $(".widgetpreview .previewtab");
        
        // Fancy zoom on package media
        $(".package-media a.zoom").fancybox({
        	overlayColor : "#fff",
        	padding: 0,
        	hideOnContentClick : true
        });
    }
    
    else if(isPageType("package-subpage")) {
    }
    
    else if (isPageType("productlist")) {
        var menu = new TopMenu($('.navigation-tabs'), '/', menuJsonData);
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