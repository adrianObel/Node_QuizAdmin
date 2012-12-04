define [
  'jquery'
  'underscore'
  'backbone'
  'cs!views/home'
  'cs!views/content/teacher/teacher'
  'cs!views/content/student/student'
  'cs!views/content/teacher/newTeacher'
  'cs!views/content/student/newStudent'
  'cs!views/content/teacher/newQuestions'
  'cs!views/content/teacher/newExam'
  'cs!views/content/student/exams'
], ($, _, Backbone, HomeView, TeacherContentView
 , StudentContentView, NewTeacherView, NewStudentView, CreateQuestionsView
 , CreateExamView, CheckExamsView) ->

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
      'teachers/questions': 'addQuestions'
      # Route to make exams
      'teachers/exam': 'addExam'

      # Route to see exams
      'students/exam': 'checkExams'
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

    app_router.on 'route:addQuestions', ->
      create_questions_view = new CreateQuestionsView()

    app_router.on 'route:addExam', ->
      create_exam_view = new CreateExamView()

    app_router.on 'route:checkExams', ->
      check_exams_view = new CheckExamsView()

    app_router.on 'route:defaultAction', ->
      $('#content').empty() 
      home_view = new HomeView()

    Backbone.history.start()

  {
    initialize: initialize
  }