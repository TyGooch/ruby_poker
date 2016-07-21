require_relative "player"
require_relative "deck"
require_relative "hand"

class Game
  attr_reader :players

  def initialize(num_players)
    @deck = new_deck
    @players = []
    num_players.times {|player_id| @players << Player.new(player_id, Hand.new)}
  end


  def round_over?
    players_in_round = @players.inject(0){|count, player| count += 1 if player.in_round}
    players_in_round == 1
  end

  def round_winner
    # @players.select {|player| player.in_round}
  end


  def new_deck
    deck = Deck.new
    deck.cards.shuffle!
  end

  def start_round
    #deal to all players
    player.each do |player|
      @deck.deal.each {|card| player.add_card(card)}
    end

  end

  def play_turn(player)
    discarded_cards = player.cards_to_discard #should be array
    discarded_cards.each {|card| player.hand.remove_card(card)}

  end

  def switch_player(player)
    players[(player_id + 1) % players.size]
  end


  def run


    loop do

      start_round
      current_player = @players.first


      #start new_round
      until round_over?
        #iterates through turns




        #write story board for round

        play_turn(current_player)
        current_player = switch_player(current_player)

      end

      #we have to do pot logic


      #make new deck when round is over

      @deck = new_deck

    end
  end

end

if __FILE__ == $PROGRAM_NAME
  g = Game.new(2)
  g.run
end
