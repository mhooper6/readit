class Board < ActiveRecord::Base
	has_many :moderators
	has_many :users, through: :moderators

	has_many :subscribers
	has_many :users, through: :subscribers
end
