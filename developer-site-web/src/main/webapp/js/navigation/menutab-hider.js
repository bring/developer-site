(function($) {
    $.fn.menutabHider = function() {
        var navElement = this;
        var launchers = navElement.menutab("getLaunchers");
        
        var hide = function() {
            var launchers = navElement.menutab("getLaunchers");
            $(launchers).removeClass("menutab");
            $(launchers).addClass("box");
            navElement.menutab("hideActive");
            navElement.menutab.hidden = true;
        }
        
        this.bind({
            launch: function(event, chosenTab, currentTab) {
                if (navElement.menutab("isBusy")) {
                    return;
                }
                
                if (navElement.menutab.hidden) {
                    navElement.menu("unmarkAll");
                    navElement.menu("recalculateHeight", true);
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
                        hide();
                        event.preventDefault();
                    }
                }
            },
            
            outerClick: function(event) {
                if (navElement.menutab("isBusy")) {
                    return;
                }
                hide();
            }
        });
    }
})(jQuery);
