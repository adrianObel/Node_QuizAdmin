# View of Student content screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/userListTemplate.html'
], ($, _, Backbone, StudentTemplate) ->

  class StudentContentView extends Backbone.View
    el: '#content'

    initialize: ->
      @render()

    render: ->
      that = @
      $('#content_pane').remove()

      # Lets search for all the students
      students = []
      $.ajax
        url:'api/1/student/'
        type:'GET'
        data: ''
        success: (res, status, XHR) ->
          for item in res
            delete item['_id']
            students.push {name: item.name.first}
        complete: ->
          pageData = 
            title    : 'Estudiantes'
            listUsers: students

          # Top level underscore variable
          _.templateSettings.variable = "rc"

          content_holder = _.template StudentTemplate, pageData
          that.$el.append content_holder

    events:
      'click .addUserDetails': 'addStudent'

    addStudent: (e) ->
      $('#content_pane').remove()
      window.location.hash = '/students/new'

