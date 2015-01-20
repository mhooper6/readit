class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :comments

  accepts_nested_attributes_for :comments, allow_destroy: true

  validates :title, presence: true
  validates :link, presence: true 
  validates_format_of :link, with: URI::regexp(%w(http https))
end
