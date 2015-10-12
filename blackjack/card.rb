class Card
  attr_accessor :rank, :suit

  SUITS = %w(♥ ♦ ♠ ♣)
  RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  ICONS = {
    "A♥" => "🂡", "A♦" => "🂱", "A♠" => "🃁", "A♣" => "🃑",
    "2♥" => "🂢", "2♦" => "🂲", "2♠" => "🃂", "2♣" => "🃒",
    "3♥" => "🂣", "3♦" => "🂳", "3♠" => "🃃", "3♣" => "🃓",
    "4♥" => "🂤", "4♦" => "🂴", "4♠" => "🃄", "4♣" => "🃔",
    "5♥" => "🂥", "5♦" => "🂵", "5♠" => "🃅", "5♣" => "🃕",
    "6♥" => "🂦", "6♦" => "🂶", "6♠" => "🃆", "6♣" => "🃖",
    "7♥" => "🂧", "7♦" => "🂷", "7♠" => "🃇", "7♣" => "🃗",
    "8♥" => "🂨", "8♦" => "🂸", "8♠" => "🃈", "8♣" => "🃘",
    "9♥" => "🂩", "9♦" => "🂹", "9♠" => "🃉", "9♣" => "🃙",
    "10♥"=> "🂪", "10♦"=> "🂺", "10♠"=> "🃊", "10♣"=> "🃚",
    "J♥" => "🂫", "J♦" => "🂻", "J♠" => "🃋", "J♣" => "🃛",
    "Q♥" => "🂬", "Q♦" => "🂼", "Q♠" => "🃌", "Q♣" => "🃜",
    "K♥" => "🂭", "K♦" => "🂽", "K♠" => "🃍", "K♣" => "🃝",
    "X"  => "🂠"
  }

  def initialize(rank, suit)
    RANKS.include?(rank) ? @rank = rank : exit
    SUITS.include?(suit) ? @suit = suit : exit
  end

  def to_s
    %w(♥ ♦).include?(suit) ? color_suit = suit.red : color_suit = suit.blue
    rank == '10' ? "#{rank}#{color_suit}" : "#{rank}#{color_suit} "
  end

  def rank_value
    case rank
    when '1'..'10'
      rank.to_i
    when 'J', 'Q', 'K'
      10
    when 'A'
      11
    end
  end

  def icon
    ICONS["#{rank}#{suit}"]
  end
end