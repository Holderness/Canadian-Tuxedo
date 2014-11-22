class AddColumnsToClothingItem < ActiveRecord::Migration
  def change
    add_column :clothing_items, :caption, :string
    add_column :clothing_items, :user_id, :integer
  end
end
