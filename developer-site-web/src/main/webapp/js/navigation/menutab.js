(function($) {
	var navigationElement;
    var activeMenutab;
    var busy = false;
    var options = {
        hidden: false,
        defaultTab: 0
    }
	
	var methods = {
		init: function(optionsArg) {
		    $.extend(options, optionsArg)
			navigationElement = this;
			methods.bindEvents();
            methods.hideTabs(function() {
                if (!options.hidden) {
                    methods.showTab(defaultTab);
                }
                else {
                    navigationElement.menutab.hidden = true;
                }
            });
			return this;
		},
		
		bindEvents: function() {
            methods.getLaunchers().each(function(i, launcher) {
                $(launcher).click(function(event) {
                    methods.launch(i);
                    event.preventDefault();
                });
            });
			return this;
		},

		hideTabs: function(callback) {
            //console.debug("hideTabs()");
            busy = true;
            var tabs = methods.getTabs();
            var i = 0;
            $(methods.getLaunchers()[0]).each(function(i, launcher) {
                $(launcher).removeClass("menutab-selected");
            });
            tabs.hide(0, function() {
                i = i + 1;
                if (i == tabs.length && callback != null) {
                    busy = false;
                    callback();
                }
            });
		},

        hideActive: function(callback, hideTabFirst) {
            //console.debug("hideActive()");
            busy = true;
            if (activeMenutab == null) {
                busy = false;
                if (callback != null) {
                    callback();
                }
                return this;
            }

            if (hideTabFirst) {
                $(activeMenutab.launcher).removeClass("menutab-selected");
            }
            $(activeMenutab.tab).slideUp(
                "normal",
                function() {
                    if (!hideTabFirst) {
                        $(activeMenutab.launcher).removeClass("menutab-selected");
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
            //console.debug("showTab("+i+")");
            busy = true;
            menutab = {
                index: i,
                launcher: methods.getLaunchers()[i],
                tab: methods.getTabs()[i]
            };
            $(menutab.launcher).addClass("menutab-selected");
            $(menutab.tab).slideDown("normal", function() {
                if (callback != null) {
                    busy = false;
                    callback();
                }
            });
            activeMenutab = menutab;
            busy = false;
        },

        changeTab: function(i, callback) {
            //console.debug("changeTab("+i+")");
            navigationElement.trigger("changeTab", [ i, (activeMenutab ? activeMenutab.index : null) ]);
            busy = true;
            menutab = {
                index: i,
                launcher: methods.getLaunchers()[i],
                tab: methods.getTabs()[i]
            };
            $(menutab.launcher).addClass("menutab-selected");
            
            if (activeMenutab == null) {
                methods.showTab(i, callback);
            }
            else {
                methods.hideActive(function() {methods.showTab(i, callback);}, true);
            }
        },

        launch: function(i) {
            if (busy) {
                return;
            }
            //console.debug("launch(" + i + ")");
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

        getTabs: function() {
            return $(".navigation-tabs > *", navigationElement);
        },

        getLaunchers: function() {
            return $(".navigation-launchers > *", navigationElement);
        },
        
        isBusy: function() {
            return busy;
        },
        
        getActive: function() {
            return activeMenutab;
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