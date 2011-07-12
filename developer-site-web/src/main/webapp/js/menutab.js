/**
 * Menutab 
 */

(function($) {
	var methods = {
			
			show: function(selected, element) {
				 selected.parent().children().removeClass("box");
				 selected.parent().children().addClass("menutab");
				 selected.addClass("menutab-selected");
				 element.show();
				 selected.data("activeTab",true);
				 return this;
			},
			hide: function(selected, element) {
				if (selected.data("activeTab")) {
					element.hide();
					selected.parent().children().removeClass("menutab");
					selected.parent().children().addClass("box");
					selected.removeClass("menutab-selected");
					selected.data("activeTab", false);
				}
				return this;
			},
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
	var showMenutab = true;
	$("#menutabs-1").hide();
	$("#menutabs-2").hide();
	$("#menutabs-3").hide();
	
	$("a[href=#menutabs-1]").click(function(event) {
		if ($(this).parent().parent().data("activeTab")) {
			$.fn.menutab('hide',$(this).parent().parent(),$("#menutabs-1"));
		}
		else {
			$.fn.menutab('hide',$("a[href=#menutabs-2]").parent().parent(),$("#menutabs-2"));
			$.fn.menutab('hide',$("a[href=#menutabs-3]").parent().parent(),$("#menutabs-3"));
			$.fn.menutab('show',$(this).parent().parent(),$("#menutabs-1"));
		}
	});
	
	$("a[href=#menutabs-2]").click(function(event) {
		$.fn.menutab('toggle',$(this).parent().parent(),$("#menutabs-2"));
	});
	
	$("a[href=#menutabs-3]").click(function(event) {
		$.fn.menutab('toggle',$(this).parent().parent(),$("#menutabs-3"));
	});
 });