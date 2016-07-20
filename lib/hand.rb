require_relative "deck"

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def remove_card(card)
    @cards.delete(card)
  end
end
