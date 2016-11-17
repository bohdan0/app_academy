class Player
  def initialize(name = "sudoku lover")
    @name = name
  end

  def get_pos
    print 'type pos where you want store new tile: '
    gets.chomp.split(",").map(&:to_i)
  end

  def get_value
    print 'type value for that position: '
    val = gets.chomp
    puts

    val
  end
end
