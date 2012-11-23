# View of Login screen
define [
  'jquery'
  'underscore'
  'backbone'
  'cs!router'
  'text!/../templates/login.html'
], ($, _, Backbone, Router, LoginTemplate) ->

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
        $('.body-login').fadeOut 'slow', ->
          window.location = 'test/#/home'
          #$('.login').fadeOut()

    LoginView