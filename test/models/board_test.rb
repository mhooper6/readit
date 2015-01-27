require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without title" do
  	board = board.new
  	assert_not board.save, "Saved a board without a title."
  end
end
