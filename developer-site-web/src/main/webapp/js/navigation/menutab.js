(function($) {
	var navigationElement;
    var activeMenutab;
    var busy = false;
    var tabs;
    var launchers;
    
    var options = {
        hidden: false,
        defaultTab: 0
    }
	
	var methods = {
		init: function(optionsArg) {
		    $.extend(options, optionsArg);
			navigationElement = this;
            tabs = $(".navigation-tabs > *", navigationElement);
            launchers = $(".navigation-launchers > *", navigationElement);
			methods.bindEvents();
            methods.hideTabs(function() {
                if (!options.hidden) {
                    methods.showTab(options.defaultTab);
                }
                else {
                    navigationElement.menutab.hidden = true;
                }
            });
			return this;
		},
		
		bindEvents: function() {
            launchers.each(function(i, launcher) {
                $(launcher).click(function(event) {
                    methods.launch(i);
                    event.preventDefault();
                });
            });
			return this;
		},

		hideTabs: function(callback) {
            $(launchers).each(function(i, launcher) {
                methods.unmarkLauncher(launcher);
            });
            var i = 0;
            tabs.hide(0, function() {
                i = i + 1;
                if (i == tabs.length && callback != null) {
                    callback();
                } 
            });
		},
		
		hideActive: function(callback, hideTabFirst) {
		    methods.hideTab(activeMenutab, callback, hideTabFirst);
		},

        hideTab: function(menutab, callback, hideTabFirst) {
            busy = true;
            if (menutab == null) {
                busy = false;
                if (callback != null) {
                    callback();
                }
                return this;
            }
            
            $(menutab.tab).stop(false,true);
            
            if (hideTabFirst) {
                methods.unmarkLauncher(menutab.launcher);
            }
            $(menutab.tab).slideUp("normal",
                function() {
                    if (!hideTabFirst) {
                        methods.unmarkLauncher(menutab.launcher);
                    }
                    busy = false;
                    if (callback != null) {
                        callback();
                    }
                }
            );
            return this;
        },

        showTab: function(i, callback) {
            busy = true;
            if (activeMenutab != undefined) {
                $(activeMenutab.tab).stop(false,true);
            }
            activeMenutab = {
                index: i,
                launcher: launchers[i],
                tab: tabs[i]
            };
            
            methods.markLauncher(activeMenutab.launcher);
            $(activeMenutab.tab).slideDown("normal", function() {
                busy = false;
                if (callback != null) {
                    callback();
                }
            });
        },

        changeTab: function(i, callback) {
            busy = true;
            if (activeMenutab != undefined) {
                $(activeMenutab.tab).stop(false,true);
            }
            var oldMenutab = activeMenutab;
            var newMenutab = {
                index: i,
                launcher: launchers[i],
                tab: tabs[i]
            };
            $(newMenutab.tab).stop(false,true);
            activeMenutab = newMenutab;

            methods.markLauncher(newMenutab.launcher);
            methods.hideTab(oldMenutab, function(){methods.showTab(i,callback);}, true);
            navigationElement.trigger("changeTab", [ i, (activeMenutab ? activeMenutab.index : null) ]);
        },

        launch: function(i) {
//            if (busy) {  
//                return;
//            }

            methods.stop();
            var event = jQuery.Event("launch");
            navigationElement.trigger(event, [ i, (activeMenutab ? activeMenutab.index : null) ]);
            if (event.isDefaultPrevented()) {
                return this;
            }
            
            if (activeMenutab && i != activeMenutab.index) {
                methods.changeTab(i);
            }
            else {
                methods.showTab(i);
            }
            return this;
        },
        
        stop: function() {
            $(tabs).each(function(i,tab) {
                $(tab).stop(false,true);
            });
//            $(launchers).each(function(i,launcher) {
//                methods.unmarkLauncher(launcher);
//            });
        },
        
        unmarkLauncher: function(launcher) {
            $(launcher).removeClass("menutab-selected");
        },
        
        markLauncher: function(launcher) {
            $(launcher).addClass("menutab-selected");
        },
        
        markActive: function() {
            if (activeMenutab != null) {
                methods.markLauncher(activeMenutab.launcher);
            }
        },
        
        getActive: function() {
            return activeMenutab;
        },

        getTabs: function() {
            return tabs;
        },

        getLaunchers: function() {
            return launchers;
        },
        
        isBusy: function() {
            return busy;
        }
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