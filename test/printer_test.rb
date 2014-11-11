gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/printer'

class PrinterTest < Minitest::Test

  def test_prints_out_welcome_message
    printer = Printer.new
    assert_equal printer.welcome_message, "Welcome to MASTERMIND"
  end
end
