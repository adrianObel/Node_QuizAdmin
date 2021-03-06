# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
  'cs!models/user'
  'cs!views/content/home'
  'text!/../templates/sideMenuAdmin.html'
  'text!/../templates/sideMenuTeacher.html'
  'text!/../templates/sideMenuStudent.html'
], ($, _, Backbone, UserModel, ContentHomeView, AdminMenu, TeacherMenu, StudentMenu) ->

  class HomeView extends Backbone.View
    el: '#content'

    initialize: ->
      @render()

    render: ->
      that = @
      uid  = window.userId
      # Initiate backbone model
      user_model = new UserModel id: uid

      $('side-menu').remove()
      
      # find user in db
      user_model.fetch 
        success: (user) ->
          userType = user_model.get 'type'
          # if user is an admin
          if userType is 0
            admin_template = _.template AdminMenu, {}
            that.$el.append admin_template
            that.content_page = new ContentHomeView()
          else if userType is 1 
            teacher_template = _.template TeacherMenu, {}
            that.$el.append teacher_template
            that.content_page = new ContentHomeView()
          else if userType is 2
            student_template = _.template StudentMenu, {}
            that.$el.append student_template
            that.content_page = new ContentHomeView()
    events: 
      'click #goHome'         : 'goHome'
      'click #goTeachers'     : 'goTeachers'
      'click #goStudents'     : 'goStudents'
      'click #createQuestions': 'goCreateQuestions'
      'click #createExam'     : 'goCreateExam'
      'click #checkExams'     : 'goLookExam'

    goHome           : (e) -> window.location.hash = '/'
    goTeachers       : (e) -> window.location.hash = '/teachers'
    goStudents       : (e) -> window.location.hash = '/students'
    goCreateQuestions: (e) -> window.location.hash = '/teachers/questions'
    goCreateExam     : (e) -> window.location.hash = '/teachers/exam'
    goLookExam       : (e) -> window.location.hash = '/students/exam'
      

    