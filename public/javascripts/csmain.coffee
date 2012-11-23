require ['cs!app'], (App) -> App.initialize()
  
define [
  'jquery'
], ($) ->

  $logout = $('#logout')

  $logout.click (e) ->
    e.preventDefault()
    $.ajax 
      url:'/user/connect'
      type: 'DELETE'
      data: ''
      success: (res, status, XHR) ->
        window.location = '/login'
      error: (XHR, status, err) ->
        console.log "Errors: #{status}\n#{err}"
      complete: ->
        window.location = '/login'
        