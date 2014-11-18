class ClothingAssignment < ActiveRecord::Base
  has_many :looks
  has_many :clothing_items
end
