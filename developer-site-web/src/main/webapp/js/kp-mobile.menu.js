(function ($) {

    // Disable input-elementer for å unngå "klikk igjennom" på windows phone.
    if (!window["absPosElementToggle"]) {
        window.absPosElementToggle = function() {
            $("input, button, select").toggleClass("disabled").removeAttr("disabled");
            $("input[type='text'].disabled, button.disabled, select.disabled").attr("disabled", "disabled");
        }
    }

    $(function () {
        var toggleMenu = function () {
            $("#page-mobile").toggleClass("disable");
            $(this).toggleClass("open").parent().toggleClass("open");
            $("#main-menu ul.menu").toggleClass("open");
            absPosElementToggle();
        };

        //Klikk for å åpne menyen
        $("nav[role='main'] a.menu").click(function (e) {
            e.preventDefault();
            e.stopPropagation();
            toggleMenu.apply(this);
        });

        /* Hack for iphone delegated click events: http://www.quirksmode.org/blog/archives/2010/09/click_event_del.html */
        var mainMenu = document.getElementById("main-menu");
        mainMenu && (mainMenu.onclick = function() {});

        $(document).on("click", "#main-menu.open", function (e) {
            e.stopPropagation();
            toggleMenu.apply($("#main-menu a").get(0));
        });

        $("nav[role='main'] ul.menu a").click(function (e) {
            e.stopPropagation();
        })
    });

})(jQuery);