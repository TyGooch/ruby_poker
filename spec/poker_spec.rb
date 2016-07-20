require 'poker'
require 'rspec'

describe Card do
  let()
end

describe Deck do
  let(:deck) {Deck.new}

  describe "#initialize" do
    it 'populates non-empty deck' do
      expect(deck.cards).to_not eq([])
    end

    # it 'contains Card instances' do
    #   expect(deck.cards.all? do |card|
    #     card.is_a?(Card)
    #   end).to be true
    # end

    it 'ensures length is 52' do
      expect(deck.cards.length).to eq(52)
    end

    it 'creates a deck with unique cards' do
      expect(deck.cards.uniq.length).to eq(52)
    end
  end
end
