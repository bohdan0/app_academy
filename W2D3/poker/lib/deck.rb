require_relative "card"

class Deck

  attr_reader :pack

  def self.create_pack
    result = []
    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        result << Card.new(suit,rank)
      end
    end
    result.shuffle
  end

  def initialize
    @pack = Deck.create_pack
  end

  def draw(amount = 1 )
    raise "not enough cards" if @pack.length < amount

    result = []
    amount.times {result << @pack.pop}
    result
  end


end
