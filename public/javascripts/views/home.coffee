# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
], ($, _, Backbone) ->

  class HomeView extends Backbone.View
    el: $('#container')

    initialize: ->
      @render()

    render: ->
      console.log 'rendering home'

    events: 
      'click #logout': 'onLogout'

    onLogout: (e) ->
      console.log 'logoff'

    HomeView