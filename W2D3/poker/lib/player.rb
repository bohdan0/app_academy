class Player

  attr_reader :money, :hand, :name

  def initialize(money, hand,name)
    raise "not enough cards" unless hand.length == 5
    @money = money
    @hand = hand
    @name = name

  end



end
