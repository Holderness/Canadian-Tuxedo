class CreateLookTagAssignments < ActiveRecord::Migration
  def change
    create_table :look_tag_assignments do |t|
      t.references :tag, index: true
      t.references :look, index: true

      t.timestamps
    end
  end
end
