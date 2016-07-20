require_relative "card"

module Ranks

  def straight_flush?
    straight? && flush?
  end

  def four_kind?
    hand_vals.any? {|val| hand_vals.count(val) == 4}
  end

  def full_house?
    three_kind? && one_pair?
  end

  def flush?
    @cards.all? {|card| card.suit == @cards.first.suit }
  end

  def straight?
    sorted_hand = hand_vals.uniq.sort
    (sorted_hand.last - sorted_hand.first == 4) && (sorted_hand.length == 5)
  end

  def three_kind?
    hand_vals.any? {|val| hand_vals.count(val) == 3}
  end

  def two_pair?
    hand_vals.select {|val| hand_vals.count(val) == 2 }.uniq.size == 2
  end

  def one_pair?
    hand_vals.select {|val| hand_vals.count(val) == 2 }.uniq.size == 1
  end

  def high_card
    hand_vals.sort.last
  end

  def find_rank
    return 8 if straight_flush?
    return 7 if four_kind?
    return 6 if full_house?
    return 5 if flush?
    return 4 if straight?
    return 3 if three_kind?
    return 2 if two_pair?
    return 1 if one_pair?
    0
  end

  #HELPER METHODS
  def hand_vals
    vals = []
    @cards.each {|card| vals << card.val }
    vals
  end
end
