require_relative 'tile'

class Board

  def self.from_file
    flatten_str = ""
    File.open('files/sudoku-01.txt').each do |line|
      flatten_str << line
    end
    flatten_str.gsub(/\n/,'')
  end


  def initialize(tile = Tile.new)
    @board = tile.grid
  end

  def setup_board
    list_of_nums = from_file.chars

    (0...length).each do |row|
      (0...length).each do |col|
        @board[row][col] = list_of_nums.shift
      end
    end
    render
  end

  def length
    @board.length
  end




  def render
    @board.each do |row|
      p row
    end
  end

  def update_tile(position)
  end

  def solved?
  end
end

if __FILE__ == $PROGRAM_NAME
  a = Board.new

   a.setup_board




end
