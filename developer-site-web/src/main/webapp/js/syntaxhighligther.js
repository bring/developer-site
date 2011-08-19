$(document).ready(function() {
    // Syntax highlighter
    $(".article pre:not(.delay-snippet), .widgetpreview pre").each(function(index, item) {
        var jqItem = $(item);
        var lang = null;
        var lines = $(item).attr("data-highlightlines");
        
        var langMap = {
             json : "javascript",
             xml : "xml",
             webservice : "c#"
        };

        for(fromLang in langMap) {
            if(langMap.hasOwnProperty(fromLang) && jqItem.hasClass(fromLang)) {
                lang = langMap[fromLang];
                break;
            }
        }

        if(lang) {
//          console.debug($(item));
            $(item).snippet(lang, {
                style: "ide-eclipse",
                box: lines
            });
        }
    });
});