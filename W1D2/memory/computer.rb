require 'byebug'

class Computer
  attr_reader :known_cards
  def initialize(length)
    @known_cards = {}
    @guess_cue = []
    @already_matched_vals = []
    @length = length
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
  end

  def get_guess
    # debugger

    # find_matches unless @known_cards.size < 2
    return random_guess if @guess_cue.empty?
    # puts " Guess cue: #{@guess_cue}"
    @guess_cue.pop
  end

  def setup
    all_positions
  end

  # def setup(length)
  #
  #   @length = length
  #
  #   all_positions
  #   @unguessed_pos
  #
  # end

  def random_guess
    @unguessed_pos.pop
  end

  def all_positions
    @unguessed_pos = []

    (0...@length).each do |i|
      (0...@length).each do |j|
        @unguessed_pos << [i,j]
      end
    end

    @unguessed_pos.shuffle!
    # p @unguessed_pos
  end

  def find_matches

    matching_vals = known_cards.values.select do |val|
        known_cards.values.count(val) == 2
    end

    return if matching_vals.empty?

    matching_vals.reject! do |val|
      @already_matched_vals.include?(val)
    end

    @guess_cue = known_cards.select do |pos, val|
      val == matching_vals.first
    end.keys

    @already_matched_vals << matching_vals.first
  end

  def win
    puts "Computers are superior to humans."
  end

end
