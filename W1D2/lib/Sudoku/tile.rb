require 'colorize'

class Tile
  attr_reader :given
  attr_accessor :value

  def initialize(value)
    @value = value
    @given = value != "0" ? true : false
  end

  def add_value(value)
    if @given
      reassigning_error
    else
      @value = value
      # .colorize(:blue)
    end
  end

  def reassigning_error
    puts 'can\'t change given tile!'
  end

  def to_s
    print @given ? @value.colorize(:red) : @value
  end
end
