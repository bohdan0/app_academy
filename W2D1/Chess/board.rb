require_relative 'piece'

class Board
  attr_accessor :grid
  def set_up_board(grid)
    grid.map.with_index do |line, line_idx|
      case line_idx
      when 0, 7
        create_first_line(line_idx)
      when 1, 6
        create_pawns_line(line_idx)
      else
        create_null_line
      end
    end
  end

  def initialize
    grid = Array.new(8) { Array.new(8) }
    @grid = set_up_board(grid)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise ArgumentError.new('Start position empty')
    end
    unless in_bounds?(end_pos)
      raise ArgumentError.new('You\'re out of bounds')
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  # private

  def create_null_line
    result = []
    8.times { result << NullPiece.instance }

    result
  end

  def create_pawns_line(line)
    color = line == 1 ? :black : :white
    result = []
    8.times { |i| result << Pawn.new([line, i], self, color) }

    result
  end

  def create_first_line(line)
    color = line == 0 ? :black : :white
    result = []
    result << Rook.new([line, 0], self, color)
    result << Knight.new([line, 1], self, color)
    result << Bishop.new([line, 2], self, color)
    if line.zero?
      result << King.new([line, 3], self, color)
      result << Queen.new([line, 4], self, color)
    else
      result << Queen.new([line, 3], self, color)
      result << King.new([line, 4], self, color)
    end
    result << Bishop.new([line, 5], self, color)
    result << Knight.new([line, 6], self, color)
    result << Rook.new([line, 7], self, color)

    result
  end

  def iteration(color, &prc)
    (0...8).each do |row|
      (0...8).each do |col|
        el = self[[row, col]]
        next if el.is_a?(NullPiece)
        return true if prc.call(el)
      end
    end

    false
  end

  def in_check?(color)
    king_pos = find_king(color)
    iteration(color) { |el| el.moves.include?(king_pos)}
  end

  def find_king(color)
    (0...8).each do |row|
      (0...8).each do |col|
        el = self[[row, col]]
        next if el.is_a?(NullPiece)
        return [row, col] if el.is_a?(King) && el.color == color
      end
    end
  end

  def checkmate?(color)
    if in_check?(color)
      iteration(color) { |el| valid_moves }
    end
  end

end
