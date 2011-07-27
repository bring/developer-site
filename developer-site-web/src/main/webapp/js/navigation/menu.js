(function($) {
	var navigationElement;
	var options = {
        currentUrl: window.location.pathname + window.location.search,
        initHeight: true,
	};
    var menuElement = $("#learn");
    var menulistElement = $(".menulist");
    var heightOfOneElement;
	
	var methods = {
	    init: function(optionsArg) {
	        navigationElement = this;
	        $.extend(options, optionsArg);
	        methods.bindEvents();
	        if (options.initHeight) {
	            methods.recalculateHeight(true);
	        }
            return this;
	    },
	    
	    slideToHeight: function(heightArg) {
	        navigationElement.trigger("menu-animation");
	        menuElement.animate({
                padding: "10px 0",
                height: heightArg
            });
	    },
	    
	    getHeightOfOneElement: function() {
	        if (heightOfOneElement == undefined) {
	            heightOfOneElement = $($("li:visible", menulistElement)[0]).height();
	        }
	        return heightOfOneElement;
	    },
	    
		recalculateHeight: function(hidden) {
            var maxHeight = 0;
			$(".marked > ul", menulistElement).add(menulistElement).each(function(i, ul) {
//            	maxHeight = Math.max(maxHeight, $(ul).actual("outerHeight"));
			    maxHeight = Math.max(maxHeight, $(ul).children().length*methods.getHeightOfOneElement());
			});
			
			var height = maxHeight + 10; 
            if (hidden) {
                menuElement.css("height", height);
            }
            else {
                methods.slideToHeight(height);
            }
        	return this;
		},
	    
	    updateMenuPath: function(linkElement) {
	        var event = jQuery.Event("updateMenuPath");
	        navigationElement.trigger(event);
	        if (event.isDefaultPrevented()) {
	            return;
	        }
	        
            var context = $(linkElement).parentsUntil(".marked");
            $(".marked", context).removeClass("marked");
            $(linkElement).parent().addClass("marked");
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
	        $(".marked", menulistElement).removeClass("marked");
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