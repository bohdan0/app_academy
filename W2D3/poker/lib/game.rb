require_relative "deck"
require_relative "hand"
require_relative "player"

class Game

attr_reader :player1, :player2

  def initialize(player1,player2)
    @player1,@player2 = player1,player2
  end
end
