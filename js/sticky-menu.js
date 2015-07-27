/**
 * Height of sticky menu
 */
window.setStickyHeight = function(){
  var currentTabHeight = $('.sticky-nav .nav-tabs').outerHeight(true);
  $('.nav-wrapper.sticky-nav').height(currentTabHeight);
}

$(window).on('load resize', function(){
    setStickyHeight();
});


/**
 * scrollTo functionality
 */
window.scrollToHeight = function(heightInPx) {
  $('html, body').animate({ scrollTop: heightInPx }, 600);
}

/**
 * Call this function with id of the element to scroll to.
 * You can use this both with the hash (selector) or without
 * scrollToExact('reklamasjoner') === scrollToExact('#reklamasjoner')
 */
window.scrollToExact = function(elementId) {
  var hashElementId = elementId.indexOf('#') === 0 ? elementId : '#' + elementId;
  var $elementToScrollTo = $(hashElementId);
  if($elementToScrollTo.length === 0) { return; }

  scrollToHeight($elementToScrollTo.offset().top);
}

window.scrollToWithSticky = function(elementId, offset) {
  var hashElementId = elementId.indexOf('#') === 0 ? elementId : '#' + elementId;
  var $elementToScrollTo = $(hashElementId);
  if($elementToScrollTo.length === 0) { return; }


  scrollToHeight($elementToScrollTo.offset().top - $('.sticky-nav').height() + (offset ? offset : 0));
}


/**
 * General sticky nav initialization
 */
$(window).on('load', function() {

  // for performance, dont try to initialize any more unless there is a sticky-nav on the page
  if($('.sticky-nav').length === 0) { return; } 

  $('body').scrollspy({ target: '.sticky-nav', offset: $('.sticky-nav .nav-tabs').outerHeight(true) });

  $('.sticky-nav').waypoint(function(direction) {
      if (direction === 'down') {
          $(this.element).children('.nav').addClass('affix');
      } else {
          $(this.element).children('.nav').removeClass('affix');
      }
  });

  $('.sticky-nav .nav').on('click', 'a', function(e){
      // temporary if while large-top-with-nav still has links to other pages
      if($(this).data('follow-url')) { return true; }
      
      e.preventDefault();
      window.scrollToWithSticky($(this).attr('href'));
  });
});


