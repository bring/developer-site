(function($) {
	/**
	 * tabElement must have one and only one child element.
	 */
	
		var navElement = $("#navigation");
		var tabElement = $("#download");
		tabElement.data("default-height", $(tabElement.children()[0]).height());
		tabElement.data("default-padding-bottom", 10);
		
		var options = {
			chosenTab: 1
		};
		
		var methods = {
			init: function() {
				methods.bindEvent();
				methods.hide();
			},
				
			hide: function() {
				$(tabElement.children()[0]).css({
					overflow: "hidden"
				});
				
				$(tabElement.children()[0]).animate({
					height: 0,
				});
				
				tabElement.animate({"padding-bottom": 0});
				
				tabElement.menutab.hidden = true;
			},
			
			show: function() {
				$(tabElement.children()[0]).css({
					overflow: "visible"
				});
				
				$(tabElement.children()[0]).animate({
					height: tabElement.data("default-height")								
				}, 400);
				
				tabElement.animate({
					"padding-bottom": tabElement.data("default-padding-bottom")
				});
				tabElement.menutab.hidden = false;
			},
	
			bindEvent: function(){
				navElement.bind({
					launch: function(event, chosenTab, currentTab) {
						if (navElement.menutab("isBusy")) {
							return;
						}
						
						if(chosenTab == options.chosenTab) {
							if (tabElement.menutab.hidden) {
						    	methods.show();
							}
							else if (chosenTab == currentTab){
								methods.hide();
							}
						}
					},
					
					changeTab: function(event, chosenTab, currentTab) {
						tabElement.css("padding-bottom", 10);
						if (navElement.menutab("isBusy")) {
							return;
						}
						if (chosenTab == options.chosenTab && tabElement.menutab.hidden) {
							methods.show();
						}
					}
				});
			}
		};

	
	$.fn.downloadmenuHider = function(method) {
	    if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist');
        }   
    }
})(jQuery);
