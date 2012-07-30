/*
 This script allows us to use bookmarks/anchors without changing the hash.
 */

function showBookmark (sBookmark) {
    var bookmark = $("[name="+sBookmark+"]");
    if(bookmark.length > 0){
        var bookmarkOffset = bookmark.position().top;
        $('body').scrollTop(bookmarkOffset);
        $('html').scrollTop(bookmarkOffset);//works in FF
    }
}
