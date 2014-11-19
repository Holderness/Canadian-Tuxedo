class AddAttachmentClothingItemToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :clothing_item
    end
  end

  def self.down
    remove_attachment :users, :clothing_item
  end
end
