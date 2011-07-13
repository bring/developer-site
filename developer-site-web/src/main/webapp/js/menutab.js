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
	var methodsOverride = {};
	
	var options = {
		section: "#learn",
		tabs: [ "#learn", "#download", "#talk" ],
		
		resetTabs: function() {
			methods.hideTabs();
			methods.unmarkLaunchers();
			methods.activateTab({
				tab: $("#breadcrumbs"), 
				launcher: $(options.section+"-launcher")
			});
		},
	}
	
	var methods = {
		init: function(containerSelector, tabSelectors, selectedTab,overrideMethods) {
			methodsOverride = overrideMethods; // TODO remove?
			container = $(containerSelector);
			methods.bindEvents();
			options.resetTabs();
		},
		
		hideTabs: function() {
			$(options.tabs).each(function(i,element) {
				$(element).hide();
			});
		},
		
		unmarkLaunchers: function() {
			$(options.tabs).each(function(i,element) {
				methods.unmarkLauncher($(element+"-launcher"));
			});
		},
		
		bindEvents: function() {
			$(options.tabs).each(
				function(i,tabSelector) {
					// Bind event
					$("[href="+tabSelector+"]").click(function(event) {
						$.fn.menutab("tabSelected", tabSelector);
						event.preventDefault();
					})
				}
			);
		},
		
		fixHeight: function(activeMenu) {
//            var menuElementHeight = $("li a",activeMenu).outerHeight()+2; // Bug #7693 in jQuery ... 
			var menuElementHeight = 36;
            var numberOfMenuElements = 0;
            $("ul, .marked ul",activeMenu).each(function(i,element) {
            	numberOfMenuElements = Math.max(numberOfMenuElements, $(element).children("li").length);
            });
        	activeMenu.height(numberOfMenuElements*menuElementHeight);
        	console.log(activeMenu);
		},
		
		handleCallback: function(callback) {
			if (callback != null) {
				callback();
			}
		},
		
		deactivateTab: function(callback) {
			if (methodsOverride.deactivateTab) {
				methodsOverride.deactivateTab(active,callback);
				return
			}
			active.tab.slideUp(500,callback);
			active.launcher.removeClass("menutab-selected");
			active = null;
		},
		
		markLauncher: function(launcher) {
			launcher.addClass("menutab-selected");
			return this;
		},
		
		unmarkLauncher: function(launcher) {
			launcher.removeClass("menutab-selected");
			return this;
		},
		
		activateTab: function(activeElement, callback) {
			active = activeElement;
			methods.fixHeight(active.tab);
			active.tab.slideDown(500,callback);
			methods.markLauncher(active.launcher);
			return this;
		},
		
		setLauncherHref: function(launcher, href) {
			$("a",launcher).attr("href",href);
		},
		
		tabSelected: function(tabId) {
			var tab = $(tabId);
			var launcher = $(tabId+"-launcher");
			if (active != null && tab.attr("id") == active.tab.attr("id")) {
				//methods.deactivateTab(function() {container.trigger("tabsDeactivated");});
				options.resetTabs();
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

//$(document).ready(function() {
//	$("#navigation").bind("tabsActivated", function(event) {
//		$(this).children().removeClass("box");
//		$(this).children().addClass("menutab");
//	});
//	
//	$("#navigation").bind("tabsDeactivated", function(event) {
//		$(this).children().removeClass("menutab");
//		$(this).children().addClass("box");
//	});
//	
//	$.fn.menutab(
//		"init",
//		"#navigation",
//		[ "#learn", "#download", "#talk", "#breadcrumbs" ]
////		"#learn"
//	);
// });