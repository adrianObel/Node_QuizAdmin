define [
  'underscore'
  'backbone'
], (_, backbone) ->
  class HomeModel extends Backbone.Model 
    defaults:
      name: 'Nyan Cat'

    HomeModel