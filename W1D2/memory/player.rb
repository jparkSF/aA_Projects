class Player
  attr_reader :name

  def initialize(length)
  end

  def get_guess
    prompt
    gets.chomp.split(",").map(&:to_i)
  end


  def prompt
    print "Guess a card (ex: 0, 2): "
  end

  def win
    puts "You won! Woohoo"
  end
end



# def take_turn
#
#   [get_guess, get_guess]
# end
