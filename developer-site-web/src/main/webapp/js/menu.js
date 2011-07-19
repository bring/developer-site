(function($) {
	var State = {
		BREADCRUMBS: 0,
		MENU: 1
	};
	var state = State.BREADCRUMBS;
	var navigationElement;
	var options = {
        breadcrumbs: []
	}
	
	var methods = {
	    init: function(optionsArg) {
	        navigationElement = this;
	        $.extend(options, optionsArg);
	        methods.markBreadcrumbs(options.breadcrumbs);
            methods.bindMenutabEvents();
            methods.bindMouseOverEvents();
            methods.bindClickEvents();
	    },
	        
	    markBreadcrumbs: function(breadcrumbs) {
	        $listContainer = navigationElement;
	        for (var i = 1; i <= breadcrumbs.length; i++) {
	            var $current = $(".level"+i, $listContainer);
	            $listContainer = $($current.children()[breadcrumbs[i-1]-1]); 
	            $listContainer.addClass("breadcrumb");
	        }
	    },
	    
	    activateMenu: function() {
	        state = State.MENU;
            methods.markBreadcrumbs(options.breadcrumbs);
            $(".breadcrumb").each(function() {
                $(this).addClass("marked");
            });
	    },
	    
	    deactivateMenu: function() {
	        $(".marked").each(function() {
                if (!$(this).hasClass("breadcrumb")) {
                    $(this).removeClass("marked");
                }
            });
            state = State.BREADCRUMBS;
	    },
	    
	    bindMenutabEvents: function() {
	        navigationElement.bind("menutabChanged", function() {
                methods.activateMenu();
            }).bind("menuDeactivated", function() {
                methods.deactivateMenu();
            });
	    },
	    
	    updateMenu: function(element) {
            var context = $(element).parent().parent().parent();
            $(".marked", context).removeClass("marked");
            $(element).parent().addClass("marked");
            $(".breadcrumb", $(element).parent()).addClass("marked");
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
	                    if ($(this).attr("href") == "#") {
	                        event.preventDefault();
	                    }
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