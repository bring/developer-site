(function($) {
    var navigationElement;
    
    var options = {
        mode: "breadcrumbs"
    };
    
    var methods = {
        init: function(optionsArg) {
            $.extend(options, optionsArg);
            navigationElement = this;
            if (options.mode == "breadcrumbs") {
                navigationElement.menutab().menuWithBreadcrumbs();
            }
            else if (options.mode == "hidden") {
                navigationElement.menu().menutab({hidden: true}).menutabHider();
            }
            else {
                navigationElement.menu().menutab();
            }
        }
    };
    
    $.fn.navigation = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + method + ' does not exist.');
        }   
    }
})( jQuery );