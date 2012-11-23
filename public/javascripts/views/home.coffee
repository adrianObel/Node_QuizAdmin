# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
  'cs!models/user'
  'text!/../templates/sideMenuAdmin.html'
], ($, _, Backbone, UserModel, adminMenu) ->

  class HomeView extends Backbone.View
    el: '#content'

    initialize: ->
      @render()

    render: ->
      that = @
      uid  = window.userId
      user_model = new UserModel id: uid

      adminTemplate = _.template adminMenu, {}
      # find user in db
      user_model.fetch 
        success: (user) ->
          that.$el.append adminTemplate

    events: 
      'click #logout': 'onLogout'

    onLogout: (e) ->
      console.log 'logoff'

    