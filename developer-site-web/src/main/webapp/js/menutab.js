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
			methods.calculateHeights();
			methods.clean();
            methods.stateHidden();
			this.menu(options.menu);
			return this;
		},
		
		tabSelected: function(tabId) {
		    if (state == State.HIDDEN) {
                methods.stateMenu(tabId);
            }
			
			else if (state == State.MENU) {
			    if (methods.isActive(methods.getChosen(tabId))) {
			        methods.stateHidden();
			    }
			    else {
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
        
        hideHelper: function(callback) {
            state = State.HIDDEN;
            methods.handleCallback(callback);
            navigationElement.trigger("stateHiddenAfter", [ methods ]);
            return this;
        },
        
        stateHidden: function(callback) {
            if (state == State.BUSY) {
                return this;
            }
            navigationElement.trigger("stateHiddenBefore", [ methods ]);
            state = State.BUSY;
            var chosen = methods.getBreadcrumbs();
            if (chosen.tab.length == 0) {
                methods.deactivateTab(function() {
                    if (active != null) {
                        methods.unmarkLauncher(active.launcher);
                    }
                   methods.hideHelper();
                });
                return this;
            }
            if (active != null) {
                methods.unmarkLauncher(active.launcher);
            }
            methods.markLauncher(chosen.launcher);
            methods.deactivateTab(function() {
                methods.activateTab(chosen, function() {
                    methods.hideHelper();
                });
            });
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
		
		deactivateTab: function(callback) {
		    if (active == null) {
		        return methods.handleCallback(callback);
		    }
			methods.hideTab(active.tab, callback);
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
						$.fn.menutab("tabSelected", tabSelector);
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
			tab.slideDown(isNaN(duration) ? options.duration : duration, callback);
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
	      
        getBreadcrumbs: function() {
          return { 
              tab: $("#breadcrumbs"), 
              launcher: $(options.section+"-launcher")
          };
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
			$.error('Method ' + method + ' does not exist on jQuery.tooltip');
		}   
	}
})( jQuery );