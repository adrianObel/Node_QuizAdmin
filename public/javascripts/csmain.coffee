require ['cs!app'], (App) -> App.initialize()
  
define [
  'jquery'
  'bootstrap'
], ($, BT) ->
  # When click on logout
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
  
  $modify = $('#modify')
  $modify.click (e) ->
    window.location='/modifyAccount'
