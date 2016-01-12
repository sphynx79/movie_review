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
    return


  show: =>
    console.log "show"
    return


  new: =>
    console.log "show"
    return


  edit: =>
    console.log "edit"
    return

  @test: =>
    console.log "test"
    return
