require './board'
require './player'

class Game
  attr_accessor :board
  def initialize
    @board = Board.new
    @player = Player.new
  end

  def play
    puts 'this is you board: '
    @board.render

    until @board.solved?
      pos = @player.get_pos
      value = @player.get_value
      @board[pos] = value
      @board.render
    end

    puts 'You got it!!'
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
