# View of Teacher content screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/userListTemplate.html'
], ($, _, Backbone, TeacherTemplate) ->

  class TeacherContentView extends Backbone.View
    el: '#content'

    initialize: ->
      @render()

    render: ->
      that = @
      $('#content_pane').remove()

      # Lets search for all the teachers
      teachers = []
      $.ajax
        url:'api/1/teacher/'
        type:'GET'
        data: ''
        success: (res, status, XHR) ->
          for item in res
            delete item['_id']
            teachers.push {name: item.name.first}
        complete: ->
          pageData = 
            title    : 'Profesores'
            listUsers: teachers

          # Top level underscore variable
          _.templateSettings.variable = "rc"

          content_holder = _.template TeacherTemplate, pageData
          that.$el.append content_holder

    events:
      'click .addUserDetails': 'addTeacher'

    addTeacher: (e) ->
      $('#content_pane').remove()
      window.location.hash = '/teachers/new'

