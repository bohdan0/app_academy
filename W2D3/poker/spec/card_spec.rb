require "card"

describe "Card" do
  subject(:card) {Card.new(:club,:jack)}


  describe "#initialize" do
    it "creates two instance variables" do
      expect(card.suit).to be_instance_of(Symbol)
      expect(card.rank).to be_instance_of(Symbol)

    end

    it "validates suit" do
      expect {Card.new(:invalid,:jack)}.to raise_error("not valid")
    end

    it "validates suit" do
      expect {Card.new(:club,:jacks)}.to raise_error("not valid")
    end

  end

end
