(function($) {
    $.fn.menutabHider = function() {
        var navElement = this;
        this.bind("launch", function(event, chosenTab, currentTab) {
            var launchers = navElement.menutab("getLaunchers");
            if (navElement.menutab.hidden) {
                $(launchers).removeClass("box");
                $(launchers).addClass("menutab");
                if (chosenTab == currentTab) {
                    event.preventDefault();
                    navElement.menutab("showTab", chosenTab);
                }
                navElement.menutab.hidden = false;
            }
            else {
                if (chosenTab == currentTab) {
                    $(launchers).removeClass("menutab");
                    $(launchers).addClass("box");
                    event.preventDefault();
                    navElement.menutab("hideActive");
                    navElement.menutab.hidden = true;
                }
            }
        });
    }
})(jQuery);
