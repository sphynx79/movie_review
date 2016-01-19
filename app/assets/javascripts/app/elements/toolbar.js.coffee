window.Element ||= {}
class Element.Toolbar

  constructor: ($element,$option) ->
     @element = $element
     @option  = $option
     @setting()
     return this

   setting: =>
      @element.toolbar
         content: @option
         position: 'bottom'
         event: 'click'
         hideOnClick: true


