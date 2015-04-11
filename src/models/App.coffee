# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerCurrentScore', @get('playerHand').scores()[0]
    @set 'dealerFinalScore', @get('dealerHand').scores()[0]
    @set 'result', ''

  startNewGame: ->
      @set 'deck', deck = new Deck()
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      @set 'playerCurrentScore', @get('playerHand').scores()[0]
      @set 'result', ''
      @trigger('newGame')

  checkIfOver: ->
    playerScore = @get('playerHand').scores()[1]
    @set 'playerCurrentScore', playerScore
    if playerScore > 21
      playerScore = @get('playerHand').scores()[0]
      @set 'playerCurrentScore', playerScore

    if playerScore > 21
      @set 'result', 'You busted with ' + playerScore
      @trigger('showScore')

  stand: ->

    @get('dealerHand').hit() while @get('dealerHand').dealerRealScore() < 17
    @didDealerBust()

  didDealerBust: ->

    if @get('dealerHand').dealerRealScore() > 21
      @set 'result', 'Dealer busted with ' + @get('dealerHand').dealerRealScore()
      @trigger('showScore')
    else
      @whoWon()

  whoWon: ->
    dealerScore = @get('dealerHand').dealerRealScore()
    playerScore = @get('playerHand').scores()[0]
    if dealerScore > playerScore
      @set 'result', 'You lost. Dealer score was: ' + dealerScore
    else if dealerScore == playerScore
      @set 'result', 'You tied.'
    else
      @set 'result', 'You win. Dealer score was: ' + dealerScore
    @trigger('showScore')






