require_relative "display"

class Player
  def initialize(board)
    @display = Display.new(board)
  end

  def move
    result = nil
    until result
      @display.render
      result = @display.get_input
    end
    result
  end
end

# board = Board.new
# player = Player.new(board)
# player.move
