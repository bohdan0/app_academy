require "deck"

describe "Deck" do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "creates an array with 52 cards" do
      expect(deck.pack).to be_instance_of(Array)
      expect(deck.pack.length).to eq(52)
    end

    it "each element of deck is card object" do
      deck.pack.each do |card|
        expect(card).to be_instance_of(Card)
      end
    end
  end

  describe "#draw" do
    it "draws one card by default" do
      deck.draw
      expect(deck.pack.length).to eq(51)
    end

    it "draws given number of cards" do
      deck.draw(3)
      expect(deck.pack.length).to eq(49)
    end

    it "raise error if not enough cards" do
      expect {deck.draw(60)}.to raise_error("not enough cards")
    end
  end
end
