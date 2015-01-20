class User < ActiveRecord::Base
	acts_as_authentic

	has_many :moderators # a user can moderate many boards
	has_many :boards, through: :moderators
	has_many :posts
	has_many :comments

	accepts_nested_attributes_for :moderators, allow_destroy: true
	accepts_nested_attributes_for :boards, allow_destroy: true
end
