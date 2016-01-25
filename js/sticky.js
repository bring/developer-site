(function() {

  var Sticky = function(element) {
    this.element = element;
    this.stickAtOffset = element.offsetTop;
    this.stuck = false;

    window.addEventListener('scroll', this.stickMeMaybe.bind(this));

    this.stickMeMaybe();
  }

  Sticky.prototype.stickMeMaybe = function() {
    var scrollPosition = window.pageYOffset;
    var distance = this.element.offsetTop - scrollPosition;

    if (!this.stuck && distance <= 0) {
      this.stick();
    } else if (this.stuck && scrollPosition <= this.stickAtOffset) {
      this.unstick();
    }
  }

  Sticky.prototype.stick = function() {
    this.element.classList.add('sticky');
    this.stuck = true;
  }

  Sticky.prototype.unstick = function() {
    this.element.classList.remove('sticky');
    this.stuck = false;
  }

  var sticky = {
    init: function() {
      var stickyElements = Array.prototype.slice.call(document.querySelectorAll('[data-sticky="true"]'));
      stickyElements.forEach(function (element) {
        new Sticky(element);
      });
    }
  }

  window.sticky = sticky;
})();
