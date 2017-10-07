class Board
  attr_accessor :grid

  def setup_grid(size)
    Array.new(size) { Array.new(size) }
  end

  def initialize(size = 4)
    @grid = setup_grid(size)
  end

  def populate
    shuffled_numbers = random_pairs

    each_pos do |pos|
      value = shuffled_numbers.pop
      self[pos] = Card.new(value)
    end
  end

  def render
    # system 'clear'
    grid.each do |row|
      arr = row.map do |card|
        card.status ? card.value : :x
      end
      puts "_" * 14
      puts arr.join(' | ')

    end
  end

  def won?
    each_card.all? {|card| card.status }
  end

  def reveal(guessed_pos)
    p "in board.reveal"
    p guessed_pos
    guessed_card = self[guessed_pos]

    return if guessed_card.status
    guessed_card.reveal
    guessed_card.value
  end

  def []=(pos,value)
    row,col = pos
    grid[row][col] = value
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def length
    @grid.length
  end

  private

  def random_pairs
    num = []
    2.times do
      (1..length).each { |n| num << n  }
    end
    num.shuffle
  end

  def each_card(&blk)
    return grid.flatten unless block_given?
    length.times do |i|
      length.times do |j|
        pos = [i, j]
        blk.call(self[pos])
      end
    end
  end


  def each_pos(&blk)
    length.times do |i|
      length.times do |j|
        pos = [i, j]
        blk.call(pos)
      end
    end
  end
end
