(function($) {
	/**
	 * tabElement must have one and only one child element.
	 */
	
		var navElement = $("#navigation");
		var tabElement = $("#download");
		tabElement.data("default-height", $(tabElement.children()[0]).height());
		tabElement.data("default-padding-bottom", 10);
		var hidden = false;
		var preventNextShow = false;
		
		var options = {
			chosenTab: 1
		};
		
		var methods = {
			init: function() {
				methods.hide(0);
				methods.bindEvent();
			},
				
			hide: function(duration) {
				if (duration == undefined) {
					duration = 400;
				}
				
				$(tabElement.children()[0]).css({
					overflow: "hidden"
				});
				
				$(tabElement.children()[0]).animate({
					height: 0,
				}, duration);
				
				tabElement.animate({"padding-bottom": 0}, duration);
				
				hidden = true;
			},
			
			show: function() {
				console.log("show");
				$(tabElement.children()[0]).css({
					overflow: "visible"
				});
				
				$(tabElement.children()[0]).animate({
					height: tabElement.data("default-height")								
				}, 400);
				
				tabElement.animate({
					"padding-bottom": tabElement.data("default-padding-bottom")
				});
				hidden = false;
			},
	
			bindEvent: function(){
				navElement.bind({
					launch: function(event, chosenTab, currentTab) {
						if (navElement.menutab("isBusy")) {
							return;
						}
						
						if(chosenTab == options.chosenTab) {
							if (hidden) {
						    	methods.show();
							}
							else if (chosenTab == currentTab){
								methods.hide();
							}
						}
					},
					
					outerClick: function(event){
					
						if(!hidden){
							methods.hide();
						}
	                    if (navElement.menutab("getActive") && navElement.menutab("getActive").index != options.chosenTab) {
	                    	preventNextShow = true;
	                        navElement.menutab("changeTab", options.chosenTab, function() {
	                        	preventNextShow = false;
	                        	methods.hide();
	                        	});
	                    }
					},
					
					changeTab: function(event, chosenTab, currentTab) {
						tabElement.css("padding-bottom", 10);
						if (navElement.menutab("isBusy")) {
							return;
						}
						if (chosenTab == options.chosenTab && hidden && !preventNextShow) {
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
