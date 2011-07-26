<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>

<script src="/js/lib/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/js/lib/jquery.actual.js"></script>
<script type="text/javascript" src="/js/lib/jquery.outerclick.js"></script>
<script type="text/javascript" src="/js/lib/jquery.snippet.js"></script>
<script type="text/javascript" src="/js/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/navigation/menutab.js"></script>
<script type="text/javascript" src="/js/navigation/menu.js"></script>
<script type="text/javascript" src="/js/twitter.js"></script>
<script type="text/javascript" src="/js/navigation/breadcrumbs.js"></script>
<script type="text/javascript" src="/js/navigation/navigation.js"></script>
<script type="text/javascript" src="/js/syntaxhighligther.js"></script>
<script type="text/javascript" src="/js/codetabs.js"></script>
<script type="text/javascript" src="/js/navigation/menutab-hider.js"></script>
<script type="text/javascript" src="/js/navigation/downloadmenu-hider.js"></script>

<!-- TODO Flytt til init.js -->
<script type="text/javascript">
        $(document).ready(function() {
            var twitterView = function(image, user, text, time) {
                return '<li class="group"><img class="avatar" src="' + 
                image + '"/><div class="avatar-list-text"><div class="question-title">' +
                user + '</div><div class="question-text"><blockquote>' + 
                text + '</blockquote></div>' + '<div class="datetime">' + 
                time + '</div></div></li>';
            }
            
            
            function isPageType(type) {
                                return $("body").hasClass("page-"+type);
            }
            
            // Twitter for the menu..
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
             * Initialize jQuery based on page type
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
            }
            
            else if (isPageType("package-overview")) {
                $("#navigation").menu().downloadmenuHider().menutab({defaultTab: 1});
                $("#twittercontent").performTwitterSearch(3, twitterView); 
            }
            
            else if(isPageType("package")) {
                $("#navigation").menu().downloadmenuHider().menutab({defaultTab: 1});
                $("#twittercontent").performTwitterSearch(3, twitterView); 
            }
            
            else if(isPageType("package-subpage")) {
            }
            
            else if(isPageType("apireference")) {
            }
        });
</script>
<!--     <script type="text/javascript"> -->
<!--         $(document).ready(function() { -->
<!--             $("#navigation").menu().downloadmenuHider().menutab({defaultTab: 1}); -->
                        
<!--             $(".widgetpreview").codetabs({ -->
<!--                 defaultTab : "preview" -->
<!--             });          -->
                        
<!--             $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){ -->
<!--                 return '<li class="group"><img class="avatar" src="' +  -->
<!--                 image + '"/><div class="avatar-list-text"><div class="question-title">' + -->
<!--                 user + '</div><div class="question-text"><blockquote>' +  -->
<!--                 text + '</blockquote></div>' + '<div class="datetime">' +  -->
<!--                 time + '</div></div></li>'; -->
<!--             }); -->
            
<!--             // Dynamic widget generation from code example -->
<!--             var widgetSource = $($(".widgetpreview .codetab pre.sh_sourceCode:not(.snippet-formatted)")[0]).text(); -->
<!--             //console.debug(widgetSource); -->
<!--             var previewTab = $(".widgetpreview .previewtab"); -->
<!--             /*console.debug($("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body"));*/ -->
<!--             //$("<iframe id=\"widgetPreview\"></iframe>").appendTo(previewTab).contents().find("body").html(widgetSource); -->
<!--         }); -->
<!--     </script> -->