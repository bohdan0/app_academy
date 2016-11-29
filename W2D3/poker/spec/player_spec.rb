require 'player'

describe Player do
  let(:hand) { double('hand', pack: :cards,length: 5) }
  subject(:player) {Player.new(50, hand,"john")}

  describe "#initialize" do
    it "assigns money and hand to a player" do
      expect(player.hand).to eq(hand)
      expect(player.money).to eq(50)
    end
    it "checks length of the hand" do

      expect(player.hand.length).to eq(5)
      expect {player.hand.length}.to_not raise_error
    end
  end


end
