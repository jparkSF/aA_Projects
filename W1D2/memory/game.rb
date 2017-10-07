require_relative 'card'
require_relative 'board'
require_relative 'player'
require_relative 'computer'
require 'byebug'

class Game
  attr_accessor :board, :guesses
  attr_reader :player

  def initialize(size, player)
    @board = Board.new(size)
    @player = player.new(board.length)
    @guesses = []
    @counter = 0
  end

  def play

    board.populate

    player.setup

    # if player.is_a? Computer
    #   player.setup(board.length)
    # end

    until over?
      p "counter is #{@counter}. "
      # pos1, pos2 = *player.take_turn
      take_player_turn

      unless board[guesses.first] == board[guesses.last]
        failed_guess
      end
      @guesses = []

      # player.find_matches if player.is_a? Computer
      player.find_matches
      @counter += 1
      break if @counter == 5
    end
    board.render
    player.win
  end

  def take_player_turn

    2.times do

      board.render

      pos = player.get_guess
      puts "\nguessed pos is #{pos}"
      p "+"*10
      @guesses << pos
      p @guesses

      board[pos].reveal

      # if player.is_a? Computer
      #   player.receive_revealed_card(pos, board[pos].value)
      # end

      player.receive_revealed_card(pos, board[pos].value)

    end
  end


  private

  def failed_guess
    board.render
    # sleep(3) unless player.is_a? Computer

    hide_guessed_cards
  end

  def hide_guessed_cards
    board[guesses.first].hide
    board[guesses.last].hide
  end

  def over?
    board.won?
  end

end


if __FILE__ == $PROGRAM_NAME
  a = Game.new(3, Computer)
  a.play


end
