# View of Question Making screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/teacherCreateQuestions.html'
], ($, _, Backbone, QuestionTemplate) ->

  class CreateQuestionView extends Backbone.View
    el: '#content'

    initialize: ->
      @render()

    render: ->
      $('#content_pane').remove()

      question_template = _.template QuestionTemplate, {}
      @$el.append question_template
