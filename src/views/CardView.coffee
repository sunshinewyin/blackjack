class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="/Users/student/Desktop/2015-03-blackjack/img/cards/<%= rankName %>-<%= suitName %>.png">'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
# img src='<% " + "-" +  " ">

# '<%= rankName %> of <%= suitName %>'
