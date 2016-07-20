class Card
  attr_reader :color, :suit, :val

  def initialize(color, suit, val)
    @color, @suit, @val = color, suit, val
  end

  def >(card)
    #compared vals of 2 cards
  end

  def to_s

  end
end
