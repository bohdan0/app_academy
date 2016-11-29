class Tile
  attr_reader :flagged
  attr_accessor :value, :bomb, :revealed

  def initialize
    @revealed = false
    @bomb = false # true or false
    @flagged = false
  end

  def toggle_revealed
    @reveal = !@reveal unless @flagged
  end

  def show_value
    if @revealed
      @value
    else
      " "
    end
  end

end
