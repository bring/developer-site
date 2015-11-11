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
      console.log('Stick');
      this.stick();
    } else if (this.stuck && scrollPosition <= this.stickAtOffset) {
      console.log('Unstick');
      this.unstick();
    } else {
    }
  }

  Sticky.prototype.stick = function() {
    this.element.classList.add('apimenu--stick');
    this.stuck = true;
  }

  Sticky.prototype.unstick = function() {
    this.element.classList.remove('apimenu--stick');
    this.stuck = false;
  }

  var sticky = {
    init: function() {
      console.log('Initialize sticky elements');

      var stickyElements = Array.prototype.slice.call(document.querySelectorAll('[data-sticky="true"]'));
      stickyElements.forEach(function (element) {
        new Sticky(element);
      });
    }
  }

  window.sticky = sticky;
})();
