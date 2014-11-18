class Look < ActiveRecord::Base
  belongs_to :user
  has_many :clothes_assignments
  has_many :clothing_items, through: :clothes_assignments
end


