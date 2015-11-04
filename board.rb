require_relative 'pieces'
# require_relative 'sliding_pieces'
# require_relative 'cursorable'
# require_relative 'display'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    #set_board
  end

  def set_board

    row = 0
    grid[row][0] = Rook.new("Black", [row, 0], "♜", self)
    # grid[row][1] = Knight.new("Black", [row, 1], "♞", self)
    grid[row][2] = Bishop.new("Black", [row, 2], "♝", self)
    grid[row][3] = Queen.new("Black", [row, 3], "♛", self)
    # grid[row][4] = King.new("Black", [row, 4], "♚", self)
    grid[row][5] = Bishop.new("Black", [row, 5], "♝", self)
    # grid[row][6] = Knight.new("Black", [row, 6], "♞", self)
    grid[row][7] = Rook.new("Black", [row, 7], "♜", self)

    row = 1
    (0..7).each { |col| grid[row][col] = Piece.new("Black", [row, 0], "♟", self)}

    (2..5).each do |row|
      (0..7).each do |col|
        grid[row][col] = NullPiece.new
      end
    end

    row = 7
    grid[row][0] = Rook.new("White", [row, 0], "♖", self)
    # grid[row][1] = Knight.new("White", [row, 1], "♘", self)
    grid[row][2] = Bishop.new("White", [row, 2], "♗", self)
    grid[row][3] = Queen.new("White", [row, 3], "♕", self)
    # grid[row][4] = King.new("White", [row, 4], "♔", self)
    grid[row][5] = Bishop.new("White", [row, 5], "♗", self)
    # grid[row][6] = Knight.new("White", [row, 6], "♘", self)
    grid[row][7] = Rook.new("White", [row, 7], "♖", self)

    row = 6
    (0..7).each { |col| grid[row][col] = Piece.new("White", [row, 0], "♙", self)}
  end

  def move(start, end_pos)

    #Need to find which piece is at grid[start]
    #Find if @possible_moves for that piece contains end_pos
    #

    raise Empty_error if self[start].empty?

    raise Valid_error unless valid_move?(start, end_pos)

    self[end_pos] = self[start]
    self[end_pos].position = end_pos
    self[start] = NullPiece.new
    debugger


  end


  # checks whether or not we land
  # on a piece of our own color or on a nullpiece
  def valid_move?(start, end_pos)

    return false unless in_bounds?(end_pos)

    #REMEMBER TO CHECK IF START IS EMPTY
    #CHECK IF START AND END COLORS THE SAME (RETURN FALSE)
    self[start].move_dirs.include?(end_pos)
    # debugger

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
    # STILL NEEDS TO BE FILLED IN
    false
  end

end

class Empty_error < RuntimeError
end
class Valid_error < RuntimeError
end


board = Board.new
board.grid[0][0] = Bishop.new("White", [0, 0], "D", board)
board.grid.each {|x| p x}
board.grid[1][1] = Bishop.new("Black", [1, 1], "S", board)
board.move([0,0],[1,1])
