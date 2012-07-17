/*--
 Sidebar
 --*/
$(function () {
//    If this page has a sidebar
    if($('#sidebar').length != 0) {
        var menudefault = $('#sidebar')[0].offsetTop;

        $(document).bind('ready scroll', function () {
            var scroll = $(document).scrollTop();

            if (scroll >= menudefault) {
                $('#sidebar').addClass('stickymenu');
            } else {
                $('#sidebar').removeClass('stickymenu');
            }

        });
    }

});