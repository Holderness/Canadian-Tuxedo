class ClothingAssignment < ActiveRecord::Base
  belongs_to :look
  belongs_to :clothing_item
end
