class User < ActiveRecord::Base
	acts_as_authentic

	has_many :moderators # a user can moderate many boards
	has_many :boards, through: :moderators
	has_many :posts

	accepts_nested_attributes_for :moderators, :boards
end
