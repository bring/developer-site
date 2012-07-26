// Tabs
(function($) {
    $.fn.multitabs = function(method) {
        //Hide all tabs
        $('div[data-tab]').hide();
        //Display default (xml)
        $.each($("div[data-tab=xml]"), function(){
            $(this).show();
            $("a[data-tab=xml]").parents().addClass("active");
        })
        //Register triggers
        var triggers = this.find('li>a[data-tab]');
        for(var i = 0; i < triggers.length; i++){
            //Bind actions to triggers
            $(triggers[i]).bind('click', function(){
                //select all tabs to be displayed (ie. tabs matching the data-tab attribute
                var tabName = $(this).attr("data-tab");
                var tabsToBeDisplayed = $("div[data-tab="+tabName+"]");
                $('div[data-tab]').hide();
                $('a[data-tab]').parents().removeClass("active");
                $.each(tabsToBeDisplayed, function(){
                    $(this).show();
                    $("a[data-tab="+tabName+"]").parents().addClass("active");
                })
            });
        }
    }
})(jQuery);
