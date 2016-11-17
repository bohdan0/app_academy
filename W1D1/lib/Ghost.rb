class Game
  def initialize(players)
    @current_player, @previous_player = players
    @dictionary = File.readlines("dictionary.txt").map { |el| el.chomp }
    @fragment = ""
  end

  def switch_players
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn
    guess = @current_player.guess
    if valid_play?(guess)
      @fragment += guess
      switch_players
    else
      @current_player.alert_invalid_guess
      take_turn
    end
  end

  def play
    take_turn until game_over?
    puts "#{@previous_player.name} lost"
  end

  def game_over?
    @dictionary.include?(@fragment)
  end

  def remaining_words
    @dictionary = @dictionary.select do |word|
      word[0...@fragment.length] == @fragment
    end
  end

  def valid_play?(string)
    next_fragment = @fragment + string
    @dictionary.any? { |word| word[0...next_fragment.length] == next_fragment }
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{@name} tell me your letter!"
    gets.chomp
  end

  def alert_invalid_guess
    puts "#{@name} that is an invalid guess you loser, guess again"
  end
end

# if __FILE__ == $PROGRAM_NAME
  Game.new([Player.new("1"), Player.new("2")]).play

# end
