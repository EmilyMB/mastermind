require './test/test_helper'
require 'code'

class CodeTest < Minitest::Test
  def test_it_is_four_colors
    code = Code.new
    assert_equal 4, code.create_code.length
  end

end
