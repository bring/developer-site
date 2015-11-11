(function() {

  var Scrollspy = function(element) {
    this.element = element;
    this.target = element.dataset.scrollspy;
    var targetElement = document.querySelector(this.target);
    this.triggerAtPosition = targetElement ? targetElement.offsetTop - 20: NaN;
  }

  Scrollspy.prototype.activate = function() {
    var currentlyActive = this.element.parentNode.querySelector('.active');
    if (currentlyActive) {
      currentlyActive.classList.remove('active');
    }
    this.element.classList.add('active')
  }

  var scrollspy = {
    init: function() {
      var spyElements = Array.prototype.slice.call(document.querySelectorAll('[data-scrollspy]'));
      var spies = spyElements.map(function (element) {
        return new Scrollspy(element);
      });

      window.addEventListener('scroll', function() {
        var scrollPosition = window.pageYOffset;
        spies.forEach(function(spy) {
          if (spy.triggerAtPosition <= scrollPosition) {
            spy.activate();
          }
        });
      });
    }
  }

  window.scrollspy = scrollspy;

})();
