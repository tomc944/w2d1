class Piece
  attr_accessor :color, :position, :board, :symbol

  def initialize(color, position, symbol)
    @color = color
    @position = position
    #@board = Board.new
    @symbol = symbol
  end
end
