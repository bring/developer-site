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
		init: function(containerSelector, tabSelectors, selectedTab, selectedLauncher) {
			container = $(containerSelector);
			$(tabSelectors).each(
				function(i,tabSelector) {
					$(tabSelector).hide();
					
					// Bind event
					$("[href="+tabSelector+"]").click(function(event) {
//							window.location.hash = hash;
						$.fn.menutab("tabSelected", tabSelector);
						event.preventDefault();
					})
				}
			);
			
			if (selectedTab != null) {
				methods.tabSelected(selectedTab);
			}
		},
		
		handleCallback: function(callback) {
			if (callback != null) {
				callback();
			}
		},
		
		deactivateTab: function(callback) {
			active.tab.hide(5,callback);
			active.launcher.removeClass("menutab-selected");
			active = null;
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
				var activeElement = {
					launcher: launcher,
					tab: tab
				}
				if (active == null) {
					methods.activateTab(activeElement, function() {container.trigger("tabsActivated")});
				}
				else {
					methods.deactivateTab(function() {methods.activateTab(activeElement);});
				}
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
		[ "#learn", "#download", "#talk", "#breadcrumbs" ]
//		"#learn"
	);
 });