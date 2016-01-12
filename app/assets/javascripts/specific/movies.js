
$(function() {

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

// var MoviesController = Paloma.controller('Movies');
//
// MoviesController.prototype.index = function(){
//    $('#test').bind('ajax:complete', function(event, xhr, status, error) {
//      console.log(status);
//      $("#modal-window").html(xhr.responseText);
//      $("#modal-window").modal("show");
//
//    });
//   
// };
//
