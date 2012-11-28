# View of Teacher content screen
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
        title : 'Añadir un profesor.'
        button: 'Registrar profesor' 
        type  : 1

      # Top level underscore variable
      _.templateSettings.variable = "rc"
      content_holder = _.template NewUserTemplate, pageData

      that.$el.append content_holder

    events:
      'click button': 'addTeacher'

    addTeacher: (e) ->
      
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
              $lbError.text("Profesor ya esta en el sistema").show()
            else if res is "1"
              $lbError.text("Error creando el profesor").show()
            else
              $lbSuccess.text("Profesor creado").show()
          error: (XHR, status, err) ->
            $lbError.text("Error creando el profesor").show()
          complete: ->
            $inputs.removeAttr('disabled')
          
        

