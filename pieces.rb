# require_relative 'board'
# require_relative 'display'

class Piece
  attr_accessor :color, :position, :board, :symbol

  def initialize(color, position, symbol, board)
    @color = color
    @position = position
    #@board = Board.new
    @symbol = symbol
    @board = board
  end

  def moves

  end

  def to_s
    " #{symbol} "
  end
end

class NullPiece
  def to_s
    "   "
  end

end
