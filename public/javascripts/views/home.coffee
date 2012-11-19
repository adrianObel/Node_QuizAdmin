# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
], ($, _, Backbone) ->

  class HomeListView extends Backbone.View
    el: $('#container')
    render: ->
      alert 'works'
      test = document.createElement 'h2'
      test.text 'Hello World'
      @el.append text

    HomeListView