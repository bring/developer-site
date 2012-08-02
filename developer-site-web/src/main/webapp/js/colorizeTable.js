//Add "even" class to every other table row
(function ($) {
    $.fn.colorizeTable = function () {
        var tables = this;
        for (var i = 0; i < tables.length; i++) {
            var table = $(tables[i]);
            //console.log(table);
            var rows = table.find('tbody>tr');
            for (var j = 0; j < rows.length; j++) {
                //if even number
                if(j % 2 === 0){
                    //the css class "even" should really be called
                    //"odd" because we add it to the odd number of rows
                    $(rows[j]).removeClass("even");
                }
                //if odd number
                else{
                    //Even if someone added even-classes manually in the
                    // markup, this removes it
                    $(rows[j]).addClass("even");
                }
            }
        }
    }
})(jQuery);