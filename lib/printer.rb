class Printer

  def welcome_message
    "Welcome to #{red("MASTERMIND")}"
  end

  def input_request
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  end

  def game_prompt
    "I have generated a beginner sequence with four elements made up of: #{red("(r)ed")},
#{green("(g)reen")}, #{blue("(b)lue")}, and #{yellow("(y)ellow")}. Use (q)uit at any time to end the game."
  end

  def turn_prompt
    "What's your guess? (Any combination of #{red("(r)ed")}, #{green("(g)reen")}, #{blue("(b)lue")}, and #{yellow("(y)ellow")})"
  end

  def instructions
    "The goal of Mastermind is to figure out the color sequence that the computer
has generated. For each guess, you enter the sequence of colors that you think the
computer has chosen such as rrbb, which would mean red red blue blue. If the
computer's sequence is bryy, you will be alerted that you have 2 correct colors,
1 of which is in the correct location.
\nFor additional information about the game, please see the Wikipedia page at
http://en.wikipedia.org/wiki/Mastermind_(board_game)"
  end

  def valid_prompt
    "please enter a valid choice"
  end

  def time_message(solution, guess_count, minutes, seconds)
    "Congratulations! You guessed the sequence '#{solution.upcase}' in #{guess_count} guesses over #{minutes} minutes,
#{seconds} seconds. Do you want to (p)lay again or (q)uit?"
  end

  def guess_too_long
    "Your guess is too long. Please enter 4 characters."
  end

  def guess_too_short
    "Your guess is too short. Please enter 4 characters."
  end

  def guess_not_valid
    "Your guess is not valid."
  end

  def first_guess
    "You've taken 1 guess."
  end

  def guess_count(guess_count)
    "You've taken #{guess_count} guesses."
  end

  def correct_place(guess, correct_color, correct_place)
    "'#{guess.upcase}' has #{correct_color} of the correct elements with #{correct_place} in the correct position."
  end

  def quit_message
    "Now quitting...off to do something more productive."
  end

  def red(text)
    "\033[ 0 ;#{31}m" + "#{text}" + "\033[0m"
  end

  def blue(text)
    "\033[ 0 ;#{34}m" + "#{text}" + "\033[0m"
  end

  def yellow(text)
    "\033[ 0 ;#{33}m" + "#{text}" + "\033[0m"
  end

  def green(text)
    "\033[ 0 ;#{32}m" + "#{text}" + "\033[0m"
  end
end
