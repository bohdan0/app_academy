class Player
  attr_reader :color, :display

  def initialize(color, display)
    @color = color
    @display = display
  end

  # should take board as a parameter
  def make_move
    from, to = nil, nil
    until from && to
      if from
        to = display.cursor.get_input
      else
        from = display.cursor.get_input
      end
    end

    [form, to]
  end

end
