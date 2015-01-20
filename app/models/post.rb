class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :comments

  accepts_nested_attributes_for :comments, allow_destroy: true
end
