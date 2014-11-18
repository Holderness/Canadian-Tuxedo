class Look < ActiveRecord::Base
  belongs_to :user
  has_many :clothing_assignments
  has_many :clothing_items, through: :clothing_assignments
end


