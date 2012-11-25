# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
  'cs!models/user'
  'cs!views/content/home'
  'text!/../templates/sideMenuAdmin.html'
], ($, _, Backbone, UserModel, ContentHomeView, AdminMenu) ->

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
            that.content_page  = new ContentHomeView()

    events: 
      'click #goHome'    : 'goHome'
      'click #goTeachers': 'goTeachers'
      'click #goStudents': 'goStudents'

    goHome    : (e) -> window.location.hash = '/'
    goTeachers: (e) -> window.location.hash = '/teachers'
    goStudents: (e) -> window.location.hash = '/students'

      

    