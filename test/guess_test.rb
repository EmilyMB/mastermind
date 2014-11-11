gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'

class GuessTest < Minitest::Test
  # def test_lookup_by_last_name
  #   repository = Minitest::Mock.new
  #   phone_book = PhoneBook.new(repository)
  #   repository.expect(:find_by_last_name, [], ["Smith"])
  #   phone_book.lookup('Smith')
  #   repository.verify
  # end
  #
  def test_it_is_four_colors
    user_guess = Minitest::Mock.new
    guess = Guess.new(user_guess)
    user_guess.expect(:valid?, [], ['b', 'q', 'd', 'f'])
    refute, user_guess.valid?
  end
end
