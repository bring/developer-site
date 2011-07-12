/**
 * Menutab 
 */

(function($) {
	var active = null;
	var container = null;
	
	var methods = {
			init: function(containerId, launcherIds) {
				container = $(containerId);
				$(launcherIds).each(
					function(i,element) {
						var launchLink = $(element);
						var hash = launchLink.attr("href").slice(launchLink.attr("href").indexOf("#"));
						$(launchLink.attr("href")).hide();
						$(element).click(function(event) {
//							window.location.hash = hash;
							$.fn.menutab("tabSelected", hash);
							event.preventDefault();
						})
					}
				);
			},
			
			deactivateTab: function(callback) {
				if (active == null) {
					return (callback != null) ? callback() : this;
				}
				active.element.slideUp("fast",callback);
				active.launcher.removeClass("menutab-selected");
				active = null;
			},
			
			activateTab: function(tab, callback) {
				active = tab;
				active.launcher.addClass("menutab-selected");
				active.element.slideDown("fast",callback);
			},
			
			tabSelected: function(tabId) {
				var element = $(tabId);
				var launcher = $(tabId+"-launcher");
				
				if (active != null && element.attr("id") == active.element.attr("id")) {
					container.trigger("beforeHide");
					methods.deactivateTab(function() {container.trigger("afterHide");});
				}
				else {
					methods.deactivateTab(function() {
						container.trigger("beforeShow");
						methods.activateTab({
							launcher: launcher,
							element: element
						});
						container.trigger("afterShow");
					});
				}
				
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
	$("#launchers").bind("beforeShow", function(event) {
		$(this).children().removeClass("box");
		$(this).children().addClass("menutab");
	});
	
	$("#launchers").bind("afterHide", function(event) {
		$(this).children().removeClass("menutab");
		$(this).children().addClass("box");
	});
	
	$.fn.menutab(
			"init",
			"#launchers",
			[ "a[href=#menutabs-1]", "a[href=#menutabs-2]", "a[href=#menutabs-3]"]
	);
	
 });