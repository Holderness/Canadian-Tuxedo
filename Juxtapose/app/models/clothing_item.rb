class ClothingItem < ActiveRecord::Base
  belongs_to :user
  has_many :clothing_assignments
  has_many :looks, through: :clothing_assignments
end
