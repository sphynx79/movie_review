window.Utility ||= {}
class Utility.Masonry

  constructor: (boxes, container) ->
    @boxes     = $(boxes)
    @container = $(container)
    @box       = boxes

    @setOption()

  setOption: =>
   @boxes.hide()
   @container.imagesLoaded =>
      @boxes.fadeIn()
      @container.masonry
         itemSelector: @box
         isFitWidth: true
         isAnimated: !Modernizr.csstransitions
  
  refresh: =>
    console.log "refresh"
    @container.masonry(
      itemSelector: @box
      isFitWidth: true
      ).imagesLoaded =>
        @container.masonry 'reload'




