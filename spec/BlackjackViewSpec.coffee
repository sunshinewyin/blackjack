assert = chai.assert

describe 'hands', ->
  deck = null
  playerHand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  describe 'starting hand', ->
    it 'should have two cards to start the game', ->
      assert.strictEqual playerHand.length, 2
      assert.strictEqual dealerHand.length, 2


describe 'start of new game', ->
  app = new App()

  beforeEach ->
    app.startNewGame()

  describe 'starting score', ->
    it 'should start at " "', ->
      assert.strictEqual app.get('result'), ''
