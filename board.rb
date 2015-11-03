require_relative 'pieces.rb'
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
          grid[row][col] = Piece.new("white", [row,col], :D)
        elsif 5 < row && row < 8
          grid[row][col] = Piece.new("black", [row, col], :D)
        else
          grid[row][col] = nil
        end
      end
      row += 1
    end
  end

  def display
    grid.each do |row|
      row.each do |square|
        if square.nil?
          print "-"
        else
          print square.symbol
        end
      end
      puts "\n"
    end
  end

  def move(start, end_pos)
    # if neither errors are raised
      #starting poisiton becomes nil
    # ending position becomes Piece

    debugger
    x_start, y_start = start
    x_end, y_end = end_pos
    begin
      raise Empty_error if grid[x_start][y_start].nil?

      raise Valid_error unless valid_move?(start, end_pos)

      rescue Empty_error
        puts "New Starting Position:"
        start = correct_format

      rescue Valid_error
        puts "New End Postion"
        end_pos = correct_format

      retry
    end

    grid[x_end][y_end] = grid[x_start][y_start]
    grid[x_start][y_start] = nil


  end

  def correct_format
    gets.strip.split(",").map { |el| el.to_i }
  end

  def valid_move?(start, end_pos)
    x_start, y_start = start
    x_end, y_end = end_pos

    return false unless x_end.between?(0, 7) && y_end.between?(0, 7)

    if grid[x_end][y_end].nil?
      return true
    elsif grid[x_start][y_start].color == grid[x_end][y_end].color
      return false
    end

    true
  end

  def []=(position, value)
    x, y = position
    grid[x][y] = value
  end

  def [](position)
    x, y = position
    grid[x][y]
  end
end

class Empty_error < RuntimeError
end
class Valid_error < RuntimeError
end

board = Board.new
board.move([0,0], [2,2])
board.display
