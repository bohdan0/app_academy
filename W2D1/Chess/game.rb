require_relative 'board'
require_relative 'display'
require_relative 'player'
# require_relative 'piece'

class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player1 = Player.new(:white, @display)
    @player2 = Player.new(:black, @display)
    @curr_player = @player1
  end

  def play
    until @board.checkmate?(@curr_player.color)
      @curr_player.make_move
      # if @display.cursor.selected
      #   cursor_pos = @display.render
      #
      # end
    end
  end

  def toggle_players
    @curr_player = @curr_player == @player1 ? @player2 : @player1
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
