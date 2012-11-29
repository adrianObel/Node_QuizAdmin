define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
  'cs!views/content/teacher/teacher'
  'cs!views/content/student/student'
  'cs!views/new/teacher'
  'cs!views/new/student'
  'cs!views/content/teacher/questions'
], ($, _, Backbone, HomeView, TeacherContentView
 , StudentContentView, NewTeacherView, NewStudentView, CreateQuestionsView) ->

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
      # Route to make questions
      'teachers/questions': 'makeQuestions'

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

    app_router.on 'route:makeQuestions', ->
      create_questions_view = new CreateQuestionsView()

    app_router.on 'route:defaultAction', ->
      $('#content').empty() 
      home_view = new HomeView()

    Backbone.history.start()

  {
    initialize: initialize
  }