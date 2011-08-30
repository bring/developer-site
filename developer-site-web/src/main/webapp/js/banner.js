/**
 * Banner
 */

(function($) {
	
	var methods = {
		init : function() {
			var banner = $(this);
			$(".banner-section", $(this)).each(function(index, item) {
				item = $(item);

				var cssClass = item.attr("class").replace("banner-section", "").replace(" ", "");

				item.hover(
					function() {
						banner.addClass(cssClass);
					},
					function() {
						banner.removeClass(cssClass);
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