define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  class TeacherModel extends Backbone.Model 
    urlRoot : '/api/1/teacher'

    defaults:
      students: ''