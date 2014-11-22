class Tag < ActiveRecord::Base
  has_many :clothing_tag_assignments
  has_many :clothing_items, through: :clothing_tag_assignments
  has_many :look_tag_assignments
  has_many :looks, through: :look_tag_assignments
end
