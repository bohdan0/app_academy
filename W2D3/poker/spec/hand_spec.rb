require "hand"

describe "Hand" do
  let(:card1) {double(:suit =>:club,:rank=>:seven)}
  let(:card2) {double(:suit =>:club,:rank=>:eight)}
  let(:card3) {double(:suit =>:diamond,:rank=>:four)}
  let(:card4) {double(:suit =>:heart,:rank=>:ace)}
  let(:card5) {double(:suit =>:spade,:rank=>:king)}

  subject(:hand) { Hand.new([card1,card2,card3,card4,card5]) }

  describe "#initialize" do
    it "receives 5 cards" do
      expect(hand.amount).to eq(5)
    end
  end

  describe "#royal_flush" do
    let(:rfcard1) {double(:suit => :club,:rank=>:ace)}
    let(:rfcard2) {double(:suit => :club,:rank=>:king)}
    let(:rfcard3) {double(:suit => :club,:rank=>:queen)}
    let(:rfcard4) {double(:suit => :club,:rank=>:jack)}
    let(:rfcard5) {double(:suit => :club,:rank=>:ten)}


    it "returns true for royal flush" do
      rf_hand = Hand.new([rfcard1,rfcard2,rfcard3,rfcard4,rfcard5])
      expect(rf_hand.royal_flush).to be(true)
    end
    it "returns false if you dont have royal flush" do
      expect(hand.royal_flush).to be(false)
    end
  end

  describe "#straight_flush" do
    let(:sfcard2) {double(:suit => :club,:rank=>:king)}
    let(:sfcard3) {double(:suit => :club,:rank=>:queen)}
    let(:sfcard4) {double(:suit => :club,:rank=>:jack)}
    let(:sfcard5) {double(:suit => :club,:rank=>:ten)}
    let(:sfcard1) {double(:suit => :club,:rank=>:nine)}


    it "returns true for straight flush" do
      sf_hand = Hand.new([sfcard1,sfcard2,sfcard3,sfcard4,sfcard5])
      expect(sf_hand.straight_flush).to be(true)
    end
    it "returns false if you dont have royal flush" do
      expect(hand.straight_flush).to be(false)
    end
  end

  describe "#four" do
    let(:fcard2) {double(:suit => :club,:rank=>:king)}
    let(:fcard3) {double(:suit => :heart,:rank=>:king)}
    let(:fcard4) {double(:suit => :diamond,:rank=>:king)}
    let(:fcard5) {double(:suit => :spade,:rank=>:king)}
    let(:fcard1) {double(:suit => :club,:rank=>:nine)}


    it "returns true for four of kind" do
      f_hand = Hand.new([fcard1,fcard2,fcard3,fcard4,fcard5])
      expect(f_hand.four).to be(true)
    end
    it "returns false if you dont have four of a kind" do
      expect(hand.four).to be(false)
    end
  end

  describe "#full house" do
    let(:fullcard2) {double(:suit => :club,:rank=>:king)}
    let(:fullcard3) {double(:suit => :heart,:rank=>:king)}
    let(:fullcard4) {double(:suit => :diamond,:rank=>:king)}
    let(:fullcard5) {double(:suit => :spade,:rank=>:nine)}
    let(:fullcard1) {double(:suit => :club,:rank=>:nine)}


    it "returns true for full house" do
      full_hand = Hand.new([fullcard1,fullcard2,fullcard3,fullcard4,fullcard5])
      expect(full_hand.full_house).to be(true)
    end
    it "returns false if you dont have full house" do
      expect(hand.full_house).to be(false)
    end

  end

  describe "#flush" do
    let(:flushcard1) {double(:suit => :club,:rank=>:ace)}
    let(:flushcard2) {double(:suit => :club,:rank=>:king)}
    let(:flushcard3) {double(:suit => :club,:rank=>:queen)}
    let(:flushcard4) {double(:suit => :club,:rank=>:jack)}
    let(:flushcard5) {double(:suit => :club,:rank=>:ten)}


    it "returns true for flush " do
      flush_hand = Hand.new([flushcard1,flushcard2,flushcard3,flushcard4,flushcard5])
      expect(flush_hand.flush).to be(true)
    end
    it "returns false if you dont have flush" do
      expect(hand.flush).to be(false)
    end

  end

  describe "#straight" do
    let(:straightcard1) {double(:suit => :club,:rank=>:ace)}
    let(:straightcard2) {double(:suit => :club,:rank=>:king)}
    let(:straightcard3) {double(:suit => :spade,:rank=>:queen)}
    let(:straightcard4) {double(:suit => :club,:rank=>:jack)}
    let(:straightcard5) {double(:suit => :club,:rank=>:ten)}


    it "returns true for straight " do
      straight_hand = Hand.new([straightcard1,straightcard2,straightcard3,straightcard4,straightcard5])
      expect(straight_hand.straight).to be(true)
    end
    it "returns false if you dont have straight" do
      expect(hand.straight).to be(false)
    end

  end

  describe "#three" do
    let(:threecard1) {double(:suit => :spade,:rank=>:ace)}
    let(:threecard2) {double(:suit => :club,:rank=>:jack)}
    let(:threecard3) {double(:suit => :spade,:rank=>:queen)}
    let(:threecard4) {double(:suit => :diamond,:rank=>:jack)}
    let(:threecard5) {double(:suit => :heart,:rank=>:jack)}


    it "returns true for three of a kind" do
      three_hand = Hand.new([threecard1,threecard2,threecard3,threecard4,threecard5])
      expect(three_hand.three).to be(true)
    end
    it "returns false if you dont have three of a kind" do
      expect(hand.three).to be(false)
    end

  end

  describe "#two" do
    let(:twocard1) {double(:suit => :spade,:rank=>:ace)}
    let(:twocard2) {double(:suit => :club,:rank=>:jack)}
    let(:twocard3) {double(:suit => :spade,:rank=>:queen)}
    let(:twocard4) {double(:suit => :diamond,:rank=>:jack)}
    let(:twocard5) {double(:suit => :heart,:rank=>:ace)}


    it "returns true for two of a kind" do
      two_hand = Hand.new([twocard1,twocard2,twocard3,twocard4,twocard5])
      expect(two_hand.two).to be(true)
    end
    it "returns false if you dont have two of a kind" do
      expect(hand.two).to be(false)
    end

  end

  describe "#high_card" do
    let(:highcard1) {double(:suit => :spade,:rank=>:ace)}
    let(:highcard2) {double(:suit => :club,:rank=>:jack)}
    let(:highcard3) {double(:suit => :spade,:rank=>:queen)}
    let(:highcard4) {double(:suit => :diamond,:rank=>:jack)}
    let(:highcard5) {double(:suit => :heart,:rank=>:two)}


    it "returns true for high card" do
      high_hand = Hand.new([highcard1,highcard2,highcard3,highcard4,highcard5])
      expect(high_hand.high_card).to be(highcard1.rank)
    end
    it "returns false if you dont have high card" do
      expect(hand.high_card).to be(card4.rank)
    end

  end

end
