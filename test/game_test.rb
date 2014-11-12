gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'

class GameTest < Minitest::Test

  def setup
    instream = StringIO.new("bbbb")
    outstream = StringIO.new
    printer = StringIO.new
    @game = Game.new(instream, outstream, printer)
  end

  def test_it_has_a_timer
    @game.respond_to?(:timer)
  end

#This doesn't work because it is calling another method. Need to stub?
  # def test_it_adds_to_guess_count
  #   assert_equal @game.guess_count, 1
  #   @game.add_to_guess_count
  #   assert_equal @game.guess_count, 2
  # end
end
