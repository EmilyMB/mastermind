require_relative '../lib/printer'
require_relative '../lib/game'

class CLI
  attr_reader :answer, :printer, :instream, :outstream

  def initialize(instream, outstream)
    @answer   = ""
    @printer  = Printer.new
    @instream  = instream
    @outstream = outstream
  end

  def call
    outstream.puts printer.welcome_message
    outstream.print printer.input_request

    loop do

      answer = gets.chomp.downcase

      case answer
      when 'p'
        outstream.puts printer.game_prompt
        game = Game.new(instream, outstream, printer)
        game.play

      when 'i'
       outstream.puts printer.instructions
       outstream.print printer.input_request

      when 'q'
       outstream.puts printer.quit_message
        break

      else
       outstream.puts printer.valid_prompt
       outstream.puts printer.input_request
      end
    end
  end
end
