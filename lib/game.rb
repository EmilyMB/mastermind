require_relative 'printer'
require_relative 'code'
require_relative 'guess'


class Game

attr_reader :solution, :timer, :elapsed_min, :elapsed_sec

  def initialize
    code = Code.new
    @solution = code.create_code
    @guess_count = 1
    @start_time = Time.now
    @printer = Printer.new
  end

  def timer
    end_time = Time.now
    elapsed_time = (end_time - @start_time).round
    @elapsed_min, @elapsed_sec  = elapsed_time.divmod(60)
  end

  def add_to_guess_count
    if @guess_count == 1
      @printer.first_guess
    else
      @printer.guess_count(@guess_count)
    end
    @guess_count += 1
  end

  def play
    printer = Printer.new
    loop do
      printer.game_prompt

      answer = gets.chomp.downcase
      puts "the solution is #{solution}"

      if answer == 'q'
        break

      elsif answer == solution
        self.timer
        printer.time_message(@solution, @guess_count, @elapsed_min, @elapsed_sec)
        break

      elsif answer.length < 4
        printer.guess_too_short

      elsif answer.length > 4
        printer.guess_too_long

      else
        answer2 = Guess.new(answer, solution)
        if answer2.valid?
          answer2.correct_colors
          answer2.correct_placement
          self.add_to_guess_count

        else
          printer.guess_not_valid
        end
      end
    end
  end
end
