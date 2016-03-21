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
    new Utility.Masonry('.box', '#movies')
    return


  show: =>
    console.log "show"
    new Element.Toolbar('#editmenu','#user-options')
    return

  
  search: =>
    console.log "search"
    new Utility.Masonry('.box', '#movies')
    return


  new: =>
    console.log "new"
    return


  edit: =>
    console.log "edit"
    return

  setResponse: (resp) =>
     @resp = resp
     return

  test: () =>
    return
