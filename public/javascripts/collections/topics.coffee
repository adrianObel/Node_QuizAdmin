# Teacher collection
define [
  'backbone'
  'cs!models/topic'
], (Backbone, TopicModel) ->
  class TopicsCollection extends Backbone.Collection
    model: TopicModel
    url: ->  "/api/1/topic/#{@name}"

    initialize: (@name) ->


    
      

