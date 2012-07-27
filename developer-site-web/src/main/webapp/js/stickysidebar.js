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
            $(document).bind('ready scroll', function () {
                var scroll = $(document).scrollTop();
                var sidebarHeight = $('#sidebar').height();
                var windowWidth = $(window).width();
                var windowHeight = $(window).height();
                if (scroll >= menudefault && windowWidth > 849 && windowHeight > sidebarHeight) {
                    $('#sidebar').addClass('stickymenu');
                } else {
                    $('#sidebar').removeClass('stickymenu');
                }
            });

            $(window).resize(function(){
                var menudefault = $('#sidebar')[0].offsetTop;
                var scroll = $(document).scrollTop();
                if($(window).width() < 849 || $(window).height() < $('#sidebar').height() || scroll <= menudefault){
                    $('#sidebar').removeClass('stickymenu');
                }

                else if($(window).width() > 849 || $(window).height() > $('#sidebar').height()){
                    $('#sidebar').addClass('stickymenu');
                }
            });
        }
    }
});
