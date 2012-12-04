# View for Exam Creation 
define [
  'jquery'
  'jquery-ui'
  'underscore'
  'backbone'
  'cs!models/exam'
  'cs!collections/topics'
  'text!/../templates/exams/MakeExam.html'
  'text!/../templates/exams/ExamBankTemplate.html'
], ($, ui, _, Backbone, ExamModel, TopicCollection, ExamPaneTemplate, ExamBank) ->

  class CreateExamView extends Backbone.View
    el: '#content'

    initialize:  ->
        @render()

      render: ->
        $('#content_pane').remove()
        exam_pane = _.template ExamPaneTemplate, {}

        @$el.append exam_pane

        @txtTopic     = $('#questions_topic')
        @questionBank = $('.question_bank')
        @collection   = new TopicCollection()
        _.templateSettings.variable = "rc"

      events:
        'keyup #questions_topic': 'searchTopic'
        'click #save_exam': 'saveExam'

      saveExam: (e) ->
        questions = []

        $('#exam_questions').find('li').each (index, item) ->
          questions.push title: item.innerHTML
        newExam = new ExamModel()
        newExam.set 'name': $('#exam_name').val()
        newExam.set 'questions': questions
        
        newExam.save {},
          success: (model, res) ->
            console.log res
        
      searchTopic: (e) ->
        that = @
        @collection.name = @txtTopic.val()
        @collection.fetch 
          success: (model, res) ->
            if res.length > 0
              pageData = 
                listExams: res
              that.questionBank.empty()
              exam_template = _.template ExamBank, pageData
              that.questionBank.append exam_template

              # Make elements draggable
              that.initDraggable()
      
      initDraggable: ->
        $('.question_bank li').draggable 
          appendTo: 'body'
          helper  : 'clone'

        $('#exam_questions ol').droppable(
          activeClass: 'ui-state-default'
          hoverClass : 'ui-state-hover'
          accept     : ':not(.ui-sortable-helper)'
          drop:(event, ui) ->
            $(this).find('.placeholder').remove()
            $( "<li></li>" ).text(ui.draggable.text()).appendTo this
          ).sortable
              items: "li:not(.placeholder)"
              sort: -> 
                $( this ).removeClass("ui-state-default")
            



