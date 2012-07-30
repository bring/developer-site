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

    var methods = {

        hideAllTabs: function() {
            $('div[data-tab]').hide();
        },

        findTriggersInsideElement: function(parentElement) {
            return parentElement.find('li>a[data-tab]');
        },

        removeActiveClassFromAllTriggers: function(){
        //Remove the active class from all triggers/buttons
            $('a[data-tab]').parents().removeClass("active");
        },

        bindTriggersToActions: function(triggers){
            for(var i = 0; i < triggers.length; i++){
                //Bind actions to triggers
                $(triggers[i]).bind('click', function(event){
                    event.preventDefault();
                    //select all tabs to be displayed (ie. tabs having a matching value for the data-tab attribute
                    var tabName = $(this).attr("data-tab");
                    //Add the tabName to the hash-part of the url
                    window.location.hash = tabName;
                    //Select all tabs where 'tabName' is a part of the data-tab value
                    var tabsToBeDisplayed = $("div[data-tab~="+tabName+"]");
                    methods.hideAllTabs();
                    methods.removeActiveClassFromAllTriggers();
                    //Add "active" class to the trigger/button
                    $("a[data-tab="+tabName+"]").parents().addClass("active");
                    //Display all the selected tabs
                    tabsToBeDisplayed.show();
                });
            }
        },

        selectTabFromHash: function(triggers){
            if(!window.location.hash){ return false;}
            //find the trigger matching the hash
            for(var i = 0; i < triggers.length; i++){
                currentTrigger = $(triggers[i]);
                if(currentTrigger.attr("data-tab") === window.location.hash.slice(1)){
                    currentTrigger.click();
                    return true;
                };
            };
            return false;
        }

    }

    $.fn.multitabs = function(method) {
        methods.hideAllTabs();
        var triggers = methods.findTriggersInsideElement(this);
        methods.bindTriggersToActions(triggers);
        var tabFound = false;
        //If there is a hash in the url, switch to that tab
        if(!methods.selectTabFromHash(triggers)){
            //If no valid hash is provided, select the first tab as a default
            $(triggers[0]).click();
        }
        return this;
    }
})(jQuery);
