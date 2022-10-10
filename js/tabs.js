(function() {
  'use strict';

  var findClosestOfType = function(element, elementType) {
    var parent = element.parentNode;
    if (parent.nodeName.toLowerCase() == elementType.toLowerCase()) {
      return parent;
    } else {
      return findClosestOfType(parent, elementType);
    }
  }

  var Tab = function(a) {
    this.a = a;
    this.li = findClosestOfType(a, 'li');
    this.ul = findClosestOfType(this.li, 'ul');

    var targetSelector = a.dataset.target;
    if (!targetSelector) {
      targetSelector = a.href.replace(/.*(?=#[^\s]*$)/, '');
    }

    this.target = document.querySelector(targetSelector);
  }

  Tab.prototype.show = function() {
    if (this.li.classList.contains('active')) {
      return;
    }

    this.activate(this.li, this.ul);
    this.activate(this.target, this.target.parentNode);
  }

  Tab.prototype.activate = function(element, container) {
    var currentlyActive = container.querySelector('.active');
    if (currentlyActive) {
      currentlyActive.classList.remove('active');

      var currentlyActiveTab = currentlyActive.querySelector('[data-toggle="tab"]');
      if (currentlyActiveTab) {
        currentlyActiveTab.setAttribute('aria-expanded', 'false');
      }
    }

    element.classList.add('active')
    var tabElement = element.querySelector('[data-toggle="tab"]');
    if (tabElement) {
      tabElement.setAttribute('aria-expanded', 'true');
    }
  }

  var tabs = {
    init: function() {
      var tabElements = Array.prototype.slice.call(document.querySelectorAll('[data-toggle="tab"]'));
      tabElements.forEach(function(tabElement) {
        tabElement.addEventListener('click', function(e) {
          e.preventDefault();
          new Tab(this).show();
        })
      })
    }

  };

  window.tabs = tabs;
})();
