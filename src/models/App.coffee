# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerCurrentScore', @get('playerHand').scores()[0]
    @set 'dealerFinalScore', @get('dealerHand').scores()[0]

  startNewGame: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @trigger('newGame')

  checkIfOver: ->
    playerScore = @get('playerHand').scores()[0]
    @set 'playerCurrentScore', playerScore
    if playerScore > 21
      alert 'you lose'
      @startNewGame()

  stand: ->

    @get('dealerHand').hit() while @get('dealerHand').dealerRealScore() < 17
    @didDealerBust()

  didDealerBust: ->

    if @get('dealerHand').dealerRealScore() > 21
      alert 'you win'
      @startNewGame()






    # elif dealerScore > playerScore
      #


