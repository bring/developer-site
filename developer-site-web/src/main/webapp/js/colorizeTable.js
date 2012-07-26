//Add "even" class to every other table row
(function ($) {
    $.fn.colorizeTable = function () {
        var tables = this;
        for (var i = 0; i < tables.length; i++) {
            var table = $(tables[i]);
            console.log(table);
            var rows = table.find('tbody>tr');
            for (var j = 1; j < rows.length; j += 2) {
                $(rows[j]).addClass("even");
            }
        }
    }
})(jQuery);