require './tile'

class Board
  attr_accessor :grid

  def self.from_file(filename)
    lines = File.readlines(filename).map(&:chomp)
    lines.map do |line|
      line.chars.map { |val| Tile.new(val) }
    end
  end

  def initialize(filename = 'sudoku1.txt')
    @grid = Board.from_file(filename)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col].add_value(val)
  end

  def render
    @grid.each do |line|
      line.each do |tile|
        tile.to_s
      end
      puts
    end
  end

  def solved?
    all_lines_uniq? && all_coloums_uniq? && all_squares_uniq?
  end

  def all_lines_uniq?
    @grid.each do |line|
      return false unless uniq_line?(line)
    end

    true
  end

  def all_coloums_uniq?
    0.upto(@grid.length - 1) do |idx|
      coloum = []
      @grid.each do |line|
        coloum << line[idx]
      end
      return false unless uniq_line?(coloum)
    end

    true
  end

  def all_squares_uniq?
    squares.each do |square|
      flat = square.flatten
      return false unless uniq_line?(flat)
    end

    true
  end

  def uniq_line?(line)
    values = line.map(&:value)
    values == values.uniq && !values.include?("0")
  end

  def squares
    left_top = [[0, 0], [0, 3], [0, 6], [3, 0], [3, 3], [3, 6], [6, 0], [6, 3], [6, 6]]
    left_top.map { |pos| get_square(pos) }
  end

  def get_square(pos)
    row, col = pos
    [
      [@grid[row][col], @grid[row][col + 1], @grid[row][col + 2]],
      [@grid[row + 1][col], @grid[row + 1][col + 1], @grid[row + 1][col + 2]],
      [@grid[row + 2][col], @grid[row + 2][col + 1], @grid[row + 2][col + 2]]
    ]
  end

end
