# require_relative 'board'
# require_relative 'display'
require_relative 'sliding_pieces'

class Piece
  attr_accessor :color, :position, :board, :symbol

  def initialize(color, position, symbol, board)
    @color = color
    @position = position
    @symbol = symbol
    @board = board
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    false
  end
end

class NullPiece
  def to_s
    "   "
  end

  def empty?
    true
  end

  def color
    nil
  end

end
