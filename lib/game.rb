require_relative 'code'
require_relative 'guess'


class Game

attr_reader :solution, :timer, :elapsed_min, :elapsed_sec, :printer, :instream, :outstream, :guess_count

  def initialize(instream, outstream, printer)
    code = Code.new
    @solution = code.create_code
    @guess_count = 1
    @start_time = Time.now
    @printer = printer
    @outstream = outstream
    @instream = instream
  end

  def timer
    end_time = Time.now
    elapsed_time = (end_time - @start_time).round
    @elapsed_min, @elapsed_sec  = elapsed_time.divmod(60)
  end

  def add_to_guess_count
    if @guess_count == 1
      outstream.puts printer.first_guess
    else
      outstream.puts printer.guess_count(@guess_count)
    end
    @guess_count += 1
  end

  def play
    loop do

      outstream.puts printer.turn_prompt
      answer = instream.gets.chomp.downcase
      # puts "the solution is #{solution}"

      if answer == 'q'
        outstream.puts printer.quit_message
        abort

      elsif answer == solution
        self.timer
        outstream.puts printer.time_message(@solution, @guess_count, @elapsed_min, @elapsed_sec)
        break

      elsif answer.length < 4
      outstream.puts printer.guess_too_short

      elsif answer.length > 4
        outstream.puts printer.guess_too_long

      else
        answer2 = Guess.new(answer, solution)
        if answer2.valid?
          answer2.correct_colors
          answer2.correct_placement
          outstream.puts printer.correct_place(answer, answer2.correct_color_count, answer2.correct_color_placement)
          self.add_to_guess_count

        else
        outstream.puts printer.guess_not_valid
        end
      end
    end
  end
end
