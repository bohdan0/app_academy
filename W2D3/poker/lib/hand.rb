class Hand

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def amount
    @cards.length
  end

  def check
    return :royal_flush if royal_flush
    return :straight_flush if straight_flush
    return :four if four
    return :full_house if full_house
    return :flush if flush
    return :straight if straight
    return :three if three
    return :two if two
    higher_card
  end

  def royal_flush
    value = nil
    rank = [:ace,:king,:queen,:jack,:ten]

    @cards.each_with_index do |card,index|
      # p card
      if index == 0
        value = card.suit
      else
        return false unless value == card.suit && rank.include?(card.rank)
      end
    end

    true
  end

  def straight_flush
    value = nil
    hash_rank = {:two => 0,:three => 1,:four =>2,:five =>3 ,:six =>4 ,
      :seven =>5,:eight=>6,:nine=>7,:ten=>8, :jack=>9,:queen=>10,
      :king=> 11,:ace=> 12}

    rank_array = []
    @cards.each_with_index do |card,index|
      rank_array << hash_rank[card.rank]
      if index == 0
        value = card.suit
      else
        return false unless value == card.suit
      end
    end
    return false unless rank_array.min + 4 == rank_array.max
    true

  end

  def four
    hash_rank = Hash.new(0)
    @cards.each do |card|
      hash_rank[card.rank] += 1
    end
    hash_rank.values.any?{|el| el == 4}
  end

  def full_house
    hash_rank = Hash.new(0)
    @cards.each do |card|
      hash_rank[card.rank] += 1
    end
    hash_rank.values.any?{|el| el == 3} && hash_rank.values.any?{|el| el ==2}
  end

  def flush
    hash_suit = Hash.new(0)
    @cards.each do |card|
      hash_suit[card.suit] += 1
    end
    hash_suit.values.first == 5
  end

  def straight
    hash_rank = {:two => 0,:three => 1,:four =>2,:five =>3 ,:six =>4 ,
      :seven =>5,:eight=>6,:nine=>7,:ten=>8, :jack=>9,:queen=>10,
      :king=> 11,:ace=> 12}

    rank_array = []
    @cards.each do |card|
      rank_array << hash_rank[card.rank]
    end
    return false unless rank_array.min + 4 == rank_array.max
    true
  end

  def three
    hash_rank = Hash.new(0)
    @cards.each do |card|
      hash_rank[card.rank] += 1
    end
    hash_rank.values.any?{|el| el == 3}
  end

  def two
    hash_rank = Hash.new(0)
    @cards.each do |card|
      hash_rank[card.rank] += 1
    end
    hash_rank.values.select {|el| el == 2 }.count == 2
  end

  def high_card
    hash_rank = {:two => 0,:three => 1,:four =>2,:five =>3 ,:six =>4 ,
      :seven =>5,:eight=>6,:nine=>7,:ten=>8, :jack=>9,:queen=>10,
      :king=> 11,:ace=> 12}
      hash_map = Hash.new(0)
      @cards.each do |card|
        hash_map[card] = hash_rank[card.rank]
      end

      hash_map.key(hash_map.values.max).rank

  end

end
