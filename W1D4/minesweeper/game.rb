require './board'

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    until board.game_over?
      board.render_val
      pos = get_position
      board.open_tiles(pos)
    end
    puts "You win!!"
  end

  def get_position
    puts "Enter a position. Ex: 3,4"
    gets.chomp.split(',').map!(&:to_i)
  end


end
game = Game.new
game.play
