define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
  'cs!views/login'
], ($, _, Backbone, HomeView, LoginView) ->

  class AppRouter extends Backbone.Router
    routes:
      '': 'login'
      'home': 'home'
      #Default route
      '*actions': 'defaultAction'

  initialize = ->
    app_router = new AppRouter

    app_router.on 'route:home', ->
      home_view = new HomeView()
      alert 'lol'

    app_router.on 'route:login', ->
      login_view = new LoginView()

    Backbone.history.start()

  {
    initialize: initialize
  }