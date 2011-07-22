(function($) {
    var State = {
        HIDDEN: 0,
        MENU: 1,
        BUSY: 2
    }
    var state = State.HIDDEN;
	var active = null;
	var navigationElement;
	
	var options = {
		sectionId: "#chosen-section",
		tabs: [ "#learn", "#download", "#talk" ],
		duration: 350,
		menu: {},
	};
	
	var methods = {
		init: function(optionsArg) {
			navigationElement = this;
			$.extend(options,optionsArg);
			methods.bindEvents();
			methods.clean();
            methods.stateHidden();
			this.menu(options.menu); // Start menu functionality
			return this;
		},
		
		tabSelected: function(tabId) {
		    if (state == State.HIDDEN) {
		        console.log("tabSelected (State.HIDDEN)");
                methods.stateMenu(tabId);
            }
			
			else if (state == State.MENU) {
			    if (methods.isActive(methods.getChosen(tabId))) {
			        console.log("tabSelected (State.MENU, Clicked on active launcher)");
			        methods.stateHidden();
			    }
			    else {
			        console.log("tabSelected (State.MENU, Clicked on )");
			        methods.changeMenutab(tabId);
			    }
			}
		    
			return this;
		},
	      
        stateMenu: function(tabId, callback) {
            if (state == State.BUSY) {
                return this;
            }
            navigationElement.trigger("stateMenu", [ methods ]);
            methods.changeMenutab(tabId);
            return this;
        },
        
        stateHidden: function(callback) {
            if (state == State.BUSY) {
                return this;
            }
            
            var event = jQuery.Event("stateHiddenBefore");
            var eventData = {tabToHeight: 0};
            navigationElement.trigger(event, [ methods, eventData ]);
            if (event.isDefaultPrevented()) {
                return this;
            }
            
            state = State.BUSY;
            methods.deactivateTab(function() {
                if (active != null) {
                    methods.unmarkLauncher(active.launcher);
                }
                else {
                    methods.unmarkLauncher(options.sectionId);
                    methods.hideTab($(options.sectionId));
                }
                state = State.HIDDEN;
                methods.handleCallback(callback);
                navigationElement.trigger("stateHiddenAfter", [ methods ]);
            }, eventData.tabToHeight);
            return this;
        },
		
		changeMenutab: function(tabId, callback) {
            if (state == State.BUSY) {
                return this;
            }
            
            state = State.BUSY;
            var chosen = methods.getChosen(tabId);
            if (active != null) {
                methods.unmarkLauncher(active.launcher);
            }
            methods.markLauncher(chosen.launcher);
            methods.deactivateTab(function() {
                methods.activateTab(chosen); 
                state = State.MENU;
            });
            return this;
		},

		activateTab: function(activeElement, callback) {
			active = activeElement;
			methods.fixHeight(active.tab);
			methods.showTab(active.tab, callback);
			return this;
		},
		
		deactivateTab: function(callback, tabToHeight) {
		    if (active == null) {
		        return methods.handleCallback(callback);
		    }
			methods.hideTab(active.tab, tabToHeight, callback);
			active = null;
			return this;
		},
		
		bindEvents: function() {
			navigationElement.bind("clickoutside", function() {
			    if (state != State.HIDDEN) {
			        methods.stateHidden();
			    }
			});
			$(options.tabs).each(
				function(i,tabSelector) {
					$("[href="+tabSelector+"]").click(function(event) {
						methods.tabSelected(tabSelector);
						event.preventDefault();
					})
				}
			);
			return this;
		},
		
		fixHeight: function(activeMenu) {
            var maxHeight = 0;
            methods.calculateHeight(activeMenu);
            $(".menulist, .marked > ul, .dropdown-menu",activeMenu).each(function(i,element) {
            	maxHeight = Math.max(maxHeight, $(element).data("visibleHeight"));
            });
            activeMenu.data("currentHeight", maxHeight);
        	return this;
		},
		
		calculateHeight: function(tab) {
			$(".menulist, .marked > ul, .dropdown-menu", $(tab)).each(function(i2, ul) {
				$(ul).data("visibleHeight", methods.getHeight(ul));
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
            duration = isNaN(duration) ? options.duration : duration;
		    if(true || tab.is(":visible")) {
		        tab.css({
		            display: "block",
		            visibility: "visible"
		        });
	            tab.animate({
	                height : tab.data("currentHeight")
	            }, duration, callback);
		    }
		    else {
    			tab.slideDown(duration, callback);
		    }
			return this;
		},
		
		hideTab: function(tab, tabToHeight, callback, duration) {
		    duration = isNaN(duration) ? options.duration : duration;
		    
		    if(isNaN(tabToHeight) || tabToHeight <= 0) {
		        tab.slideUp(duration, callback);
		    }
		    else {
		        tab.animate({height: tabToHeight}, duration, function() {
		            if(tabToHeight == 0) {
    		            tab.css({
    		                display: "none",
    		                visibility: "hidden"
    		            });
		            }
		            methods.handleCallback(callback);
		        });
		    }
			return this;
		},
		
		hideTabs: function(duration) {
			$(options.tabs).each(function(i,element) {
				methods.hideTab($(element), 0, undefined, isNaN(duration) ? options.duration : duration);
			});
			return this;
		},
		
		markLauncher: function(launcher) {
			launcher.addClass("menutab-selected");
			return this;
		},
		
		getActive: function() {
		    return active;
		},
		
		unmarkLauncher: function(launcher) {
			$(launcher).removeClass("menutab-selected");
			return this;
		},
		
		unmarkLaunchers: function() {
			$(options.tabs).each(function(i,element) {
				methods.unmarkLauncher($(element+"-launcher"));
			});
			return this;
		},
		
		eachLauncher: function(delegate) {
		    $(options.tabs).each(function(i,element) {
		        delegate(i,$(element+"-launcher"));
		    });
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
	      
        clean: function() {
            methods.hideTabs(0);
            methods.unmarkLaunchers();
            active = null;
            return this;
        },
		
	};
	
	$.fn.menutab = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' + method + ' does not exist.');
		}   
	}
})( jQuery );