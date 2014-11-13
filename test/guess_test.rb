require './test/test_helper'
require 'guess'

class GuessTest < Minitest::Test

  def test_it_initializes_counts_at_zero
    solution = "bbbb"
    user_guess = "bqbq"
    guess = Guess.new(user_guess, solution)
    assert_equal guess.correct_color_count, 0
    assert_equal guess.correct_color_placement, 0
  end


  def test_it_rejects_invalid_letters
    solution = "bbbb"
    user_guess = "bqbq"
    guess = Guess.new(user_guess, solution)
    refute guess.valid?
  end

  def test_it_counts_correct_colors
    solution = "bbbb"
    user_guess = "bqbq"
    guess = Guess.new(user_guess, solution)
    guess.correct_colors
    assert guess.correct_color_count, 2
  end

  def test_it_counts_correct_placement
    solution = "bbrb"
    user_guess = "bqbq"
    guess = Guess.new(user_guess, solution)
    guess.correct_placement
    assert_equal guess.correct_color_placement, 1
  end


end
