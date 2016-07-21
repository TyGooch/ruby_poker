require 'poker'
require 'rspec'

describe Player do
  let(:player) {Player.new(0, Hand.new)}

  describe "#initialize" do
    it 'accepts two arguments' do
      expect {Player.new}.to raise_error(ArgumentError)
    end

    it 'sets bet actions' do
      expect(player.bet_actions).to_not eq([])
    end

  end

  describe '#bet' do
    it 'updates pot' do
      bet = 20
      player.bet(20)
      expect(player.pot).to eq(480)
    end
  end

end


describe Card do
  let(:ace_of_spades) {Card.new(:black, :spade, 14)}
  let(:queen_of_hearts) {Card.new(:red, :heart, 12)}

  describe "#>" do
    it 'returns true on higher value card' do
      expect(ace_of_spades>queen_of_hearts).to be true
    end

  end


end

describe Deck do
  let(:deck) {Deck.new}

  describe "#initialize" do
    it 'populates non-empty deck' do
      expect(deck.cards).to_not eq([])
    end

    it 'contains Card instances' do
      expect(deck.cards.all? do |card|
        card.is_a?(Card)
      end).to be true
    end

    it 'ensures length is 52' do
      expect(deck.cards.length).to eq(52)
    end

    it 'creates a deck with unique cards' do
      expect(deck.cards.uniq.length).to eq(52)
    end
  end
end

describe Hand do
  let(:hand) {Hand.new}
  context "Ranks" do
    describe "Ranks#straight_flush?" do
      it "detects straight flush" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:black, :spade, 13))
        hand.add_card(Card.new(:black, :spade, 12))
        hand.add_card(Card.new(:black, :spade, 11))
        hand.add_card(Card.new(:black, :spade, 10))
        expect(hand.straight_flush?).to be true
      end
    end

    describe "Ranks#four_kind?" do
      it "detects four of a kind" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:red, :diamond, 14))
        hand.add_card(Card.new(:black, :club, 14))
        hand.add_card(Card.new(:red, :heart, 14))
        hand.add_card(Card.new(:black, :club, 10))
        expect(hand.four_kind?).to be true
      end
    end

    describe "Ranks#full_house?" do
      it "detects full house" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:red, :diamond, 14))
        hand.add_card(Card.new(:black, :club, 14))
        hand.add_card(Card.new(:red, :heart, 10))
        hand.add_card(Card.new(:black, :club, 10))
        expect(hand.full_house?).to be true
      end
    end


    describe "Ranks#flush?" do
      it "detects flush" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:black, :spade, 13))
        hand.add_card(Card.new(:black, :spade, 12))
        hand.add_card(Card.new(:black, :spade, 11))
        hand.add_card(Card.new(:black, :spade, 2))
        expect(hand.flush?).to be true
      end
    end

    describe "Ranks#straight?" do
      it "detects straight" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:red, :diamond, 13))
        hand.add_card(Card.new(:black, :club, 12))
        hand.add_card(Card.new(:red, :heart, 11))
        hand.add_card(Card.new(:black, :club, 10))
        expect(hand.straight?).to be true
      end
    end



    describe "Ranks#three_kind?" do
      it "detects three of a kind" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:red, :diamond, 14))
        hand.add_card(Card.new(:black, :club, 14))
        hand.add_card(Card.new(:red, :heart, 9))
        hand.add_card(Card.new(:black, :club, 10))
        expect(hand.three_kind?).to be true
      end
    end
    describe "Ranks#two_pair?" do
      it "detects two pairs" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:red, :diamond, 14))
        hand.add_card(Card.new(:black, :club, 10))
        hand.add_card(Card.new(:red, :heart, 10))
        hand.add_card(Card.new(:black, :club, 8))
        expect(hand.two_pair?).to be true
      end
    end

    describe "Ranks#one_pair?" do
      it "detects two pairs" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:red, :diamond, 14))
        hand.add_card(Card.new(:black, :club, 2))
        hand.add_card(Card.new(:red, :heart, 6))
        hand.add_card(Card.new(:black, :club, 8))
        expect(hand.one_pair?).to be true
      end
    end

  end

  context "Hand Comparisons" do
    describe "Hand#beats_hand?" do
      let (:hand2) {Hand.new}
      it "finds winning hand" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:black, :spade, 13))
        hand.add_card(Card.new(:black, :spade, 12))
        hand.add_card(Card.new(:black, :spade, 11))
        hand.add_card(Card.new(:black, :spade, 10))
        hand2.add_card(Card.new(:black, :spade, 14))
        hand2.add_card(Card.new(:red, :diamond, 14))
        hand2.add_card(Card.new(:black, :club, 14))
        hand2.add_card(Card.new(:red, :heart, 14))
        hand2.add_card(Card.new(:black, :club, 10))

        expect(hand.beats_hand?(hand2)).to be true
      end

      it "detects highest card on rank tie" do
        hand.add_card(Card.new(:black, :spade, 14))
        hand.add_card(Card.new(:red, :diamond, 14))
        hand.add_card(Card.new(:black, :club, 2))
        hand.add_card(Card.new(:red, :heart, 6))
        hand.add_card(Card.new(:black, :club, 8))
        hand2.add_card(Card.new(:black, :spade, 3))
        hand2.add_card(Card.new(:red, :diamond, 3))
        hand2.add_card(Card.new(:black, :club, 4))
        hand2.add_card(Card.new(:red, :heart, 7))
        hand2.add_card(Card.new(:black, :club, 6))

        expect(hand.beats_hand?(hand2)).to be true
      end
    end
  end
end
