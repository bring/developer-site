(function($) {
	var State = {
		BREADCRUMBS: 0,
		MENU: 1,
		createFromStr: function(str) {
		    if (str == "breadcrumbs") {
		        return State.BREADCRUMBS;
		    }
		    else if (str == "menu") {
		        return State.MENU;
		    }
		}
	};
	var state = State.BREADCRUMBS;
	var navigationElement;
	var options = {
	    section: "#learn",
        breadcrumbs: [],
        currentUrl: window.location.pathname + window.location.search,
        state: "breadcrumbs"
	}
	
	var methods = {
	    init: function(optionsArg) {
	        navigationElement = this;
	        $.extend(options, optionsArg);
	        methods.initBreadcrumbs();
            methods.bindMenutabEvents();
            methods.bindMouseOverEvents();
            methods.bindClickEvents();
            state = State.createFromStr(options.state)
	    },
	       
	    
	    getPath : function() {
            var path = [];
            var currentLink = $("a[href='"+options.currentUrl+"']", navigationElement);
            while ((currentLink = currentLink.parent()).length != 0 && !currentLink.hasClass("menulist")) {
                if (currentLink[0].tagName.toLowerCase() == "li") {
                    path[path.length] = currentLink[0];
                }
            }
            return path;	        
	    },
	    
	    initBreadcrumbs: function() {
	        
	        var path = methods.getPath();
	        for(var i in path) {
	            $(path[i]).addClass("breadcrumb");
	            console.debug(path[i]);
	        }
	        
	        /*
	        $listContainer = $(options.section, navigationElement);
	        for (var i = 1; i <= options.breadcrumbs.length; i++) {
	            var $current = $(".level"+i, $listContainer);
	            $listContainer = $($current.children()[options.breadcrumbs[i-1]-1]); 
	            $listContainer.addClass("breadcrumb");
	        }*/
	    },
	    
	    markBreadcrumbs: function() {
    	    $(".breadcrumb", $(options.section, navigationElement)).each(function() {
    	        $(this).addClass("marked");
    	    });
	    },
	    
	    activateMenu: function() {
	        state = State.MENU;
	        methods.markBreadcrumbs();
	    },
	    
	    deactivateMenu: function() {
	        $(".marked", navigationElement).each(function() {
                if (!$(this).hasClass("breadcrumb")) {
                    $(this).removeClass("marked");
                }
            });
            state = State.BREADCRUMBS;
	    },
	    
	    updateMenu: function(element) {
            var context = $(element).parent().parent().parent();
            $(".marked", context).removeClass("marked");
            $("#breadcrumbs .breadcrumb").addClass("marked");
            $(element).parent().addClass("marked");
	    },
	    
	    bindMenutabEvents: function() {
	        navigationElement.bind("stateMenu", function() {
	            methods.activateMenu();
	        }).bind("stateHiddenBefore", function() {
	            methods.deactivateMenu();
	        });
	    },
	    
	    bindMouseOverEvents: function() {
            $(".menulist > li > a, .marked > a").mouseover(function(event) {
                switch (state) {
                    case State.BREADCRUMBS:
                        break;
                    case State.MENU:
                        methods.updateMenu(this);
                        break;
                }
                event.preventDefault();
            });
	    },
	    
	    bindClickEvents: function() {
	         $(".menulist a").click(function(event) {
	                switch (state) {
	                case State.BREADCRUMBS:
	                    navigationElement.menutab("tabSelected", "#learn");
	                    event.preventDefault();
	                    break;
	                case State.MENU:
	                    break;
	                }
	         });
	    }
	};
	
    $.fn.menu = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist on jQuery.tooltip');
        }   
    }
})(jQuery);