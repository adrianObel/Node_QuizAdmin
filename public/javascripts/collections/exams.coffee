# Exams collection
define [
  'backbone'
  'cs!models/exam'
], (Backbone, ExamModel) ->
  class ExamCollection extends Backbone.Collection
    model: ExamModel
    url: ->  '/api/1/exam/'
    


    
      

