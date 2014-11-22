class AddAttachmentImageToClothingItems < ActiveRecord::Migration
  def self.up
    change_table :clothing_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :clothing_items, :image
  end
end
