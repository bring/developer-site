/**
 * Menutabs
 * 
 * Example:
 * 
 * <div id="launchers">
 * 		<div id="menutabs-1-launcher">
 * 			<a href="#menutabs-1">Launch tab 1</a>
 * 			<span>Description of tab 1</a>
 * 		</div>
 * 		<div id="menutabs-2-launcher">
 * 			<a href="#menutabs-2">Launch tab 2</a>
 * 			<span>Description of tab 2</a>
 * 		</div>
 * </div>
 * 
 * <div id="menutabs-1">Tab 1</div>
 * <div id="menutabs-2">Tab 2</div>
 * 
 * <script>
 * 		$.fn.menutab(
 *			"init",
 *			"#launchers",
 *			[ "a[href=#menutabs-1]", "a[href=#menutabs-2]", "a[href=#menutabs-3]"]
 *		 );
 * </script>
 */

(function($) {
	var active = null;
	var container = null;
	
	var methods = {
			init: function(containerSelector, launcherSelectors) {
				container = $(containerSelector);
				$(launcherSelectors).each(
					function(i,tab) {
						var launchLink = $(tab);
						var hash = launchLink.attr("href").slice(launchLink.attr("href").indexOf("#"));
						$(launchLink.attr("href")).hide();
						$(tab).click(function(event) {
//							window.location.hash = hash;
							$.fn.menutab("tabSelected", hash);
							event.preventDefault();
						})
						if ($(launchLink.attr("href")+"-launcher").hasClass("menutab-selected")) {
							methods.tabSelected(launchLink.attr("href"));
						}
					}
				);
			},
			
			deactivateTab: function(callback) {
				if (active == null) {
					if (callback != null) {
						callback();
					}
					return this;
				}
				active.tab.hide(5,callback);
				active.launcher.removeClass("menutab-selected");
				active = null;
				return this;
			},
			
			activateTab: function(tab, callback) {
				active = tab;
				active.launcher.addClass("menutab-selected");
				active.tab.show(5,callback);
				return this;
			},
			
			tabSelected: function(tabId) {
				var tab = $(tabId);
				var launcher = $(tabId+"-launcher");
				
				if (active != null && tab.attr("id") == active.tab.attr("id")) {
					methods.deactivateTab(function() {container.trigger("tabsDeactivated");});
				}
				else {
					methods.deactivateTab(function() {
						activeElement = {
							launcher: launcher,
							tab: tab
						}
						if (active == null) {
							methods.activateTab(activeElement, function() {container.trigger("tabsActivated")});
						}
						else {
							methods.activateTab(activeElement);
						}
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
	$("#navigation").bind("tabsActivated", function(event) {
		$(this).children().removeClass("box");
		$(this).children().addClass("menutab");
	});
	
	$("#navigation").bind("tabsDeactivated", function(event) {
		$(this).children().removeClass("menutab");
		$(this).children().addClass("box");
	});
	
	$.fn.menutab(
		"init",
		"#navigation",
		[ "a[href=#learn]", "a[href=#download]", "a[href=#talk]"]
	);
 });