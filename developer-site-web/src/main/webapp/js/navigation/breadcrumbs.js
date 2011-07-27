(function($) {
    var navigationElement;
    var breadcrumbElements = [];
    var allElementsNotBreadcrumbs;
    var hidden = false;

    var options = {
        currentUrl: window.location.pathname + window.location.search,
        tabIndex: 0
    };

    var methods = {
        init: function() {
            navigationElement = this;
            var currentPageLink = methods.getCurrentPageLink();
            methods.markCurrentPage(currentPageLink);
            methods.initBreadcrumbs(currentPageLink);
            methods.bindEvents();
            methods.markBreadcrumbs();
            this.menu({initHeight: false});
            methods.showBreadcrumbs();
            return this;
        },

        markCurrentPage: function(currentPageLink) {
            currentPageLink.addClass("current-page");            
        },
        
        initBreadcrumbs: function() {
            var path = methods.getBreadcrumbsPath()
            var breadcrumb;
            for(var i in path) {
                breadcrumbElement = $(path[i]) 
                breadcrumbElement.addClass("breadcrumb");
                breadcrumbElements.push(breadcrumbElement);
            }
        },
        
        getCurrentPageLink: function() {
            return currentLink = $("a[href='"+options.currentUrl+"']", navigationElement);
        },
           
        getBreadcrumbsPath : function(currentLink) {
            var path = [];
            if (currentLink == undefined) {
                currentLink = methods.getCurrentPageLink();
            }
            while ((currentLink = currentLink.parent()).length != 0 && !currentLink.hasClass("menulist")) {
                if (currentLink[0].tagName.toLowerCase() == "li") {
                    path[path.length] = currentLink[0];
                }
            }
            return path;	        
        },

        markBreadcrumbs: function() {
            $(breadcrumbElements).each(function() {
                this.addClass("marked");
            });
        },

        
        unmarkBreadcrumbs: function() {
            $(breadcrumbElements).each(function() {
                this.removeClass("marked");
            });
        },
        
        unmark: function(element) {
            element.removeClass("marked");
        },
        
        getAllLiElementsNotBreadcrumbs: function() {
            if (allElementsNotBreadcrumbs == undefined) {
                allElementsNotBreadcrumbs = $(".menulist li:not(.breadcrumb)", $(".menulist").parent()); 
            }
            return allElementsNotBreadcrumbs;
        },
        
        recalculateHeightWhileHidden: function(hiddenElements) {
            var styles = [];
            hiddenElements.each(function(i) {
                styles[i] = $(this).attr("style");
            });
            hiddenElements.css({
                visibility: "hidden",
                display: "block"
            });
            navigationElement.menu("recalculateHeight");
            hiddenElements.each(function(i) {
                $(this).attr("style", styles[i]);
            });  
        },
        
        showBreadcrumbs: function() {
            hidden = true;
            $(breadcrumbElements).each(function() {
                this.bind("click", methods.showMenu);    
            });
            var allLiElementsNotBreadcrumbs = methods.getAllLiElementsNotBreadcrumbs();
            allLiElementsNotBreadcrumbs.removeClass("marked");
            $(navigationElement).addClass("breadcrumbs");
            methods.markBreadcrumbs();
            navigationElement.menu("slideToHeight", navigationElement.menu("getHeightOfOneElement"));
            allLiElementsNotBreadcrumbs.slideUp("normal");
        },
        
        showMenu: function() {
            hidden = false;
            $(breadcrumbElements).each(function() {
                this.unbind("click", methods.showMenu);  
            });
            navigationElement.removeClass("breadcrumbs");
            var allLiElementsNotBreadcrumbs = methods.getAllLiElementsNotBreadcrumbs();
            allLiElementsNotBreadcrumbs.each(function() {
                methods.unmark($(this));
            });
            methods.markBreadcrumbs();
            methods.recalculateHeightWhileHidden(allLiElementsNotBreadcrumbs);
            allLiElementsNotBreadcrumbs.slideDown();
        },

        bindEvents: function() {
            $(navigationElement).bind( {
                launch: function(event, chosenTab, currentTab) {
                    if (chosenTab !== options.tabIndex) {
                        // Don't care if other tabs are clicked..
                        return;
                    }
                    
                    if (chosenTab === currentTab) { // Menu tab activated
                        event.preventDefault();
                        if (hidden) {
                            methods.showMenu();    
                        }
                        else {
                            methods.showBreadcrumbs();
                        }
                    }
                    else { // Menutab not activated
                        methods.showMenu();
                    }
                },
                
                outerClick: function() {
                    if (navigationElement.menutab("getActive") && navigationElement.menutab("getActive").index != options.tabIndex) {
                        navigationElement.menutab("stop");
                        methods.getAllLiElementsNotBreadcrumbs().hide();
                        navigationElement.menutab("changeTab", options.tabIndex);
                    }
                    methods.showBreadcrumbs();
                },
                
                updateMenuPath: function(event) {
                    if (hidden) {
                        event.preventDefault();
                    }
                }
            });
        }
    };

    $.fn.menuWithBreadcrumbs = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist.');
        }   
    }
})(jQuery);