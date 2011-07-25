// Tabs
(function($) {
	
	var codetabs;
	var triggers = [];
	
	var options = {
		cookies : false,
		cookieName : "codetabname",
		defaultTab : ""
	};
	
	var methods = {
			
		init: function(optionsArg) {
			codetabs = $(this);
			$.extend(options, optionsArg);
			
			methods.reorganizeTabsAndFindTriggers();
			methods.addEventsToTriggers();
			
			var cookieTab = methods.getTabNameFromCookie();
			var toTab = (options.cookies && cookieTab)
				? cookieTab : options.defaultTab;
			methods.showTabs(toTab, true);
			
			if(options.cookies) {
				methods.addCookieEvents();
			}
		},
		
		getTabNameFromCookie : function() {
			var tabName = $.cookie(options.cookieName);
			return tabName;
		},
		
		addCookieEvents : function() {
			codetabs.bind("showTab", function(e, toTab) {
				$.cookie(options.cookieName, toTab);
			});
		},
		
		reorganizeTabsAndFindTriggers : function() {
			codetabs.each(function(i, tabscontanier) {
				tabscontanier = $(tabscontanier);
				$(".tab", tabscontanier).each(function(i, tab) {
					tab = $(tab);
					tabscontanier.append(tab);
					
					var tabName = tab.attr("data-tab");
					tab.data("tab-name", tabName);
		
					var tabTriggers = $("a[href$=#" + tabName + "]", tabscontanier);
					$.merge(triggers, tabTriggers);
					tab.data("tab-triggers", tabTriggers);
				});
			});
		},
		
		addEventsToTriggers: function() {
			$(triggers).each(function(i, trigger) {
				$(trigger).click(function(e) {
					e.preventDefault();
					var openTabName = $(trigger).attr("href").substring(1);
					methods.showTabs(openTabName);
				});
			});
		},
		
		showTabs: function(tabName, fallbackToFirst) {
			var event = jQuery.Event("showTab");
			codetabs.trigger(event, [tabName]);
			if(event.isDefaultPrevented()) return;
			
			codetabs.each(function(i, tabscontainer) {
				methods.showTab(tabName, tabscontainer, fallbackToFirst);
			});
		},
		
		showTab: function(tabName, tabscontainer, fallbackToFirst) {
			
			tabName = ("" + tabName).toLowerCase();
			
			var firstTab = null;
			var foundRequestedTab = false;
			
			//var tab = $("*[data-tab="+tabName+"]", tabscontainer);
			var tabs = $(".tab", tabscontainer);
			$(tabs).each(function(i, tab) {
				var curTabName = ("" + $(tab).data("tab-name")).toLowerCase();
				if(i == 0) {
					firstTab = tab;
				}
				if (tabName === curTabName) {
					foundRequestedTab = true;
					methods._actuallyShowTab(tab);
				} else {
					methods._actuallyHideTab(tab);
				}
			});
			
			if(!foundRequestedTab && fallbackToFirst) {
				methods._actuallyShowTab(firstTab);
			}
		},
		
		_actuallyShowTab: function(tab) {
			tab = $(tab);
			tab.show();
			var t = tab.data("tab-triggers");
			console.debug("Triggers:");
			console.debug(t);
			if(t != null && t.length > 0) {
				t.addClass("active");
			}
		},
		
		_actuallyHideTab: function(tab) {
			tab = $(tab);
			tab.hide();
			var t = tab.data("tab-triggers");
			if(t != null && t.length > 0) {
				t.removeClass("active");
			}
			console.log("actuallyHideTab");
		}
	};
	
	$.fn.codetabs = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' + method + ' does not exist.');
		}   
	}
})(jQuery);
