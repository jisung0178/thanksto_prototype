class Post < ActiveRecord::Base
  has_many :photos
  has_many :comments

end
