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
      @boxes.fadeIn(300)
      @container.masonry
         itemSelector: @box
         isFitWidth: true
         isAnimated: !Modernizr.csstransitions
  
  refresh: =>
    @container.masonry(
      itemSelector: @box
      isFitWidth: true
      ).imagesLoaded =>
        @container.masonry 'reload'




