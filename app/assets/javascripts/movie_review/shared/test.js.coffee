MovieReview.Test =
  init: ->
    $(document).on 'click', '#test', (e) ->
      e.preventDefault()
      alert prova
