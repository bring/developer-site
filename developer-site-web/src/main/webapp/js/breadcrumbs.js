(function($) {
    var options;
    var navigationElement;
    
    var methods = {
        init: function() {
            console.log(this);
            navigationElement = this;
            methods.bindMenutabEvents();
        },
        
        bindMenutabEvents: function() {
            navigationElement.bind("stateHiddenBefore", function(event, methods, data) {
                data.tabToHeight = 20;
            });
        },
    };
    
    $.fn.breadcrumbs = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist.');
        }   
    }
})(jQuery);