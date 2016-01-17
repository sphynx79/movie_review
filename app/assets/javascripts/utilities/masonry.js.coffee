window.Utility ||= {}
class Utility.Masonry

  constructor: ($boxes, $container) ->
   $boxes.hide()
   $container.imagesLoaded ->
      $boxes.fadeIn()
      $container.masonry
         itemSelector: '.box'
         isFitWidth: true
         isAnimated: !Modernizr.csstransitions
   return this
