require_relative "deck"
require_relative 'ranks'

class Hand
  include Ranks


  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def remove_card(card)
    @cards.delete(card)
  end

  def beats_hand?(other_hand)
    current_hard_rank = find_rank
    other_hand_rank = other_hand.find_rank
    if (current_hard_rank == other_hand_rank)
      return high_card > other_hand.high_card
    else
      return current_hard_rank > other_hand_rank
    end
  end

end
