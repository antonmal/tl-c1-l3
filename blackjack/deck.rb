class Deck
  attr_accessor :cards
  DECKS = 6

  def initialize
    @cards = []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards.push(Card.new(rank, suit))
      end
    end
    @cards *= DECKS
    @cards.shuffle!
  end

  def deal
    cards.pop
  end
end