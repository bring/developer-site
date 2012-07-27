/*
    This (qick and dirty) script lets you define DIVs to be displayed or hidden when their triggers/buttons are actived.
    You define a listener like this: <div data-tab="event_to_listen_for another_event_to_listen_for">
    ... and a trigger like this:     <a data-tab="event_to_listen_for">XML</a>     (this is not entirely true, as you
                                                                                    also need to enclose this <a> in an
                                                                                    <li> inside a <ul>, but you get the idea)

    Example usage:
    The markup must contain the following:

in something.html:
    <div class="codetabs">
        <ul class="tab-group">
            //The first list item becomes the default tab
            <li><a href="#xml" data-tab="xml">XML</a></li>
            <li><a href="#json" data-tab="json">JSON</a></li>
            <li><a href="#soap" data-tab="soap">SOAP</a></li>
        </ul>

        <div data-tab="xml">
            This content will only be visible when xml is selected in the menu
        </div>

        <p>
            This will always be visible
        </p>

        <div data-tab="xml json">
            This will be visible when either of xml or json is selected.
        </div>
    </div>

    <div data-tab="xml">
        Even this div, outside of the div.codetabs can be displayed/hidden by the triggers. (I'm not sure if this is a
        good idea?)
    </div>

in something.js:
    //To run the script, call multitabs() like so:
    $("div.multitabs").multitabs();

 */
(function($) {
    $.fn.multitabs = function(method) {
        //Hide all tabs
        $('div[data-tab]').hide();
        //Register triggers
        var triggers = this.find('li>a[data-tab]');
        for(var i = 0; i < triggers.length; i++){
            //Bind actions to triggers
            $(triggers[i]).bind('click', function(){
                event.preventDefault();
                //select all tabs to be displayed (ie. tabs having a matching value for the data-tab attribute
                var tabName = $(this).attr("data-tab");
                //Select all tabs where 'tabName' is a part of the data-tab value
                var tabsToBeDisplayed = $("div[data-tab~="+tabName+"]");
                //Hide all tabs
                $('div[data-tab]').hide();
                //Remove the active class from all triggers/buttons
                $('a[data-tab]').parents().removeClass("active");
                //Add "active" class to the trigger/button
                $("a[data-tab="+tabName+"]").parents().addClass("active");
                //Display all the selected tabs
                tabsToBeDisplayed.show();
            });
        }
        //Set the first trigger to be the default
        $(triggers[0]).click();
    }
})(jQuery);
