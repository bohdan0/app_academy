class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    new_seq = []
    idx = 0
    puts 'Type colors: '
    until @game_over || new_seq.length == @seq.length
      color = gets.chomp
      if color == @seq[idx]
        new_seq << color
      else
        @game_over = true
      end
      idx += 1
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
    puts "You lost!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play
