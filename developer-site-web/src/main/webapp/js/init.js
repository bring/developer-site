$(document).ready(function() {


    /*
     * Initialization based on page type
     */
    

    
    if (isPageType("apireference")) {
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
        $(".api-call").each(function() {
            $(this).exampleRequest();
        });
        $(".codetabs").codetabs({
        	defaultTab : "xml",
        	cookies : true
		});
    }
    
    else if (isPageType("package-overview")) {
    }
    
    else if(isPageType("package")) {

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

    }
    
    /*
     * Helper functions
     */
    
    function twitterView(image, user, text, time) {
        return '' +
            '<li class="group">' +
                '<img class="avatar" src="' + image + '"/>' +
                '<div class="avatar-list-text">' +
                    '<div class="question-title">' + user + '</div>' +
                    '<div class="question-text">"' + text + '"</div>' +
                    '<div class="datetime">' + time + '</div>' +
                '</div>' +
            '</li>';
    }
    
    function isPageType(type) {
        return $("body").hasClass("page-"+type);
    }
});