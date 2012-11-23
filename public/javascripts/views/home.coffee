# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
  'cs!models/user'
  'text!/../templates/content'
  'text!/../templates/sideMenuAdmin.html'
], ($, _, Backbone, UserModel, ContentHolder, AdminMenu) ->

  class HomeView extends Backbone.View
    el: '#content'

    initialize: ->
      @render()

    render: ->
      that = @
      uid  = window.userId
      user_model = new UserModel id: uid

      adminTemplate  = _.template AdminMenu, {}
      content_holder = _.template ContentHolder 
      # find user in db
      user_model.fetch 
        success: (user) ->
          userType = user_model.get 'type'
          # if user is an admin
          if userType is 0
            that.$el.append adminTemplate
    events: 
      'click #logout': 'onLogout'

    onLogout: (e) ->
      console.log 'logoff'

    