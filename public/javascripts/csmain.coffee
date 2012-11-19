require ['cs!app'], (App) -> App.initialize()
  
define [
  'jquery'
], ($) ->

  $('#login').submit (e) ->

    $form = $(@)
    $inputs = $form.find 'input, select, button, textarea'

    serializedData = $form.serialize()
    $inputs.attr 'disabled', 'disabled'

    $.ajax 
      url:'/session'
      type: 'post'
      data: serializedData
      success: (res, status, XHR) ->
        console.log 'worked?'
      error: (XHR, status, err) ->
        console.log "Errors: #{status}\#{err}"
      complete: ->
        $inputs.removeAttr 'disabled'


