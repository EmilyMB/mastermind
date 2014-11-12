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



# require 'game'
# require 'messages'
#
# class CLI
#   attr_reader :command, :messages, :instream, :outstream
#
#   def initialize(instream, outstream)
#     @command   = ""
#     @messages  = Messages.new
#     @instream  = instream
#     @outstream = outstream
#   end
#
#   def call
#     outstream.puts messages.intro
#     until finished?
#       outstream.puts messages.command_request
#       @command = instream.gets.strip
#       process_initial_commands
#     end
#     outstream.puts messages.ending
#   end
#
#   private
#
#   def process_initial_commands
#     case
#     when play?
#       game = Game.new(instream, outstream, messages)
#       game.play
#     when instructions?
#       outstream.puts messages.game_instructions
#     when finished?
#       outstream.puts messages.game_quit
#     else
#       outstream.puts messages.not_a_valid_command
#     end
#   end
#
#   def play?
#     command == "p"
#   end
#
#   def instructions?
#     command == "i"
#   end
#
#   def finished?
#     command == "q" || command == "quit"
#   end
# end
#
