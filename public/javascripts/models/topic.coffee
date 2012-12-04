define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  class TopicModel extends Backbone.Model 
    urlRoot : '/api/1/topic'

    defaults:
      name : ''
      questions: [
        title : ''
        choice: []
        answer: 0
      ]

  
