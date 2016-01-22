window.App ||= {}

$(document).on 'ready page:load', ->
  $(document).on 'click', '#test', (e) ->
    debugger
    user =
      name: 'Jaco'
      surname: 'Pretorius'
    result  = JST['templates/hello'](user)
    $('body').html result
    e.preventDefault()

