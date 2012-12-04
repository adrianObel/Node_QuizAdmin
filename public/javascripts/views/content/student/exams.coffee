# View of Student content screen
define [
  'jquery'
  'underscore'
  'backbone'
  'cs!collections/exams'
  'text!/../templates/exams/ExamListTemplate.html'
], ($, _, Backbone, ExamCollection, CheckExamsTemplate) ->

  class CheckExamsView extends Backbone.View
    el: '#content'

    initialize: ->
      @render()

    render: ->
      that = @
      $('#content_pane').remove()

      # Lets search for all the exams
      exams_collection = new  ExamCollection()
      exams_collection.fetch  
        success: (model, res) ->
          console.log res
          pageData = 
            title    : 'Examenes'
            listExams: res

          # Top level underscore variable
          _.templateSettings.variable = "rc"

          content_holder = _.template CheckExamsTemplate, pageData
          that.$el.append content_holder

    events:
      'click .addUserDetails': 'addStudent'

    addStudent: (e) ->
      $('#content_pane').remove()
      window.location.hash = '/students/new'

