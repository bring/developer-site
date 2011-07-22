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
                menuElement.stop().animate({
                    height: maxHeight 
                });
            }
            console.debug(maxHeight);
        	return this;
		},
	    
	    updateMenuPath: function(element) {
	        console.log("updateMenuPath");
            var context = $(element).parentsUntil("li.marked");
            $(".marked", context).removeClass("marked");
            console.log($(element).parent());
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
