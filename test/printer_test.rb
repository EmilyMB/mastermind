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
      "The goal of Mastermind is to figure out the color sequence that the computer has generated. For each guess, you enter the sequence of colors that you think the\ncomputer has chosen such as rrbb, which would mean red red blue blue. If the\ncomputer's sequence is bryy, you will be alerted that you have 2 correct colors, 1 of which is in the correct location.\n\nFor additional information about the game, please see the Wikipedia page at\nhttp://en.wikipedia.org/wiki/Mastermind_(board_game)"

    assert_equal @printer.valid_prompt, "please enter a valid choice"


    # assert_equal @printer.time_message(solution, guess_count, minutes, seconds),
    #   "Congratulations! You guessed the sequence '#{solution.upcase}' in #{guess_count} guesses over #{minutes} minutes and #{seconds} seconds. Do you want to (p)lay again or (q)uit?"


    assert_equal @printer.guess_too_long, "Your guess is too long. Please enter 4 characters."


    assert_equal @printer.guess_too_short,  "Your guess is too short. Please enter 4 characters."


    assert_equal @printer.guess_not_valid, "Your guess is not valid."


    assert_equal @printer.first_guess, "You've taken 1 guess."

    #
    # assert_equal @printer.guess_count(guess_count),
    #   "You've taken #{guess_count} guesses"
    #
    #
    # assert_equal @printer.correct_place(guess, correct_color, correct_place),
    #   "'#{guess.upcase}' has #{correct_color} of the correct elements with #{correct_place} in the correct position"
    #

    assert_equal @printer.quit_message, "Now quitting...off to do something more productive."
  end
end
