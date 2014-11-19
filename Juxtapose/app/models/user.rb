class User < ActiveRecord::Base

  has_attached_file :clothing_item, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :clothing_item, :content_type => /\Aimage\/.*\Z/

  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :clothing_items
  has_many :looks
  has_many :comments
  has_many :votes

end
