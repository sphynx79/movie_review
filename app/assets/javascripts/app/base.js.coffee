window.App ||= {}
class App.Base

 constructor: ->
  if (window.jQuery) then @setClearEventHandlers() # clearing application event handlers only possible with jQuery

  @setUtilityConfirmation()
  @setElementToast()
  @setUtilityModal()
  @setFormEventHandlers()
  #@setLinkEventHandlers()
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
      $(document).bind('ajax:error', 'form#new_movie', (event, xhr, status, error) ->
        console.log 'error'
        # note: jqxhr.responseJSON undefined, parsing responseText instead

        $(event.data).render_form_errors $.parseJSON(xhr.responseText)
        return
      ).on 'ajax:success', 'form#new_movie', (event, data, status, xhr) ->
        console.log 'sucess'
        $(this).modal_success()
        return

  setUtilityConfirmation: ->
    new Utility.Confirmation()

  setElementToast: ->
    new Element.Toast()

  setUtilityModal: ->
     new Utility.Modal()
    
    

      





