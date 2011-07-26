$(document).ready(function() {
    // Syntax highlighter
    $(".article pre, .widgetpreview pre").each(function(index, item) {
        var lang = $(item).attr("class");
        var lines = $(item).attr("data-highlightlines");
        
        var langMap = {
             json : "javascript",
             webservice : "c#"
        };
        
        for(fromLang in langMap) {
            if(langMap.hasOwnProperty(fromLang) && fromLang === lang) {
                lang = langMap[fromLang];
                break;
            }
        }
        
        if(lang) {
//        	console.debug($(item));
            $(item).snippet(lang, {
                style: "ide-eclipse",
                box: lines
            });
        }
    });
});