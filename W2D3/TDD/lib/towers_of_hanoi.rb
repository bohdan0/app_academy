class Game
  attr_accessor :tower1, :tower2, :tower3

  def initialize
    @tower1 = []
    @tower2 = []
    @tower3 = []
  end

  def set_up
    @tower1 = [3,2,1]
  end

  def prompt

  end

  def move(from, to)
    towers_hash = {
      1 => @tower1,
      2 => @tower2,
      3 => @tower3
    }

    tower_from = towers_hash[from]
    tower_to = towers_hash[to]

    if valid_move?(tower_from, tower_to)
      tower_to << tower_from.pop
    end
  end

  def valid_move?(tower_from, tower_to)
    if tower_from.empty? || (!tower_to.empty? && tower_to.last < tower_from.last)
      raise 'no valid move'
    end
    true
  end

  def won?
    @tower1.empty? && (@tower2.empty? || @tower3.empty?)
  end
end
