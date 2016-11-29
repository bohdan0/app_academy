require "game"

describe "Game" do
  let(:player1) {double("player1", :name => "val")}
  let(:player2) {double("player2",:name => "val2")}
  subject(:game) {Game.new(player1,player2)}

  describe "#initialize" do

    it "creates two players" do
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end

    # it "creates a new deck" do
    #   expect(game.deck).to be_instance_of(Deck)
    #   expect(game.deck.length).to eq(52)
    # end

  end
end
