require './tile'
require 'colorize'

class Board
  attr_reader :grid

  def self.create_new_grid
    Array.new(9) { Array.new(9) { Tile.new } }
  end

  def initialize
    @grid = Board.create_new_grid
    self.fill_up
    self.count_values
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def fill_up
    counter = 0
    # if you change amount of bombs, don't forget change it inside game_over?
    while counter < 5
      row = (0..8).to_a.sample
      col = (0..8).to_a.sample
      tile = @grid[row][col]
      unless tile.bomb
        @grid[row][col].bomb = true
        counter += 1
      end
    end
  end

  # def render_b
  #   print "   "
  #   (0..8).each { |idx| print (idx.to_s + "  ").colorize(:red)}
  #   puts
  #   @grid.each_with_index do |row, index|
  #     print (index.to_s + "  ").colorize(:red)
  #     row.each do |tile|
  #       print (tile.bomb ? 'X' : "O") + "  "
  #       # print tile.value.to_s + "  "
  #     end
  #     puts
  #   end
  # end

  def render_val
    print "   "
    (0..8).each { |idx| print (idx.to_s + "  ").colorize(:red)}
    puts
    @grid.each_with_index do |row, index|
      print (index.to_s + "  ").colorize(:red)
      row.each do |tile|
        # print (tile.bomb ? 'X' : "O") + "  "
        if tile.revealed
          print tile.value.to_s + "  "
        else
          print "_  "
        end
      end
      puts
    end
  end

  def count_values
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |tile, col_idx|
        pos = [row_idx, col_idx]
        if tile.bomb
          tile.value = "X"
        else
          tile.value = bombs_around(pos)
        end
      end
    end
  end

  def bombs_around(pos)
    neighbors(pos).count { |pos| self[pos].bomb }
  end

  def neighbors(pos)
    row, col = pos
    [
      [row - 1, col - 1],
      [row - 1, col],
      [row - 1, col + 1],
      [row, col - 1],
      [row, col + 1],
      [row + 1, col - 1],
      [row + 1, col],
      [row + 1, col + 1],
    ].reject { |pos| pos.any? { |x| x < 0 || x > 8 } }
  end

  def open_tiles(pos, default = 0)
    self[pos].revealed = true unless self[pos].bomb
    if default.zero? && self[pos].bomb
      puts 'Died'
      # self[pos].revealed = true
      return
    end

    return if self[pos].value > 0 || self[pos].bomb

    open_tile_helper(pos).each do |position|       # I think problem is inside of third condition below this words
      # next if self[position].revealed || self[position].bomb || neighbors(position).any? { |coord| self[coord].bomb }
      # # self[position].value > 0
      open_tiles(position, 1)
    end

    # if self[pos].bomb
    #   puts "Dead"
    # else
    #   self[pos].revealed = true
    # end
  end

  def open_tile_helper(pos)
    row, col = pos
    [
      [row - 1, col],
      [row, col + 1],
      [row + 1, col],
      [row, col - 1]
    ].reject { |pos| pos.any? { |x| x < 0 || x > 8 } }

  end

  def game_over?
    @grid.flatten.count{ |tile| tile.revealed } == 76
  end

end

# board = Board.new

# board.fill_up
# board.count_values
# board.render_b
# puts
# board.render_val
