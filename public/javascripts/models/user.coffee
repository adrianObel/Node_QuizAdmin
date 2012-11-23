define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  class UserModel extends Backbone.Model 
    urlRoot : '/api/1/user'

    defaults:
      name : ''
      last : ''
      email: ''
      type : ''
