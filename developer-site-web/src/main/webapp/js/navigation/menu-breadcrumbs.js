(function($) {
    var navigationElement;
    var currentPageLink;
    var path;

    var options = {
        currentUrl: window.location.pathname + window.location.search
    };

    var methods = {
        init: function() {
            navigationElement = this;
            currentPageLink = methods.getCurrentPageLink();
            path = methods.getBreadcrumbsPath();
            currentPageLink.addClass("current-page");
            methods.initBreadcrumbs();
            methods.bindEvents();
            methods.markBreadcrumbs();
            methods.closeMenu();
            
        },

        initBreadcrumbs: function() {
            for(var i in path) {
                $(path[i]).addClass("breadcrumb");
            }
        },
        
        getCurrentPageLink: function() {
            return currentLink = $("a[href='"+options.currentUrl+"']", navigationElement);
        },
           
        getBreadcrumbsPath : function() {
            var path = [];
            var currentLink = currentPageLink;
            while ((currentLink = currentLink.parent()).length != 0 && !currentLink.hasClass("menulist")) {
                if (currentLink[0].tagName.toLowerCase() == "li") {
                    path[path.length] = currentLink[0];
                }
            }
            return path;	        
        },

        markBreadcrumbs: function() {
            $(".breadcrumb").addClass("marked");
        },

        unmarkAll: function() {
            $(".marked", navigationElement).removeClass("marked");
        },
        
        unmarkBreadcrumbs: function() {
            $(".marked", navigationElement).each(function() {
                if (!$(this).hasClass("breadcrumb")) {
                    $(this).removeClass("marked");
                }
            });
        },

        eatBread: function() {
            $(".breadcrumb").bind("click", methods.cleanKitchenTable);
            var liElements = $(".menulist > li:not(.breadcrumb), li.breadcrumb li:not(.breadcrumb)", $(".menulist").parent());
            var hasRun = false;
            liElements.removeClass("marked");
            navigationElement.addClass("breadcrumbs");
            liElements.slideUp("normal", function() {
                if(!hasRun) {
                    navigationElement.menu("recalculateHeight");
                    hasRun = true;
                }
            });
        },

        cleanKitchenTable: function() {
            $(".breadcrumb").unbind("click", methods.cleanKitchenTable);
            navigationElement.removeClass("breadcrumbs");
            methods.unmarkAll();
            methods.markBreadcrumbs();
            var liElements = $(".menulist > li:not(.breadcrumb), li.breadcrumb li:not(.breadcrumb)", $(".menulist").parent());
            //var liElements = $("li:not(.breadcrumb)",$(".menulist"));
            var i = 0;
            
            // "show" li elements for height calc
            var styles = [];
            liElements.each(function(i, el) {
                styles[i] = $(el).attr("style");
            });
            liElements.css({
                visibility: "hidden",
                display: "block"
            });
            
            navigationElement.menu("recalculateHeight");
            
            liElements.each(function(i, el) {
                $(el).attr("style", styles[i]);
            });
            
            liElements.slideDown(/*function() {
                i = i + 1;
                if (i == liElements.length) {
                    navigationElement.menu("recalculateHeight");
                }
            }*/);
        },
        
        closeMenu: function() {
            methods.eatBread();
            $(navigationElement).menutab.hidden = true;
        },

        bindEvents: function() {
            $(navigationElement).bind( {
                changeTab: function(event, chosenTab, currentTab) {
                    if (currentTab === 0) {
                        methods.unmarkAll();
                        methods.markBreadcrumbs();
                        navigationElement.menu("recalculateHeight");
                    }
                },
                
                launch: function(event, chosenTab, currentTab) {
                    if (chosenTab !== 0) {
                        return;
                    }
                    
                    methods.markBreadcrumbs();
                    if ($(navigationElement).menutab.hidden) {
                        methods.cleanKitchenTable();
                        $(navigationElement).menutab.hidden = false;
                    }
                    else {
                        if (chosenTab == currentTab) {
                            event.preventDefault();
                            methods.closeMenu();
                        }
                    }
                },
                
                outerClick: function() {
                    methods.markBreadcrumbs();
                    methods.closeMenu();
                    if (navigationElement.menutab("getActive") && navigationElement.menutab("getActive").index != 0) {
                        navigationElement.menutab("changeTab", 0);
                    }
                }
            });
        }
    };

    $.fn.menuBreadcrumbs = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist.');
        }   
    }

})(jQuery);