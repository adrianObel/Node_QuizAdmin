define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
], ($, _, Backbone, HomeView) ->

  class AppRouter extends Backbone.Router
    routes:
      '': 'home'

      #Default route
      '*actions': 'defaultAction'

  initialize = ->
    app_router = new AppRouter

    app_router.on 'route:home', ->
      home_view = new HomeView()

    Backbone.history.start()

  {
    initialize: initialize
  }