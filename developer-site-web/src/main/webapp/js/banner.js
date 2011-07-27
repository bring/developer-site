/**
 * Banner
 */

(function($) {
	
	var options = {
		addHoverClass : "custom-section"
	};
	
	var methods = {
		init : function(optionsArg) {
			$.extend(options, optionsArg);
			
			var banner = $(this);
			$(".banner-section", $(this)).each(function(index, item) {
				item = $(item);
				var itemBanner = item.attr("data-background");
				item.hover(
					function() {
						banner.addClass(itemBanner);
						banner.addClass(options.addHoverClass);
					},
					function() {
						banner.removeClass(itemBanner);
						banner.removeClass(options.addHoverClass);
					}
				);
			});
		}
	}
	
	$.fn.bringBanner = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' + method + ' does not exist.');
		}   
	}
	
})(jQuery);