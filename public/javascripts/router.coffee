define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
], ($, _, Backbone, Session, HomeListView) ->

  class AppRouter extends Backbone.Router
    routes:
      '': 'home'
      '/': 'home'

      #Default route
      '*actions': 'defaultAction'

  initialize = ->
    app_router = new AppRouter

    app_router.on 'home', ->
      homeListView = new HomeListView()
      homeListView.render()


    app_router.on 'defaultAction', (actions) ->
      console.log "no route: #{actions}"
    
    Backbone.history.start()

  {
    initialize: initialize
  }