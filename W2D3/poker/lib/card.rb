class Card

  attr_reader :suit, :rank

  SUITS = [:diamond,:spade,:heart,:club]

  RANKS = [:two,:three,:four,:five,:six,:seven,:eight,:nine,:ten,
    :jack,:queen,:king,:ace]

  def initialize(suit,rank)

    raise ArgumentError, "not valid" unless SUITS.include?(suit)
    raise ArgumentError, "not valid" unless RANKS.include?(rank)
    
    @suit = suit
    @rank = rank

  end

end
