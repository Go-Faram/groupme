class Group < ActiveRecord::Base

  serialize :description
  has_many :posts
  validates :title, :presence => true
end
