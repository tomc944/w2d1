require 'byebug'

class SlidingPiece < Piece
  NON_DIAG_MOVES = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  DIAG_MOVES = [[1, 1], [-1, 1], [-1, -1], [1, -1]]
  attr_reader :possible_moves

  def initialize(color, position, symbol, board)
    super
    @possible_moves = []
  end

  def moves(type_move)
    # debugger
    type_move.each do |move|
      (1..7).each do |multiplier|
        new_move = move.map { |el| el * multiplier }
        new_move[0], new_move[1] = (new_move[0] + @position[0]), (new_move[1] + @position[1])
        if valid_piece_move?(new_move)
          if self.color == @board[new_move].color
            break
          elsif @board[new_move].color.nil?
            @possible_moves << new_move
          elsif self.color != @board[new_move].color
            @possible_moves << new_move
            break
          end
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
