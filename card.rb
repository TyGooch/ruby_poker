class Card
  attr_reader :color, :suit, :val

  def initiliaze(color, suit, val)
    @color, @suit, @val = color, suit, val
  end
end
