$(document).ready(function() {

  var $boxes = $('.box');
  $boxes.hide();

  var $container = $('#movies');
  $container.imagesLoaded( function() {
    $boxes.fadeIn();

    $container.masonry({
        itemSelector : '.box',
        isFitWidth: true,
        isAnimated: !Modernizr.csstransitions
    });    
  });
});



