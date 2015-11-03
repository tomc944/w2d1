require_relative 'pieces'
# require_relative 'cursorable'
require_relative 'display'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    set_board
  end

  def set_board
    col = (0..7).to_a
    row = 0
    while row < 8
      col.each do |col|
        if row < 2
          grid[row][col] = Piece.new("white", [row, col], :W, self)
        elsif 5 < row && row < 8
          grid[row][col] = Piece.new("black", [row, col], :B, self)
        else
          grid[row][col] = NullPiece.new
        end
      end
      row += 1
    end
  end

  def move(start, end_pos)

    x_start, y_start = start
    x_end, y_end = end_pos

    raise Empty_error if grid[x_start][y_start].class == NullPiece

    raise Valid_error unless valid_move?(start, end_pos)

    grid[x_end][y_end] = grid[x_start][y_start]
    grid[x_start][y_start] = NullPiece.new


  end

  def valid_move?(start, end_pos)
    x_start, y_start = start
    x_end, y_end = end_pos

    return false unless x_end.between?(0, 7) && y_end.between?(0, 7)

    # debugger

    if grid[x_end][y_end].class == NullPiece
      return true
    elsif grid[x_start][y_start].color == grid[x_end][y_end].color
      return false
    end

    true
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def []=(position, value)
    x, y = position
    grid[x][y] = value
  end

  def [](position)
    x, y = position
    grid[x][y]
  end

  def rows
    @grid
  end

  def won?
    #STILL NEEDS TO BE FILLED IN
    false
  end

end

class Empty_error < RuntimeError
end
class Valid_error < RuntimeError
end

# board = Board.new
# board.move([0,0], [1,1])
# board.display
