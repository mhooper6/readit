require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without body" do
  	comment = Comment.new
  	assert_not comment.save, "Saved a comment without a body."
  end
end
