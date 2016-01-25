(function() {

  var Sticky = function(element) {
    this.element = element;
    this.offsetTop = element.offsetTop;
    this.offsetBottom = document.querySelector('body > footer').offsetHeight;
    this.stuck = false;

    window.addEventListener('scroll', this.stickMeMaybe.bind(this));

    this.stickMeMaybe();
  }

  Sticky.prototype.stickMeMaybe = function() {
    var scrollPosition        = window.pageYOffset;
    var distance              = this.offsetTop - scrollPosition;

    var documentHeight        = Math.max(
      document.body.scrollHeight, document.documentElement.scrollHeight,
      document.body.offsetHeight, document.documentElement.offsetHeight,
      document.documentElement.clientHeight
    );
    var viewportHeight        = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
    var maxScrollPosition     = documentHeight - viewportHeight;
    var stickAtBottomPosition = maxScrollPosition - this.offsetBottom + (viewportHeight - this.element.offsetHeight);

    if (scrollPosition >= stickAtBottomPosition) {
      if (this.stuck != 'bottom') {
        this.stick('bottom');
      }
      this.element.style.bottom = (this.offsetBottom - (maxScrollPosition - scrollPosition)) + 'px';
    } else if (this.stuck != 'top' && distance <= 0) {
      this.stick('top');
      this.element.style.bottom = null;
    } else if (this.stuck && scrollPosition <= this.offsetTop) {
      this.unstick();
    }
  }

  Sticky.prototype.stick = function(topOrBottom) {
    this.element.classList.remove('sticky--top');
    this.element.classList.remove('sticky--bottom');
    this.element.classList.add('sticky--' + topOrBottom);
    this.stuck = topOrBottom;
  }

  Sticky.prototype.unstick = function() {
    this.element.classList.remove('sticky--top');
    this.element.classList.remove('sticky--bottom');
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
