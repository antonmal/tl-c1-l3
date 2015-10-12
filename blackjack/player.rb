class Player
  attr_accessor :hand, :name, :color

  def initialize(name)
    @hand = []
    @name = name.capitalize
    @color = :cyan
  end

  def hit(deck)
    self.hand << deck.deal
  end

  def to_s
    str =  ("+---+ " * hand.size + "\n").colorize(color)
    str +=  "|".colorize(color) + hand.join('| |'.colorize(color)) + "|".colorize(color)
    str +=  " = #{points}\n".colorize(color)
    str += ("+---+ " * hand.size).colorize(color)
  end

  def points
    pts = hand.map { |card| card.rank_value }.inject(:+)

    # If the sum is greater than 21 (busted), re-calculate one or more aces as 1s
    if pts > 21
      aces = hand.count { |card| card.rank == "A" }
      aces.times do
        pts -= 10
        break if pts <= 21
      end
    end
    pts
  end

  def busted?
    points > 21
  end

  def blackjack?
    points == 21
  end
end

class Dealer < Player
  def initialize
    @hand = []
    @name = "Dealer"
    @color = :yellow
  end

  def with_cards_hidden
    str =  ("+---+ " * hand.size + "\n").colorize(color)
    hand.each_with_index do |card, index|
      if index == 0
        str += "|".colorize(color) + card.to_s + "| ".colorize(color)
      else
        str += "|".colorize(color) + "XXX".light_black + "| ".colorize(color)
      end
    end
    str += "\n"
    str += ("+---+ " * hand.size).colorize(color)
  end
end