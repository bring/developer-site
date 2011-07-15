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
			methods.bindEvents();
			methods.calculateHeights();
			options.reset(methods, options);
			return this;
		},
		
		reset: function() {
			options.reset();
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
				options.reset(methods, options);
				ignoreEvents = false;
			}
			else if (methods.tabsActivated()) {
				methods.unmarkLauncher(active.launcher);
				methods.markLauncher(chosen.launcher);
				methods.deactivateTab(function() {methods.activateTab(chosen); ignoreEvents = false;});
			}
			else {
				methods.markLauncher(chosen.launcher);
				methods.activateTab(chosen, function() {ignoreEvents = false});
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
            $(".menulist, .marked > ul",activeMenu).each(function(i,element) {
            	maxHeight = Math.max(maxHeight, parseFloat($(element).css("max-height")));
            }.bind(this));
            activeMenu.height(maxHeight);
        	return this;
		},
		
		calculateHeights: function() {
			$(options.tabs).each(function(i,tab) {
				this.calculateHeight(tab);
			}.bind(methods));
		},
		
		calculateHeight: function(tab) {
			$(".menulist, .marked > ul", $(tab)).add($("#breadcrumbs ul")).each(function(i2, ul) {
				$(ul).css("max-height", this.getHeight(ul));
			}.bind(this));
		},
		
		getHeight: function(element) {
			var originalProperties = {};
			
			// Make height calculable
			$([ "visibility", "position", "display" ]).each(function(i, property) {
				originalProperties[property] = $(element).css(property);
			});
			$(element).css({
				visibility: "hidden",
				position: "fixed",
				display: "block"
			});
			
			var height = $(element).height();
			$(element).css(originalProperties);
			return height;
		},
		
		handleCallback: function(callback) {
			if (callback != null) {
				callback();
			}
			return this;
		},
		
		showTab: function(tab, callback, duration) {
			tab.slideDown(isNaN(duration) ? 500 : duration,callback);
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