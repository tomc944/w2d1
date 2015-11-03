require_relative "board"
require_relative "player"

require 'byebug'

class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
  end

  def run
    puts "Mark all the spaces on the board!"
    puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    while true # fill in later


      begin
        start_pos = @player.move
        end_pos = @player.move
        @board.move(start_pos, end_pos)

      rescue Empty_error
        system("clear")
        puts "Enter new starting position: x, y"
        retry

      rescue Valid_error
        system("clear")
        puts "Enter new end postion: x, y"
        retry
      end
      
    end
    puts "Hooray, the board is filled!"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
