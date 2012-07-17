/*--
 Sidebar
 --*/
$(function () {
    //if IE7
    if ($.browser.msie && parseInt($.browser.version, 10) === 7) {
        //Don't make the sidebar sticky
    }
    //anything else than IE7
    else {
        //If this page has a sidebar
        if ($('#sidebar').length != 0) {
            var menudefault = $('#sidebar')[0].offsetTop;
            alert(menudefault);

            $(document).bind('ready scroll', function () {
                var scroll = $(document).scrollTop();

                if (scroll >= menudefault) {
                    $('#sidebar').addClass('stickymenu');
                } else {
                    $('#sidebar').removeClass('stickymenu');
                }

            });
        }
    }
});