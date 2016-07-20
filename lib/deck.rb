class Deck
  attr_reader :cards

  COLORS = [:red, :black]
  SUITS = [:spade, :club, :diamond, :heart]

  def initialize
    @cards = populate_deck
  end

  def populate_deck
    deck_arr = []
    COLORS.each do |color|
      color_suits = ((color == :black) ? SUITS[0..1] : SUITS[2..-1])
      color_suits.each do |suit|
        deck_arr.concat(create_cards(color, suit))
      end
    end
    deck_arr
  end

  def create_cards(color, suit)
    card_arr = []
    (2..14).each do |val|
      card_arr << Card.new(color, suit, val)
    end
    card_arr
  end
end
