class Game
  attr_accessor :deck, :player, :dealer, :show_dealer_cards

  def initialize(player_name)
    @deck = Deck.new
    @player = Player.new(player_name)
    @dealer = Dealer.new
    2.times do
      player.hit(deck)
      dealer.hit(deck)
    end
    @show_dealer_cards = false
  end

  def play
    player_move
    self.show_dealer_cards = true
    dealer_move unless player.busted? || player.blackjack?
    puts self
    puts
    puts result
  end

  def player_move
    until player.busted? || player.blackjack?
      puts self
      puts
      puts "=> Do you want to (H)it or (S)tay?"
      hit_or_stay = gets.chomp.downcase
      player.hit(deck) if hit_or_stay == "h"
      break if hit_or_stay == "s"
    end
  end

  def dealer_move
    while dealer.points < 17
      puts self
      puts
      puts "=> Dealer is getting another card ..."
      sleep 1
      dealer.hit(deck)
    end
  end

  def evaluate_state
    if player.busted?
      dealer.busted? ? "tie busted" : "player busted"
    elsif dealer.busted?
      player.busted? ? "tie busted" : "dealer busted"
    elsif player.blackjack?
      dealer.blackjack? ? "tie blackjack" : "player blackjack"
    elsif dealer.blackjack?
      player.blackjack? ? "tie blackjack" : "dealer blackjack"
    elsif player.points == dealer.points
        "tie points"
    else
      player.points > dealer.points ? "player won" : "dealer won"
    end
  end

  def result
    case evaluate_state
      when "player blackjack"
        "*** #{player.name} WON ***  You have blackjack!".green
      when "dealer blackjack"
        "*** #{player.name} LOST ***  Dealer has blackjack!".red
      when "player busted"
        "*** #{player.name} LOST ***  Busted!".red
      when "dealer busted"
        "*** #{player.name} WON ***  Dealer busted!".green
      when "player won"
        "*** #{player.name} WON ***  You have more points!".green
      when "dealer won"
        "*** #{player.name} LOST ***  Dealer has more points!".red
      when "tie blackjack"
        "*** IT'S A TIE ***  Both have blackjack!".yellow
      when "tie busted"
        "*** IT'S A TIE ***  Both busted!".yellow
      when "tie points"
        "*** IT'S A TIE ***  You have equal number of points!".yellow
      else
        ""
    end
  end

  def self.clear
    system('clear') || system('cls')
  end

  def to_s
    Game.clear
    str = "Dealer's cards:\n"
    str += show_dealer_cards ? "#{dealer}\n\n" : "#{dealer.with_cards_hidden}\n\n"
    str += "#{player.name}'s cards:\n"
    str += "#{player}\n"
  end
end