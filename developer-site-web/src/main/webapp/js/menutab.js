/**
 * Menutab 
 */

(function($) {
	var shown = false;
	
	var methods = {
			init: function(options) {
			},
			show: function(selected, element) {
				 selected.parent().children().removeClass("box");
				 selected.parent().children().addClass("menutab");
				 selected.addClass("menutab-selected");
				 element.show();
				 return this;
			},
			hide:  function(selected, element) {
				element.hide();
				selected.parent().children().removeClass("menutab");
				selected.parent().children().addClass("box");
				selected.removeClass("menutab-selected");
				return this;
			},
			toggle: function(selected, element) {
				if (shown) {
					methods.hide(selected, element);
				}
				else {
					methods.show(selected, element);
				}
				shown = !shown;
				return this;
			}
	};
	
	$.fn.menutab = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' + method + ' does not exist on jQuery.tooltip');
		}   
	}
})( jQuery );

/**
 * Main
 */

$(document).ready(function() {
//	var showMenutab = true;
//	$("#menubox-learn").hide();
//	$("#menubox-download").hide();
//	$("#menubox-talk").hide();
//	
//	$("#learnlauncher").click(function(event) {
//		$.fn.menutab('toggle',$(this),$("#menubox-learn"));
//	});
//	
//	$("#downloadlauncher").click(function(event) {
//		$.fn.menutab('toggle',$(this),$("#menubox-download"));
//	});
//	
//	$("#talklauncher").click(function(event) {
//		$.fn.menutab('toggle',$(this),$("#menubox-talk"));
//	});
	
	$(function() {
		$( "#launchers" ).tabs();
	});
 });