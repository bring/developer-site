(function() {

  var CLS_TOGGLER_COLLAPSED = 'dev-collapsible__toggler--collapsed';
  var CLS_TOGGLER_EXPANDED = 'dev-collapsible__toggler--expanded';
  var CLS_TARGET_COLLAPSED = 'dev-collapsible__item--collapsed';
  var CLS_TARGET_EXPANDED = 'dev-collapsible__item--expanded';

  var Collapsible = function(element) {
    this.toggler = element;
    this.target = document.querySelector(element.dataset.collapse);
  };

  Collapsible.prototype.toggle = function() {
    var collapsed = this.toggler.classList.contains(CLS_TOGGLER_COLLAPSED) 
                    || this.target.classList.contains(CLS_TARGET_COLLAPSED);

    collapsed ? this.expand() : this.collapse();
  };

  Collapsible.prototype.collapse = function() {
    this.toggler.classList.remove(CLS_TOGGLER_EXPANDED);
    if (!this.toggler.classList.contains(CLS_TOGGLER_COLLAPSED)) {
      this.toggler.classList.add(CLS_TOGGLER_COLLAPSED);
    }
    
    this.target.classList.remove(CLS_TARGET_EXPANDED);
    if (!this.target.classList.contains(CLS_TARGET_COLLAPSED)) {
      this.target.classList.add(CLS_TARGET_COLLAPSED);
    }
  };

  Collapsible.prototype.expand = function() {
    this.toggler.classList.remove(CLS_TOGGLER_COLLAPSED);
    if (!this.toggler.classList.contains(CLS_TOGGLER_EXPANDED)) {
      this.toggler.classList.add(CLS_TOGGLER_EXPANDED);
    }
    
    this.target.classList.remove(CLS_TARGET_COLLAPSED);
    if (!this.target.classList.contains(CLS_TARGET_EXPANDED)) {
      this.target.classList.add(CLS_TARGET_EXPANDED);
    }
  };

  var collapsible = {
    init: function() {
      var togglers = Array.prototype.slice.call(document.querySelectorAll('[data-collapse]'));
      togglers.forEach(function (element) {
        element.addEventListener('click', function(e) {
          e.preventDefault();
          new Collapsible(this).toggle();
        })
      });
    }
  }

  window.collapsible = collapsible;
})();
