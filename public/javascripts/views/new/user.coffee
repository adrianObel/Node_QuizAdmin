# View of Teachet content screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/adminUserAdd.html'
], ($, _, Backbone, NewUserTemplate) ->

  class NewUserView extends Backbone.View
    el: '#content'

    initialize: (@userType) ->
      @render() 
 
    render: ->
      that = @
      $('#content_pane').remove()

      pageData = {}
      # If user is a teacher
      if @userType is 1
        pageData = 
          title : 'Añadir un profesor.'
          button: 'Registrar profesor' 
      # If user is a student
      else if @userType is 2
        pageData = 
          title : 'Añadir un estudiante.'
          button: 'Registrar estudiante'

      # Top level underscore variable
      _.templateSettings.variable = "rc"

      content_holder = _.template NewUserTemplate, pageData

      that.$el.append content_holder

