(function($) {
	var active = null;
	var ignoreEvents = false;
	
	var options = {
		section: "#learn",
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
			return this;
		},
		
		clean: function() {
			methods.hideTabs();
			methods.unmarkLaunchers();
			active = null;
			return this;
		},
		
		tabSelected: function(tabId) {
			if (ignoreEvents)
				return this;
			ignoreEvents = true;
			
			var chosen = methods.getChosen(tabId);
			
			if (methods.isActive(chosen)) {
				console.log("isActive")
				options.reset(methods, options);
				ignoreEvents = false;
			}
			else if (methods.tabsActivated()) {
				console.log("tabsActivated");
				methods.unmarkLauncher(active.launcher);
				methods.markLauncher(chosen.launcher);
				methods.deactivateTab(function() {methods.activateTab(chosen); ignoreEvents = false;});
			}
			else {
				console.log("!tabsActivated");
				methods.markLauncher(chosen.launcher);
				methods.activateTab(chosen, function() {ignoreEvents = false});
			}
			return this;
		},
		
		activateTab: function(activeElement, callback) {
			console.log("activating: "+activeElement.tab.attr("id"));
			active = activeElement;
			methods.fixHeight(active.tab);
			methods.showTab(active.tab, callback);
			return this;
		},
		
		deactivateTab: function(callback) {
			console.log("deactivating:"+active.tab.attr("id"));
			methods.hideTab(active.tab, callback);
			active = null;
			return this;
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
			return this;
		},
		
		fixHeight: function(activeMenu) {
//            var menuElementHeight = $("li a",activeMenu).outerHeight()+2; // Bug #7693 in jQuery ... 
			var menuElementHeight = 36;
            var numberOfMenuElements = 0;
            $("ul, .marked ul",activeMenu).each(function(i,element) {
            	numberOfMenuElements = Math.max(numberOfMenuElements, $(element).children("li").length);
            });
        	activeMenu.height(numberOfMenuElements*menuElementHeight);
        	return this;
		},
		
		handleCallback: function(callback) {
			if (callback != null) {
				callback();
			}
			return this;
		},
		
		showTab: function(tab, callback) {
			tab.slideDown(500,callback);
			return this;
		},
		
		hideTab: function(tab, callback) {
			tab.slideUp(500, callback);
			return this;
		},
		
		hideTabs: function() {
			$(options.tabs).each(function(i,element) {
				methods.hideTab($(element));
			});
			return this;
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
			return this;
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