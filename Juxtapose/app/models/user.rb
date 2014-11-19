class User < ActiveRecord::Base
  has_many :clothing_items
  has_many :looks
  has_many :comments
  has_many :votes
end
