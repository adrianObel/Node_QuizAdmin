# View of Student content screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/adminUserAdd.html'
], ($, _, Backbone, NewUserTemplate) ->

  class NewTeacherView extends Backbone.View
    el: '#content'

    initialize: () ->
      @render() 
 
    render: ->
      that = @
      $('#content_pane').remove()

      pageData = 
        title : 'Añadir un estudiante.'
        button: 'Registrar estudiante'
        type  : 2

      # Top level underscore variable
      _.templateSettings.variable = "rc"
      content_holder = _.template NewUserTemplate, pageData

      that.$el.append content_holder

    events:
      'click button': 'addStudent'

    addStudent: (e) ->

      $form = $('#user-form')
      $form.submit (e) ->
        e.preventDefault()
        $inputs        = $form.find('input, select, button, textarea')
        $lbError       = $('#lbError')
        $lbSuccess     = $('#lbSuccess')
        serializedData = $form.serialize()
        
        $inputs.attr 'disabled', 'disabled'
        $lbError.hide()
        $lbSuccess.hide()
      
        $.ajax 
          url:'/api/1/user'
          type:'POST'
          data: serializedData
          success: (res, status, XHR) ->
            if res is "0"
              $lbError.text("Estudiante ya esta en el sistema").show()
            else if res is "1"
              $lbError.text("Error creando el estudiante").show()
            else
              $lbSuccess.text("Estudiante creado").show()
          error: (XHR, status, err) ->
            $lbError.text("Error creando el estudiante").show()
          complete: ->
            $inputs.removeAttr('disabled')
          

