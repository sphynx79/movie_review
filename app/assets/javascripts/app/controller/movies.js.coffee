window.App ||= {}
class App.Movies extends App.Base

  beforeAction: (action) =>
    console.log "before #{action} action"
    return


  afterAction: (action) =>
    console.log "after #{action} action"
    return


  index: =>
    console.log "index"
    new Utility.Masonry($('.box'), $('#movies'))
    return


  show: =>
    console.log "show"
    new Element.Confirmation()
    new Element.Toolbar($('#editmenu'),'#user-options')
    return


  new: =>
    console.log "show"
    $('#modal-window').html @resp.responseText
    $('#modal-window').modal 'show'
    return


  edit: =>
    console.log "edit"
    return

  setResponse: (resp) =>
     @resp = resp
     return

  test: () =>
    $('#modal-window').html @resp.responseText
    $('#modal-window').modal 'show'
    return
