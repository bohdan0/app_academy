class Board
  attr_accessor :cups

  def self.create_cups
    result = Array.new(14) {[]}
  end

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Board.create_cups
    place_stones
  end

  def place_stones
    four_stones = [:stone, :stone, :stone, :stone]
    @cups = @cups.map.with_index do |cup, idx|
      [6, 13].include?(idx) ? cup : four_stones
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(1, 14)
  end

  def make_move(start_pos, current_player_name)
    stones = get_stones(start_pos)
    last_idx = drop_stones(stones, start_pos, current_player_name)
    render
    next_turn(last_idx, current_player_name)
  end

  def get_stones(pos)
    result = @cups[pos].dup
    @cups[pos] = []

    result
  end

  def drop_stones(stones, pos, player)
    until stones.empty?
      pos += 1
      pos = pos % 14 if pos > 13
      unless (player == @player1 && pos == 13) || (player == @player2 && pos == 6)
        @cups[pos] += [stones.pop]
      end
    end

    pos
  end

  def next_turn(pos, player)
    if (pos == 6 && player == @player1) || (pos == 13 && player == @player2)
      :prompt
    elsif @cups[pos].count == 1
      :switch
    else
      pos
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when -1 then @player2
    when 1 then @player1
    else :draw
    end
  end
end
