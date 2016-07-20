require 'colorize'

class Card
  attr_reader :color, :suit, :val

  SUIT_HASH ={
    :spade => "♠︎",
    :club => "♣︎",
    :diamond => "◆",
    :heart => "♥︎"
  }
  VALUE_HASH = {
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => '10',
    11 => 'J',
    12 => 'Q',
    13 => 'K',
    14 => 'A',
  }

  def initialize(color=:red, suit=:heart, val=14)
    @color, @suit, @val = color, suit, val
  end

  def >(card)
    val > card.val
  end

  def ==(card)
    val == card.val
  end

  def to_s
    "#{VALUE_HASH[val]} #{SUIT_HASH[suit]}".colorize(color)
  end
end
