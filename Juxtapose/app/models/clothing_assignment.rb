class ClothingAssignment < ActiveRecord::Base
  belongs_to :looks
  belongs_to :clothing_items
end
