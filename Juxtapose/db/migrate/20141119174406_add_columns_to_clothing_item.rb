class AddColumnsToClothingItem < ActiveRecord::Migration
  def change
    add_column :clothing_items, :caption, :string
  end
end
