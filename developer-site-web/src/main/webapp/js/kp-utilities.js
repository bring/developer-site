/*
 * Utility-funksjoner av allmenn nytte :P
 */
var kp = kp || {};

(function ($) {
    kp.utilities = (function () {
        var vars = [];

        return {
            getUrlVars: function () {
                var hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for(var i = 0; i < hashes.length; i++)
                {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];
                }
                return vars;
            }
        };
    }());
    $.fn.setEqualHeight = function() {
        // Apply only to floated elements
        if (this.css("float") != "none") {
            console.log("heigth");
            var height = Math.max.apply(this, $.map( this , function(e) {
                    return $(e).height() }
                )
            );
            return this.css("min-height", height);
        } else {
            console.log("auto");
            return this.css("min-height", "");
        }
    };
}(jQuery));