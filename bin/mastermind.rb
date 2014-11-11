require_relative '../lib/guess'
require_relative '../lib/printer'
require_relative '../lib/code'
require_relative '../lib/game'

printer = Printer.new
printer.welcome_message
printer.input_request

loop do

  answer = gets.chomp.downcase

  case answer
  when 'p'
    game = Game.new
    game.play

  when 'i'
    printer.instructions
    printer.input_request

  when 'q'
    break

  else
    printer.valid_prompt
    printer.input_request

  end
end
