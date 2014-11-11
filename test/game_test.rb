gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def test_it_has_a_timer
    game = Game.new(instream, outstream, printer)
    game.respond_to?(:timer)
  end
end
