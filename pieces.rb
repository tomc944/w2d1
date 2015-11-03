# require_relative 'board'
# require_relative 'display'


class Piece
  attr_accessor :color, :position, :board, :symbol

  def initialize(color, position, symbol)
    @color = color
    @position = position
    #@board = Board.new
    @symbol = symbol
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
