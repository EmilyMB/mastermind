require './test/test_helper'
require 'printer'

class PrinterTest < Minitest::Test

  def setup
    @printer = Printer.new
  end

  def test_prints_out_welcome_message
    assert_equal @printer.welcome_message, "Welcome to \e[ 0 ;31mMASTERMIND\e[0m"
  end

  def test_prints_everything_it_should
    assert_equal @printer.input_request,
      "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"

    assert_equal @printer.game_prompt,
      "I have generated a beginner sequence with four elements made up of: \e[ 0 ;31m(r)ed\e[0m,
\e[ 0 ;32m(g)reen\e[0m, \e[ 0 ;34m(b)lue\e[0m, and \e[ 0 ;33m(y)ellow\e[0m. Use (q)uit at any time to end the game."

    assert_equal @printer.turn_prompt,
      "What's your guess? (Any combination of \e[ 0 ;31m(r)ed\e[0m, \e[ 0 ;32m(g)reen\e[0m, \e[ 0 ;34m(b)lue\e[0m, and \e[ 0 ;33m(y)ellow\e[0m)"


    assert_equal @printer.instructions,
    "The goal of Mastermind is to figure out the color sequence that the computer
has generated. For each guess, you enter the sequence of colors that you think the
computer has chosen such as rrbb, which would mean red red blue blue. If the
computer's sequence is bryy, you will be alerted that you have 2 correct colors,
1 of which is in the correct location.
\nFor additional information about the game, please see the Wikipedia page at
http://en.wikipedia.org/wiki/Mastermind_(board_game)"

    assert_equal @printer.valid_prompt, "please enter a valid choice"


    assert_equal @printer.guess_too_long, "Your guess is too long. Please enter 4 characters."


    assert_equal @printer.guess_too_short,  "Your guess is too short. Please enter 4 characters."


    assert_equal @printer.guess_not_valid, "Your guess is not valid."


    assert_equal @printer.first_guess, "You've taken 1 guess."

    assert_equal @printer.quit_message, "Now quitting...off to do something more productive."
  end

  def test_prints_the_guess_count
    guess_count = 2
    assert_equal @printer.guess_count(guess_count), "You've taken 2 guesses."
  end

  def test_prints_correct_count_and_placement
    guess = "rrrr"
    correct_color = 3
    correct_place = 2
    assert_equal @printer.correct_place(guess, correct_color, correct_place),
      "'RRRR' has 3 of the correct elements with 2 in the correct position."
  end

  def test_prints_win_message
    solution = 'rrrr'
    guess_count = 2
    minutes = 2
    seconds = 3
    assert_equal @printer.time_message(solution, guess_count, minutes, seconds),
      "Congratulations! You guessed the sequence 'RRRR' in 2 guesses over 2 minutes,\n3 seconds. Do you want to (p)lay again or (q)uit?"
  end


end
