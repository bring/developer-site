//When adding the data-tab attribute to a
//table this script will fetch the
//contents of the url and print it inside the table
//(with headers)
(function ($) {
    $.fn.tableFromJSON = function () {
        //Get the url from the data-tab attribute declared in <table>
        var url = this.attr("data-tab");
        var table = this;
        
        var childNames = ['errorTypes', 'products'];
        var childName = null;

        //Fetch the json to display
        $.getJSON(url, function (errorCodes) {
            //Find actual child name present in object
            $.each(childNames, function(index, value) {
                if(errorCodes.hasOwnProperty(value)) {
                    childName = value;
                }
            });
            
            //Create headers from the json keys
            var headers = [];
            $.each(errorCodes[childName][0], function(key, val){
                headers.push(key);
            });

            //Create markup from the headers-array
            var tableHeaders = "<thead>";
            for(var i = 0; i < headers.length; i++){
                tableHeaders += '<th>'+headers[i]+'</th>';
            }
            tableHeaders += "</thead>";

            //Create markup for contents of table
            var tableContent = "";
            $.each(errorCodes[childName], function (key, val) {
                tableContent += '<tr>\n';
                for(var i = 0; i < headers.length; i++){
                    tableContent += '<td>' + val[headers[i]] + '</td>\n';
                }
                tableContent += '</tr>\n\n';
            });

            //Print to table
            table.append(tableHeaders);
            table.append(tableContent);

            //pretty print it
            table.colorizeTable();
        });
    }
})(jQuery);