


MovieReview.Masonry =

  init: ->
    $box       = $('.box')
    $container = $('#movies')

    MovieReview.Masonry.renderMasonry($box,$container)

  renderMasonry:($box,$container) ->

     console.log "."+$box.attr('class')
     $box.hide()
     $container.imagesLoaded ->
      $box.fadeIn()
      $container.masonry
         itemSelector: "."+$box.attr('class')
         isFitWidth: true
         isAnimated: !Modernizr.csstransitions
