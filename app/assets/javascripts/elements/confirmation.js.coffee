window.Element ||= {}
class Element.Confirmation

   constructor: ->
     $.rails.allowAction = (link) ->
       if !link.attr('data-confirm')
         return true
       $.rails.showConfirmDialog link
       false

     $.rails.confirmed = (link) ->
       link.removeAttr 'data-confirm'
       link.trigger 'click.rails'

     $.rails.showConfirmDialog = (link) ->
       message = link.attr('data-confirm')
       box = bootbox.confirm(message, (result) ->
         if result
           return $.rails.confirmed(link)
         return
       )
       box
     return this
