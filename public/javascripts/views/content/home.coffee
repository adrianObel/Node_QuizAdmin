# View of Home screen
define [
  'jquery'
  'underscore'
  'backbone'
  'text!/../templates/content.html'
], ($, _, Backbone, ContentHolder) ->

  class ContentHomeView extends Backbone.View
    el: '#content'
    content_holder: _.template ContentHolder 
    initialize: ->
      @render()

    render: ->
      $('#content_pane').remove()
        

      content_holder = _.template ContentHolder, content: "ASDASD"
      @$el.append content_holder

    goHome: (e) ->
      

