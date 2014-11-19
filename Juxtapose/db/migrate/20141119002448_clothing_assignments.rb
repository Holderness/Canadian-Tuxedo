class ClothingAssignments < ActiveRecord::Migration
  def change
    add_column :clothing_assignments, :clothing_item_id, :integer
    add_column :clothing_assignments, :look_id, :integer
  end
end
