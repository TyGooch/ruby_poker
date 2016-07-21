class Player
  attr_accessor :in_round
  attr_reader :bet_actions, :name, :pot

  def initialize(player_id, hand)
    @name = "Player #{player_id}"
    @hand = hand
    @pot = 500
    @bet_actions = %w(fold, see, raise)
    @in_round = true
  end

  def cards_to_discard
    puts "Which cards would you like to discard? (Please enter in form : 1,3)"
    puts "Please only choose up to three. Enter to select nothing"

    discards = gets.chomp.split(",")
    raise 'too many cards chosen' if discards.size > 3
    raise 'invalid input' unless discards.all?{|card| card.is_a?(Fixnum)}

    #convert discards indices to cards
    discards
  end

  def get_action
    puts "Would you like to fold, see, or raise?"

    action = gets.chomp
    raise 'invalid action' unless bet_actions.include?(action)
    action
  end

  def bet(bet_amount)
    @pot -= bet_amount
  end

end
