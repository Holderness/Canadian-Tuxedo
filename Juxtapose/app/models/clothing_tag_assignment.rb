class ClothingTagAssignment < ActiveRecord::Base
  belongs_to :tag
  belongs_to :clothing_item
end
