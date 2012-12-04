define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  class ExamModel extends Backbone.Model 
    urlRoot : '/api/1/exam'

    defaults:
      name : ''
      questions: [
        title : ''
        choice: []
        answer: 0
      ]
