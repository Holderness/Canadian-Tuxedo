class Tag < ActiveRecord::Base
  has_many :clothing_tag_assigments
  has_many :look_tag_assignments
end
