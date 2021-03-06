class Printer

  def welcome_message
    "Welcome to MASTERMIND"
  end

  def input_request
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def game_prompt
    "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def turn_prompt
    "What's your guess? (Any combination of (r)ed, (g)reen, (b)lue, and (y)ellow)"
  end

  def instructions
    "The goal of Mastermind is to figure out the color sequence that the computer has generated. For each guess, you enter the sequence of colors that you think the\ncomputer has chosen such as rrbb, which would mean red red blue blue. If the\ncomputer's sequence is bryy, you will be alerted that you have 2 correct colors, 1 of which is in the correct location.\n\nFor additional information about the game, please see the Wikipedia page at\nhttp://en.wikipedia.org/wiki/Mastermind_(board_game)"
  end

  def valid_prompt
    "please enter a valid choice"
  end

  def time_message(solution, guess_count, minutes, seconds)
    "Congratulations! You guessed the sequence '#{solution.upcase}' in #{guess_count} guesses over #{minutes} minutes and #{seconds} seconds. Do you want to (p)lay again or (q)uit?"
  end

  def guess_too_long
    "guess is too long"
  end

  def guess_too_short
    "guess is too short"
  end

  def guess_not_valid
    "your guess is not valid"
  end

  def first_guess
    "You've taken 1 guess"
  end

  def guess_count(guess_count)
    "You've taken #{guess_count} guesses"
  end

  def correct_place(guess, correct_color, correct_place)
    "'#{guess.upcase}' has #{correct_color} of the correct elements with #{correct_place} in the correct position"
  end

  def quit_message
    "Now quitting...off to do something more productive."
  end
end
