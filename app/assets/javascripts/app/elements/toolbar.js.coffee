window.Element ||= {}
class Element.Toolbar

  constructor: (element,option) ->
     @element = $(element)
     @option  = option
     @setOption()
     return this

   setOption: =>
      @element.toolbar
         content: @option
         position: 'bottom'
         event: 'click'
         hideOnClick: true


