window.Element ||= {}
class Element.Toast

  constructor: ->
    @setOption()

  setOption: =>
    $.toast.options =
      text: ''
      heading: ''
      showHideTransition: 'fade'
      allowToastClose: true
      hideAfter: 4000
      stack: 5
      position:
         right: 16
         top: 1
      bgColor: false
      textColor: false
      textAlign: 'left'
      icon: false
      beforeShow: ->
      afterShown: ->
      beforeHide: ->
      afterHidden: ->

