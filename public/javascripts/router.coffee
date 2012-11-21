define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
  'cs!views/login'
], ($, _, Backbone, HomeView, LoginView) ->

  class AppRouter extends Backbone.Router
    routes:
      '': 'home'

      #Default route
      '*actions': 'defaultAction'

  initialize = ->
    app_router = new AppRouter

    app_router.on 'route:home', ->
     # home_view = new HomeView()
      login_view = new LoginView()

    Backbone.history.start()

  {
    initialize: initialize
  }