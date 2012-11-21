# View of Login screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/login.html'
], ($, _, Backbone, LoginTemplate) ->

  class LoginView extends Backbone.View
    el: '.inner-login'

    initialize: ->
      @render()

    render: ->
      data     = {}
      template = _.template LoginTemplate, data
      
      @$el.append template

    events: 
      'click #login': 'onLogin'

    onLogin: (e) ->
      that   = @
      button = e.target

      $('#' + button.id).click ->
        that.$el.fadeOut 'slow', ->
          $('.login').fadeOut()
    LoginView