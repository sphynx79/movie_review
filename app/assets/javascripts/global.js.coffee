window.App ||= {}

App.modalSuccess = ($modal_form) ->
  console.log "modal success"
  $modal_form.modal("hide")
  $('#movies').masonry(
    isFitWidth: true
    itemSelector: '.box').imagesLoaded ->
    $('#movies').masonry 'reload'
