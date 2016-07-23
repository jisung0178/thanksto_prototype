class Post < ActiveRecord::Base
  has_many :photos
  has_many :comments
  
  acts_as_votable
end
