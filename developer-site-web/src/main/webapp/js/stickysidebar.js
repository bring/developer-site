/*--
    Sidebar
    --*/
$(function(){
    var menudefault = $('#sidebar')[0].offsetTop;

    $(document).bind('ready scroll',function(){
        var scroll = $(document).scrollTop();

        if(scroll >= menudefault){
            $('#sidebar').addClass('stickymenu');
        } else {
            $('#sidebar').removeClass('stickymenu');
        }

    });

});