function TopMenu(pView, jsonData) {
    var view = pView;
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
                html += createMenuNodeHtml(firstLevelNode, firstLevelNode.htmlId);

                if (firstLevelNode.subNodes.length > 0) {
                    html += '<ul class="level_2">';

                    for (var k=0; k<firstLevelNode.subNodes.length; k++) {
                        var secondLevelNode = firstLevelNode.subNodes[k];
                        html += '<li id="' + secondLevelNode.htmlId + '">';
                        html += createMenuNodeHtml(secondLevelNode, secondLevelNode.htmlId);

                        if (secondLevelNode.subNodes.length > 0) {
                            html += '<ul class="level_3">';

                            for (var l=0; l<secondLevelNode.subNodes.length; l++) {
                                var thirdLevelNode = secondLevelNode.subNodes[l];
                                html += '<li id="' + thirdLevelNode.htmlId + '">';
                                html += createMenuNodeHtml(thirdLevelNode, thirdLevelNode.htmlId);
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

    function createMenuNodeHtml(menuNode, htmlId) {
        var target = "";
        if (menuNode.url.indexOf("http") > -1) {
            target = ' target="_blank" ';
        }
        return '<a href="' + menuNode.url + '" ' + target + 'class="' + htmlId
            + (menuNode.isOnPath ? ' path' : '') + (menuNode.isLeafNode() ? ' leaf' : ' parent') + '">'
            + menuNode.title +'</a>';
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
            if (currentNode.url != "#" && window.location.href.indexOf(currentNode.url) > 0 && currentNode.menuLevel > 1) {
                var currentHtmlId = currentNode.htmlId;
                var nodeLevel1 = null;
                var nodeLevel2 = null;
                var nodeLevel3 = null;

                if(currentNode.menuLevel == 3) {
                    nodeLevel1 = menuNodeIdMap[currentHtmlId.substring(0, currentHtmlId.length - 4)];
                    nodeLevel2 = menuNodeIdMap[currentHtmlId.substring(0, currentHtmlId.length - 2)];
                    nodeLevel3 = currentNode;
                }
                else if(currentNode.menuLevel == 2) {
                    nodeLevel1 = menuNodeIdMap[currentHtmlId.substring(0, currentHtmlId.length - 2)];
                    nodeLevel2 = currentNode;
                }

                breadCrumbNodes[0] = new BreadCrumbNode(nodeLevel1);
                breadCrumbNodes[1] = new BreadCrumbNode(nodeLevel2);
                if(nodeLevel3 !== null) {
                    breadCrumbNodes[2] = new BreadCrumbNode(nodeLevel3);
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
                breadCrumbNodes[i].menuNode.isOnPath = true;
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
                if(that.isOnPath) {
                    switchState();
                }
                else {
                    setLaunchersToInitialState();
                }
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
            html += createMenuNodeHtml(that.breadCrumbs[0].menuNode, that.breadCrumbs[0].htmlId);
            html += '<ul>';
            html += '<li>';
            html += createMenuNodeHtml(that.breadCrumbs[1].menuNode, that.breadCrumbs[1].htmlId);
            if(that.breadCrumbs.length > 2) {
                html += '<ul>';
                html += '<li>';
                html += createMenuNodeHtml(that.breadCrumbs[2].menuNode, that.breadCrumbs[2].htmlId);
                html += '</li>';
                html += '</ul>';
            }
            html += '</li>';
            html += '</ul>';
            html += '</li>';
            html += '</ul>';

            return html;
        }

        function initBreadCrumbsEvents() {
            for(var i=0; i<that.breadCrumbs.length; i++) {
                var currentBreadCrumbNode = that.breadCrumbs[i];
                currentBreadCrumbNode.linkDomNode = $('a.' + currentBreadCrumbNode.htmlId);
                currentBreadCrumbNode.linkDomNode.click(function(evt) {
                    evt.preventDefault();
                    activateMenuFromBreadCrumbs();
                });
            }
        }

        function activateMenuFromBreadCrumbs() {
            that.activate();
            for(var i=0; i<that.breadCrumbs.length; i++) {
                that.breadCrumbs[i].menuNode.activate();
            }
        }

        function initEvents() {
            that.domNode.click(function() {
                that.activate();
            });
        }

        this.init = function() {
            breadCrumbsView = $("." + that.id + ".breadcrumbs");
            menuView = $("." + that.id + ".menubox");

            if (that.isOnPath) {
                if(that.hasBreadCrumbs) {
                    breadCrumbsView.html(createBreadCrumbsHtml());
                    initBreadCrumbsEvents();
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
            that.linkDomNode.mouseenter(function() {
                if(that.subNodes.length > 0) {
                    var f = function() { that.activate(); };
                    timer = setTimeout(f, 100);
                }
                else {
                    that.activate();
                }
            });
            that.linkDomNode.mouseleave(function() {
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

    function BreadCrumbNode(menuNode) {
        this.menuNode = menuNode;
        this.htmlId = "bread-" + menuNode.htmlId;
        this.linkDomNode = null;
    }
}
