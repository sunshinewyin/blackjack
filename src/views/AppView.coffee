class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="start-new-game-button">Start New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="result">Result</div>
  '
  events:
    'click .hit-button': ->
      @model.get('playerHand').hit()
      @model.checkIfOver()
    'click .stand-button': -> @model.stand()
    'click .start-new-game-button': -> @model.startNewGame()

  initialize: ->
    @render()
    @model.on 'newGame', => @render()
    @model.on 'showScore', => @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.result').append @model.get('result')


