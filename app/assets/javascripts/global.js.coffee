window.App ||= {}

App.modalSuccess = ($modal_form) ->
  console.log "modal success"
  $modal_form.modal("hide")
  $('#movies').masonry(
    isFitWidth: true
    itemSelector: '.box').imagesLoaded ->
    $('#movies').masonry 'reload'


(($) ->
  $.fn.modal_success = ->
    # close modal
    @modal 'hide'
    # clear form input elements
    # todo/note: handle textarea, select, etc
    @find('form input[type="text"]').val ''
    # clear error state
    @clear_previous_errors()
    return

  $.fn.render_form_errors = (errors) ->
    $form = this
    @clear_previous_errors()
    model = @data('model')
    # show error messages in input form-group help-block
    $.each errors, (field, messages) ->
      $input = $('[name="' + model + '[' + field + ']"]')
      $help_block = $input.closest('.form-group').addClass('has-error').find('.help-block').html(messages.join(' & '))
      return
    return

  $.fn.clear_previous_errors = ->
    $('.form-group.has-error', this).each ->
      $('.help-block', $(this)).html ''
      $(this).removeClass 'has-error'
      return
    return

  return
) jQuery
