/**
 * @todo Mulighet for preventDefault
 * @todo Rydde i reset options.metoden, muligens bruke events heller?
 * @todo calculateHeight burde ikke bruke #breadcrumbs direkte
 * @todo Rydde menuActivated og duration
 */

(function($) {
	var active = null;
	var ignoreEvents = false;
	var navigationElement;
	var initialized = false;
	var menuActivated = false;
	
	var options = {
		section: "#learn",
		tabs: [ "#learn", "#download", "#talk" ],
		duration: 350,
		
		reset: function(methods, options, callback) {
			var chosen = {
				tab: $("#breadcrumbs"), 
				launcher: $(options.section+"-launcher")
			};
			
			if (!initialized) {
				methods.clean();
				methods.markLauncher($(options.section+"-launcher"));
				methods.activateTab(chosen, callback);
				initialized = true;
			}
			else {
				methods.unmarkLauncher(active.launcher);
				methods.markLauncher(chosen.launcher);
				methods.deactivateTab(function() {methods.activateTab(chosen, callback);});
				navigationElement.trigger("menutabActivated");
			}
		}
	};
	
	var methods = {
		init: function(optionsArg) {
			navigationElement = this;
			$.extend(options,optionsArg)
			methods.bindEvents();
			methods.calculateHeights();
			options.reset(methods, options);
			return this;
		},
		
		reset: function() {
			options.reset();
		},
		
		clean: function() {
			methods.hideTabs(0);
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
				menuActivated = false;
				options.reset(methods, options, function() { ignoreEvents = false; }); 
				navigationElement.trigger("menuDeactivated");
			}
			else if (methods.tabsActivated()) {
				menuActivated = true;
				methods.unmarkLauncher(active.launcher);
				methods.markLauncher(chosen.launcher);
				methods.deactivateTab(function() {methods.activateTab(chosen); ignoreEvents = false;});
				navigationElement.trigger("menutabChanged");
			}
			else {
				menuActivated = true;
				methods.markLauncher(chosen.launcher);
				methods.activateTab(chosen, function() {ignoreEvents = false});
				navigationElement.trigger("menuActivated");
				console.log("activated");
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
			methods.hideTab(active.tab, callback);
			active = null;
			return this;
		},
		
		bindEvents: function() {
			navigationElement.bind("clickoutside", function() {
				if (!menuActivated) {
					return this;
				}
				ignoreEvents = true;
				options.reset(methods, options, function() {ignoreEvents = false});
				navigationElement.trigger("menuDeactivated");
				menuActivated = false;
			});
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
            var maxHeight = 0;
            //add(".dropdown-menu").
            methods.calculateHeight(activeMenu);
            $(".menulist, .marked > ul, .dropdown-menu",activeMenu).each(function(i,element) {
            	maxHeight = Math.max(maxHeight, $(element).data("height"));
            });
            activeMenu.height(maxHeight);
        	return this;
		},
		
		calculateHeights: function() {
			$(options.tabs).each(function(i,tab) {
				methods.calculateHeight(tab);
			});
		},
		
		calculateHeight: function(tab) {
			$(".menulist, .marked > ul, .dropdown-menu", $(tab)).add($("#breadcrumbs ul")).each(function(i2, ul) {
				$(ul).data("height", methods.getHeight(ul));
			});
		},
		
		getHeight: function(element) {
			return $(element).actual("outerHeight");
		},
		
		handleCallback: function(callback) {
			if (callback != null) {
				callback();
			}
			return this;
		},
		
		showTab: function(tab, callback, duration) {
			tab.slideDown(isNaN(duration) ? options.duration : duration,callback);
			return this;
		},
		
		hideTab: function(tab, callback, duration) {
			tab.slideUp(isNaN(duration) ? options.duration : duration, callback);
			return this;
		},
		
		hideTabs: function(duration) {
			$(options.tabs).each(function(i,element) {
				methods.hideTab($(element), undefined, isNaN(duration) ? options.duration : duration);
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