(function($) {
	var navigationElement;
	var options = {
        currentUrl: window.location.pathname + window.location.search,
	};
    var menuElement = $("#learn");
	
	var methods = {
	    init: function(optionsArg) {
	        navigationElement = this;
	        $.extend(options, optionsArg);
            methods.recalculateHeight(true);
            methods.bindEvents();
            return this;
	    },
	    
		recalculateHeight: function(hidden) {
            var maxHeight = 0;
			$(".menulist, .menulist .marked > ul", menuElement).each(function(i, ul) {
            	maxHeight = Math.max(maxHeight, $(ul).actual("outerHeight"));
			});
            if (hidden) {
                menuElement.css("height", maxHeight);
            }
            else {
                navigationElement.menutab("stop");
                navigationElement.menutab("markActive");
                menuElement.animate({
                    padding: "10px 0",
                    height: maxHeight 
                });
            }
        	return this;
		},
	    
	    updateMenuPath: function(element) {
            var context = $(element).parentsUntil("li.marked");
            $(".marked", context).removeClass("marked");
            $(element).parent().addClass("marked");
            methods.recalculateHeight();
	    },
	    
	    bindEvents: function() {
	        $(".menubutton", navigationElement).bind({
	            mouseover: function(event) {
	                methods.updateMenuPath(this);
	                event.preventDefault();    
	            },
	            click : function(event) {
	                if ($(this).attr("href") == "#") {
	                    event.preventDefault();
	                }    
	            }
	        });
	    },
	    
	    unmarkAll: function() {
	        $(".marked", navigationElement).removeClass("marked");
	    }
	};
	
    $.fn.menu = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist');
        }   
    }
})(jQuery);