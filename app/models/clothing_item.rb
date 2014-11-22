class ClothingItem < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :clothing_assignments
  has_many :looks, through: :clothing_assignments
  has_many :clothing_tag_assignments
  has_many :tags, through: :clothing_tag_assignments

  def clothing_image_url

    image.url(:thumb)

  end

end
