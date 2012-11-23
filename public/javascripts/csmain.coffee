require ['cs!app'], (App) -> App.initialize()
  
define [
  'jquery'
], ($) ->

  $logout = $('#logout')
  $logout.click (e) ->
    $logout.preventDefault
    $.ajax 
      url:'/session'
      type: 'delete'
      data: ''
      success: (res, status, XHR) ->
        console.log 'success'
      error: (XHR, status, err) ->
        console.log "Errors: #{status}\n#{err}"
      complete: ->
        window.location = '/login'
        