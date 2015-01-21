class User < ActiveRecord::Base
	acts_as_authentic

	has_many :moderators
	has_many :boards, through: :moderators

	has_many :subscribers
	has_many :boards, through: :subscribers

	has_many :posts
end
