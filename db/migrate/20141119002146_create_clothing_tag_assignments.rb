class CreateClothingTagAssignments < ActiveRecord::Migration
  def change
    create_table :clothing_tag_assignments do |t|
      t.references :tag, index: true
      t.references :clothing_item, index: true

      t.timestamps
    end
  end
end
