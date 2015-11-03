class SlidingPiece < Piece
  NON_DIAG_MOVES = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  DIAG_MOVES = [[1, 1], [-1, 1], [-1, -1], [1, -1]]
  attr_reader :possible_moves

  def initialize
    @possible_moves = []
  end

  def moves(type_move)
    type_move.each do |move|
      (0..7).each do |multiplier|
        move = move.map { |el| el * multiplier }
        new_pos = move + @position
        if @board.in_bounds?(new_pos) && @board.valid_move?(@position, new_pos)
          @possible_moves << move
        else
          break
        end
      end
    end
    @possible_moves
  end


end

class Bishop < SlidingPiece

  def move_dirs
    moves(DIAG_MOVES)
  end

end

class Queen < SlidingPiece

  def move_dirs
    moves(DIAG_MOVES + NON_DIAG_MOVES)
  end

end

class Rook < SlidingPiece

  def move_dirs
    moves(NON_DIAG_MOVES)
  end

end
