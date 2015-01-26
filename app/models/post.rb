class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :link, presence: true
	
  belongs_to :user
  belongs_to :board
  has_many :comments
end
