class Board < ActiveRecord::Base
	validates :title, presence: true

	has_many :moderators
	has_many :users, through: :moderators

	has_many :subscribers
	has_many :users, through: :subscribers

	has_many :posts
end
