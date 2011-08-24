function TopMenu(pView, pContextPath, jsonData) {
    var view = pView;
    var contextPath = pContextPath;
    var menuData = null;
    var launcherIdMap = [];
    var menuNodeIdMap = [];
    var activeLauncher = null;
    var activeMenuNodes = [];
    var mouseOverNavigation = false;

    // Event handlers

    function bodyClickEventHandler() {
        if (!mouseOverNavigation) {
            if (activeLauncher !== null) {
                activeLauncher.deActivate();
            }

            setLaunchersToInitialState();
        }
    }

    function setLaunchersToInitialState() {
        for (var i=0; i<menuData.launchers.length; i++) {
            menuData.launchers[i].setToInitialState();
        }
    }

    function navigationMouseEnterEventHandler() {
        mouseOverNavigation = true;
    }

    function navigationMouseLeaveEventHandler() {
        mouseOverNavigation = false;
    }

    // Util

    function createDropDownMenuHtml() {
        var html = "";

        for (var i=0; i<menuData.launchers.length; i++) {
            var currentLauncher = menuData.launchers[i];

            html += '<div class="' + currentLauncher.id + ' breadcrumbs">';
            html += '</div>';
            html += '<div class="' + currentLauncher.id + ' menubox">';
            html += '<ul class="level_1">';

            for (var j=0; j<currentLauncher.subNodes.length; j++) {
                var firstLevelNode = currentLauncher.subNodes[j];
                html += '<li id="' + firstLevelNode.htmlId + '">';
                html += createMenuNodeHtml(firstLevelNode);

                if (firstLevelNode.subNodes.length > 0) {
                    html += '<ul class="level_2">';

                    for (var k=0; k<firstLevelNode.subNodes.length; k++) {
                        var secondLevelNode = firstLevelNode.subNodes[k];
                        html += '<li id="' + secondLevelNode.htmlId + '">';
                        html += createMenuNodeHtml(secondLevelNode);

                        if (secondLevelNode.subNodes.length > 0) {
                            html += '<ul class="level_3">';

                            for (var l=0; l<secondLevelNode.subNodes.length; l++) {
                                var thirdLevelNode = secondLevelNode.subNodes[l];
                                html += '<li id="' + thirdLevelNode.htmlId + '">';
                                html += createMenuNodeHtml(thirdLevelNode);
                                html += '</li>';
                            }

                            html += '</ul>';
                        }

                        html += '</li>';
                    }

                    html += '</ul>';
                }

                html += '</li>';
            }

            html += '</ul>';
            html += '</div>';
        }

        return html;
    }

    function createMenuNodeHtml(menuNode) {
        return '<a href="' + menuNode.url + '" class="' + menuNode.htmlId + (menuNode.isOnPath ? ' path' : '') + (menuNode.isLeafNode() ? ' leaf' : ' parent') + '">' + menuNode.title +'</a>';
    }

    function initLaunchers() {
        for (var i=0; i<menuData.launchers.length; i++) {
            var currentLauncher = menuData.launchers[i];
            launcherIdMap[currentLauncher.getHtmlId()] = currentLauncher;
            currentLauncher.domNode = $('#' + currentLauncher.getHtmlId());
            currentLauncher.init();
            if(currentLauncher.isOnPath) {
                activeLauncher = currentLauncher;
            }
        }
    }

    function initMenuNodes() {
        for (currentId in menuNodeIdMap) {
            var currentMenuNode = menuNodeIdMap[currentId];
            currentMenuNode.linkDomNode = $('a.' + currentId);
            currentMenuNode.init();
        }
    }

    function initEvents() {
        $("body").click(function() {
            bodyClickEventHandler();
        });
        $("#navigation").mouseenter(function() {
            navigationMouseEnterEventHandler();
        });
        $("#navigation").mouseleave(function() {
            navigationMouseLeaveEventHandler();
        });
    }

    function init() {
        menuData = parseMenu(jsonData.launchers);

        view.html(createDropDownMenuHtml());

        initLaunchers();
        initMenuNodes();
        initEvents();
    }

    init();

    // Parser

    function parseBreadCrumbs() {
        var breadCrumbNodes = [];

        for (currentId in menuNodeIdMap) {
            var currentNode = menuNodeIdMap[currentId];
            if (currentNode.url != "#" && window.location.href.indexOf(currentNode.url) > 0) {
                var currentHtmlId = currentNode.htmlId;
                if(currentNode.menuLevel == 3) {
                    breadCrumbNodes[2] = currentNode;
                    breadCrumbNodes[1] = menuNodeIdMap[currentHtmlId.substring(0, currentHtmlId.length - 2)];
                    breadCrumbNodes[0] = menuNodeIdMap[currentHtmlId.substring(0, currentHtmlId.length - 4)];
                }
                else if(currentNode.menuLevel == 2) {
                    breadCrumbNodes[2] = null;
                    breadCrumbNodes[1] = currentNode;
                    breadCrumbNodes[0] = menuNodeIdMap[currentHtmlId.substring(0, currentHtmlId.length - 2)];
                }
            }
        }

        return breadCrumbNodes;
    }

    function parseMenu(pJsonLaunchers) {

        function parseLaunchers(jsonLaunchers) {
            var resultingLaunchers = [];

            for (var i=0; i<jsonLaunchers.length; i++) {
                var currentJsonLauncher = jsonLaunchers[i];
                var subNodes = [];
                if(currentJsonLauncher.menuNodes && currentJsonLauncher.menuNodes.length > 0) {
                    subNodes = parseFirstLevel(currentJsonLauncher.menuNodes, currentJsonLauncher.id);
                }
                var menuLauncher = new MenuLauncher(currentJsonLauncher.id, subNodes, (window.location.href.indexOf("/" + currentJsonLauncher.id  + "/") > 0));
                if(menuLauncher.isOnPath) {
                    var breadCrumbNodes = parseBreadCrumbs();
                    populateIsOnPath(breadCrumbNodes);

                    if(currentJsonLauncher.breadCrumbs) {
                        menuLauncher.hasBreadCrumbs = true;
                        menuLauncher.breadCrumbs = breadCrumbNodes;
                    }
                }

                resultingLaunchers.push(menuLauncher);
            }

            return resultingLaunchers;
        }

        function populateIsOnPath(breadCrumbNodes) {
            for(var i=0; i<breadCrumbNodes.length; i++) {
                var currentBreadCrumbNode = breadCrumbNodes[i];
                if(currentBreadCrumbNode != null) {
                    currentBreadCrumbNode.isOnPath = true;
                }
            }
        }

        function parseFirstLevel(jsonMenuNodes, launcherId) {
            var resultingNodes = [];

            for (var i=0; i<jsonMenuNodes.length; i++) {
                var currentJsonNode = jsonMenuNodes[i];
                var subNodes = [];
                var htmlId = launcherId + "_" + i;
                if(currentJsonNode.menuNodes && currentJsonNode.menuNodes.length > 0) {
                    subNodes = parseSecondLevel(currentJsonNode.menuNodes, htmlId);
                }
                resultingNodes.push(createMenuNode(currentJsonNode, subNodes, htmlId, 1));
            }

            return resultingNodes;
        }

        function parseSecondLevel(jsonMenuNodes, htmlIdPrefix) {
            var resultingNodes = [];

            for (var i=0; i<jsonMenuNodes.length; i++) {
                var currentJsonNode = jsonMenuNodes[i];
                var subNodes = [];
                var htmlId = htmlIdPrefix + "_" + i;
                if(currentJsonNode.menuNodes && currentJsonNode.menuNodes.length > 0) {
                    subNodes = parseThirdLevel(currentJsonNode.menuNodes, htmlId);
                }
                resultingNodes.push(createMenuNode(currentJsonNode, subNodes, htmlId, 2));
            }

            return resultingNodes;
        }

        function parseThirdLevel(jsonMenuNodes, htmlIdPrefix) {
            var resultingNodes = [];

            for (var i=0; i<jsonMenuNodes.length; i++) {
                resultingNodes.push(createMenuNode(jsonMenuNodes[i], [], htmlIdPrefix + "_" + i, 3));
            }

            return resultingNodes;
        }

        function createMenuNode(jsonNode, subNodes, htmlId, menuLevel) {
            var url = "#";
            if (jsonNode.url) {
                url = jsonNode.url;
            }
            var menuNode = new MenuNode(jsonNode.title, url, subNodes, htmlId, menuLevel);
            menuNodeIdMap[menuNode.htmlId] = menuNode;

            return menuNode
        }

        return new Menu(parseLaunchers(pJsonLaunchers));
    }

    // Domain objects

    function Menu(launchers) {
        this.launchers = launchers;
    }

    function MenuLauncher(id, subNodes, isOnPath) {
        this.id = id;
        this.subNodes = subNodes;
        this.isOnPath = isOnPath;
        this.hasBreadCrumbs = false;
        this.breadCrumbs = [];
        this.states = { hidden : "hidden", breadCrumbs : "breadCrumbs", menu : "menu" };
        this.currentState = this.states.hidden;
        this.domNode = null;

        var that = this;
        var active = false;
        var breadCrumbsView = null;
        var menuView = null;

        this.getHtmlId = function() {
            return that.id + "-launcher";
        };

        this.activate = function() {
            if(!active) {
                deActivateOtherLaunchers();

                if (that.isOnPath) {
                    setBreadCrumbsState();
                }
                else {
                    setMenuState();
                }
            }
            else {
                switchState();
            }
        };

        this.deActivate = function() {
            if(activeMenuNodes[1]) {
                activeMenuNodes[1].deActivate();
            }

            setInActiveState();
        };

        this.setToInitialState = function() {
            if(that.isOnPath) {
                setBreadCrumbsState();
            }
            else {
                setInitialState();
            }
        };

        function deActivateOtherLaunchers() {
            for (var i=0; i<menuData.launchers.length; i++) {
                var currentLauncher = menuData.launchers[i];
                if (currentLauncher !== that) {
                    currentLauncher.deActivate();
                }
            }
        }

        function switchState() {
            if (that.currentState == that.states.menu) {
                setBreadCrumbsState();
            }
            else {
                setMenuState();
            }
        }

        function setInitialState() {
            active = false;
            menuView.hide();
            breadCrumbsView.hide();
            that.domNode.addClass("init");
            that.domNode.removeClass("active");
            that.domNode.removeClass("inactive");
        }

        function setInActiveState() {
            active = false;
            menuView.hide();
            breadCrumbsView.hide();
            that.domNode.removeClass("init");
            that.domNode.removeClass("active");
            that.domNode.addClass("inactive");
        }

        function setMenuState() {
            activeLauncher = that;
            active = true;
            that.currentState = that.states.menu;
            menuView.show();
            breadCrumbsView.hide();
            that.domNode.removeClass("init");
            that.domNode.addClass("active");
            that.domNode.removeClass("inactive");
        }

        function setBreadCrumbsState() {
            activeLauncher = that;
            active = true;
            that.currentState = that.states.breadCrumbs;
            menuView.hide();
            breadCrumbsView.show();
            that.domNode.removeClass("init");
            that.domNode.addClass("active");
            that.domNode.removeClass("inactive");
        }

        function createBreadCrumbsHtml() {
            var html = "";

            html += '<ul>';
            html += '<li>';
            html += createMenuNodeHtml(that.breadCrumbs[0]);
            html += '<ul>';
            html += '<li>';
            html += createMenuNodeHtml(that.breadCrumbs[1]);
            if(that.breadCrumbs[2] !== null) {
                html += '<ul>';
                html += '<li>';
                html += createMenuNodeHtml(that.breadCrumbs[2]);
                html += '</li>';
                html += '</ul>';
            }
            html += '</li>';
            html += '</ul>';
            html += '</li>';
            html += '</ul>';

            return html;
        }

        function initEvents() {
            that.domNode.click(function(evt) {
                that.activate();
            });
        }

        this.init = function() {
            breadCrumbsView = $("." + that.id + ".breadcrumbs");
            menuView = $("." + that.id + ".menubox");

            if (that.isOnPath) {
                if(that.hasBreadCrumbs) {
                    breadCrumbsView.html(createBreadCrumbsHtml());
                    breadCrumbsView.click(function(evt) {
                        that.activate();
                    });
                }
                setBreadCrumbsState();
                active = true;
            }
            else {
               setInitialState();
            }

            initEvents();
        };
    }

    function MenuNode(title, url, subNodes, htmlId, menuLevel) {
        this.title = title;
        this.url = url;
        this.subNodes = subNodes;
        this.htmlId = htmlId;
        this.menuLevel = menuLevel;
        this.isOnPath = false;
        this.linkDomNode = null;

        var that = this;
        var active = false;

        this.activate = function() {
            if(!active) {
                deActivateActiveSiblings();
                activeMenuNodes[that.menuLevel] = that;
                if(that.menuLevel < 3) {
                    var nextLevel = that.menuLevel + 1;
                    $("#" + that.htmlId + " ul.level_" + nextLevel).show();
                }
                that.linkDomNode.addClass("active");
                active = true;
            }
        };

        this.deActivate = function() {
            activeMenuNodes[that.menuLevel] = null;

            if(that.menuLevel < 3) {
                var nextLevel = that.menuLevel + 1;
                deActivateChildren(nextLevel);
                $("#" + that.htmlId + " ul.level_" + nextLevel).hide();
            }

            that.linkDomNode.removeClass("active");
            active = false;
        };

        this.isLeafNode = function() {
            return that.subNodes.length == 0;
        };

        function deActivateActiveSiblings() {
            if (activeMenuNodes[that.menuLevel]) {
                activeMenuNodes[that.menuLevel].deActivate();
            }
        }
        function deActivateChildren(nextLevel) {
            var nextLevelActiveNode = activeMenuNodes[nextLevel];
            if (nextLevelActiveNode) {
                nextLevelActiveNode.deActivate();
            }
        }

        function initEvents() {
            var timer = null;
            that.linkDomNode.mouseenter(function(evt) {
                var f = function() { that.activate(); };
                timer = setTimeout(f, 100);
            });
            that.linkDomNode.mouseleave(function(evt) {
                if(timer !== null) {
                    clearTimeout(timer);
                }
            });
            if(that.url == "#") {
                that.linkDomNode.click(function(evt) {
                    evt.preventDefault();
                });
            }
        }

        this.init = function() {
            initEvents();
        };
    }
}


