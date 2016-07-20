require "card"

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
    hand.cards.all? {|card| card.suit == hand.cards.first.suit }
  end

  def straight?
    sorted_hand = hand_vals.uniq.sort
    (sorted_hand.last - sorted_hand.first == 4) && (sorted_hand.length == 5)
  end

  def three_kind?
    hand_vals.any? {|val| hand_vals.count(val) == 3}
  end

  def two_pair?
    hand_vals.select {|val| hand_vals.count(val) == 2 }.size == 2
  end

  def one_pair?
    hand_vals.select {|val| hand_vals.count(val) == 2 }.size == 1
  end

  #HELPER METHODS
  def hand_vals
    vals = []
    hand.cards.each {|card| vals << card.val }
    vals
  end
end
