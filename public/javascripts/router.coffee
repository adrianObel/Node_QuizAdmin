define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
  'cs!views/content/teacher'
  'cs!views/content/student'
  'cs!views/new/teacher'
  'cs!views/new/student'
], ($, _, Backbone, HomeView, TeacherContentView
 , StudentContentView, NewTeacherView, NewStudentView) ->

  # Backbone Router for hashroutes
  class AppRouter extends Backbone.Router
    routes:
      '': 'home'
      'teachers': 'getTeachers'
      'students': 'getStudents'

      # Route to add new teacher
      'teachers/new': 'addTeacher'
      # Route to add new student
      'students/new': 'addStudent'

      #Default action takes me to home
      '*action': 'defaultAction'

  # Called on router init
  initialize = ->
    app_router = new AppRouter

    app_router.on 'route:home', ->
      $('#content').empty() 
      home_view = new HomeView()

    app_router.on 'route:getTeachers', ->
      teacher_content = new TeacherContentView()

    app_router.on 'route:getStudents', ->
      student_content = new StudentContentView()

    app_router.on 'route:addTeacher', ->
      new_teacher_content = new NewTeacherView()

    app_router.on 'route:addStudent', ->
      new_teacher_content = new NewStudentView()

    app_router.on 'route:defaultAction', ->
      $('#content').empty() 
      home_view = new HomeView()

    Backbone.history.start()

  {
    initialize: initialize
  }