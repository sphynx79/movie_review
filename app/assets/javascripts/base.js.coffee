window.App ||= {}
class App.Base

 constructor: ->
  if (window.jQuery) then @setClearEventHandlers() # clearing application event handlers only possible with jQuery
  #@setLinkEventHandlers()
  #@setFormEventHandlers()
  new Element.Toast
  return this


 ###
 Run the new action for the create action.  Generally the create action will 'render :new' if there was a problem.
 This prevents doubling the code for each action.
 ###
 create: ->
    if typeof $this.new == 'function'
       return $this.new()
  ###
  Run the edit action for the update action.  Generally the update action will 'render :edit' if there was a problem.
  This prevents doubling the code for each action.
  ###
  update: ->
    if typeof $this.edit == 'function'
       return $this.edit()

  ###
  Clear event handlers with a blank namespace.  This will prevent window and document event handlers from stacking
  when each new page is fetched.  Adding a namespace to your events will prevent them from being removed between page
  loads, i.e. "$(window).on 'scroll.app', myHandler"
  ###
  setClearEventHandlers: ->
    jQuery(document).on 'page:before-change', ->
      for element in [window, document]
         for event, handlers of (jQuery._data(element, 'events') || {})
            for handler in handlers
               if handler? && handler.namespace == ''
                  jQuery(element).off event, handler.handler

   setLinkEventHandlers: ->
      # remote links handler
      $('a[data-remote=true]').bind 'ajax:complete', (event, xhr, status) ->
         controller = $(this).data().controller
         action     = $(this).data().action
         app = eval "new App.#{controller}()"
         app.setResponse xhr
         eval "app.#{action}()"
         return this

   setFormEventHandlers: ->
      # remote forms handler
      $(document).bind('ajax:success', "form[data-remote=true]", (event, data, status, xhr) ->
        debugger
        console.log 'success'
        # note: jqxhr.responseJSON undefined, parsing responseText instead
      ).bind('ajax:error', '#new_movie',(event, xhr, status, error) ->
        event.preventDefault()
        console.log error
      )
      return this




