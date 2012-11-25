define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
  'cs!views/content/teacher'
], ($, _, Backbone, HomeView, TeacherContentView) ->

  # Backbone Router for hashroutes
  class AppRouter extends Backbone.Router
    routes:
      '': 'home'
      'teachers': 'teachers'
      'teachers/new' : 'addTeacher'

      #Default action takes me to home
      '*action': 'defaultAction'

  # Called on router init
  initialize = ->
    app_router = new AppRouter

    app_router.on 'route:home', ->
      $('#content').empty() 
      home_view = new HomeView()

    app_router.on 'route:teachers', ->
      teacher_content = new TeacherContentView()

    app_router.on 'route:addTeacher', ->
      alert 'adding teacher'


    app_router.on 'route:defaultAction', ->
      $('#content').empty() 
      home_view = new HomeView()

    Backbone.history.start()

  {
    initialize: initialize
  }