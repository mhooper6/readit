class Board < ActiveRecord::Base
	has_many :moderators
	has_many :users, through: :moderators
	has_many :posts

	accepts_nested_attributes_for :moderators, :users
end
