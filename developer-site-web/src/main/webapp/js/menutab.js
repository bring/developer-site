(function($) {
	var active = null;
	var container = null;
	
	var options = {
		section: "#learn",
		navigation: "#navigation",
		tabs: [ "#learn", "#download", "#talk" ],
		
		reset: function(methods, options) {
			methods.clean();
			methods.markLauncher($(options.section+"-launcher"));
			methods.activateTab({
				tab: $("#breadcrumbs"), 
				launcher: $(options.section+"-launcher")
			});
		}
	};
	
	var methods = {
		init: function(optionsArg) {
			$.extend(options,optionsArg)
			options.reset(methods, options);
			methods.bindEvents();
		},
		
		clean: function() {
			methods.hideTabs();
			methods.unmarkLaunchers();
		},
		
		tabSelected: function(tabId) {
			var chosen = methods.getChosen(tabId);
			
			if (methods.isActive(chosen)) {
				options.reset(methods, options);
			}
			else if (methods.tabsActivated()) {
				methods.markLauncher(chosen.launcher);
				methods.deactivateTab(function() {methods.activateTab(chosen);});
			}
			else {
				methods.activateTab(chosen, function() {$(options.navigation).trigger("tabsActivated")});
			}
			
			return this;
		},
		
		activateTab: function(activeElement, callback) {
			active = activeElement;
			methods.fixHeight(active.tab);
			methods.showTab(active.tab, callback);
			return this;
		},
		
		deactivateTab: function(callback) {
			methods.hideTab(active.tab, callback)
			active.launcher.removeClass("menutab-selected");
			active = null;
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
		},
		
		handleCallback: function(callback) {
			if (callback != null) {
				callback();
			}
		},
		
		
		showTab: function(tab, callback) {
			tab.slideDown(500,callback);
		},
		
		hideTab: function(tab, callback) {
			tab.slideUp(500, callback);
		},
		
		hideTabs: function() {
			$(options.tabs).each(function(i,element) {
				methods.hideTab($(element));
			});
		},
		
		markLauncher: function(launcher) {
			launcher.addClass("menutab-selected");
			return this;
		},
		
		unmarkLauncher: function(launcher) {
			launcher.removeClass("menutab-selected");
			return this;
		},
		
		unmarkLaunchers: function() {
			$(options.tabs).each(function(i,element) {
				methods.unmarkLauncher($(element+"-launcher"));
			});
		},
		
		setLauncherHref: function(launcher, href) {
			$("a",launcher).attr("href",href);
		},
		
		getChosen: function(tabId) {
			return activeElement = {
				tab: $(tabId),
				launcher: $(tabId+"-launcher")
			}
		},
		
		isActive: function(chosen) {
			return active != null && chosen.tab.attr("id") == active.tab.attr("id");
		},
		
		tabsActivated: function() {
			return active != null;
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