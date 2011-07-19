<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="misc" tagdir="/WEB-INF/tags"%>

<misc:jquery />
<script src="/js/jquery.actual.js"></script>
<script src="/js/jquery.ba-outside-events.js"></script>
<script src="/js/menutab.js"></script>
<script src="/js/menu.js"></script>
<script src="/js/twitter.js"></script>
<script>
    $(document).ready(function() {
        /*
         * Twitter
         */
         
        $("#talk").performTwitterSearch(1, function(image, user, text, time){
            return '<div class="talkbox dropdown-menu">' + 
                        '<div class="talkbox-header group">' +
                            '<a href="http://twitter.com/bringapi">@bringapi</a>' + 
                        '</div>' + 
                        '<pre class="quote"><blockquote id="twittertalkquote">' + text + '</blockquote></pre>' + 
                        '<div class="talkbox-footer">' + 
                            '<img id="twittertalkimage" class="talkbox-image" src="' + image + '" />' + 
                            '<span id="twittertalkuser" class="user">' + user + '</span><span id="twittertalktime" class="time">' + time + '</span>' + 
                        '</div>' + 
                    '</div>';   
        });
        
        $("#twittercontent").performTwitterSearch(3, function(image, user, text, time){
            return '<li class="group"><img class="avatar" src="' + 
            image + '"/><div class="avatar-list-text"><div class="question-title">' +
            user + '</div><div class="question-text"><pre>' + 
            text + '</pre></div>' + '<div class="datetime">' + 
            time + '</div></div></li>';
        });
 });
</script>