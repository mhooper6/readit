require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Should not save without title and link" do
  	post = Post.new
  	assert_not post.save, "Saved post without a title."
  end
end
