# View of Question Making screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/exams/MakeQuestions.html'
  'text!/../templates/exams/QuestionTemplate.html'
  'cs!models/topic'
], ($, _, Backbone, QuestionHolderTemplate, QuestionTemplate, TopicModel) ->

  class CreateQuestionView extends Backbone.View
    el: '#content'
    questionNumber: 0

    initialize:  ->
      @render()

    render: ->
      $('#content_pane').remove()

      _.templateSettings.variable = "rc"  
      question_pane = _.template QuestionHolderTemplate, {}
      @$el.append question_pane

      @newQuestion()

    events:
      'click #new_question': 'newQuestion'
      'click #save_questions': 'saveQuestions'

    newQuestion: (e) ->
      if @questionNumber < 20
        @questionNumber++

        pageData = 
          questionNumber: @questionNumber

        questions_template = _.template QuestionTemplate, pageData
        $('#question_pane').append questions_template

    saveQuestions: (e) ->
      topicName  = $('#topic').val()
      questions  = []
      $lbError   = $('#lbError')
      $lbSuccess = $('#lbSuccess')

      $lbError.hide()
      $lbSuccess.hide()
      
      # Lets find all the questions and their corresponding data
      $('.questions').each (index, value) ->

        question = 
          title : $(this).find('#title').val()
          choice: []

        $(this).find('.choice').each (i, v) ->
          question.choice.push v.value

        $(@).find('.multipleChoice').each (i, v) ->
          if $(this).attr('checked')
            question.answer = i

        # Now lets add this question to the questions array
        questions.push question

        # Save question
        topic = new TopicModel name: topicName, questions: questions
       
        topic.save {},
          success: (model, res) ->
            $lbSuccess.text("Preguntas creadas").show()
          error: ->
            $lbError.text("Error creando preguntas").show()