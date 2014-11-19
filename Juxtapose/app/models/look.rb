class Look < ActiveRecord::Base
  belongs_to :user
  has_many :clothing_assignments
  has_many :clothing_items, through: :clothing_assignments
  has_many :look_tag_assignments
  has_many :tags, through: :look_tag_assignments
end


