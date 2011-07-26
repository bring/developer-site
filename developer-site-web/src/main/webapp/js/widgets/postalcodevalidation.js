(function($){

    var inputField = $('#postnummerInput');
    var outputElement = $('#postnummerResult');
    
	var methods = {
			
		init: function(){
			methods.bindEvent();
		}
			
		bindEvent: function(){			
			inputField.keyup(function() {
				if (inputField.val().length == 4) {
					$.getJSON('http://fraktguide.bring.no/fraktguide/api/postalCode.json?pnr='+ inputField.val() +'&callback=?',
							function(data){
						outputElement.text(data.result);
					});
				}
				else {
					outputElement.text('');
				}
			});
		}

	}
	
	$.fn.postalcodevalidation = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return methods.init.apply(this, arguments);
		} else {
			$.error('Method ' + method + ' does not exist.');
		}   
	}
})(jQuery);