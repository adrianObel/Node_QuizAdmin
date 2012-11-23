# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
  'cs!models/user'
], ($, _, Backbone, UserModel) ->

  class HomeView extends Backbone.View
    el: '#container'

    initialize: ->
      @render()

    render: ->
      console.log 'rendering home'
      uid   = window.userId
      user_model = new UserModel id: uid

      # find user in db
      user_model.fetch 
        success: (user) ->
          alert JSON.stringify user_model  

    events: 
      'click #logout': 'onLogout'

    onLogout: (e) ->
      console.log 'logoff'

    