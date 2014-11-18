class CreateClothingAssignments < ActiveRecord::Migration
  def change
    create_table :clothing_assignments do |t|

      t.timestamps
    end
  end
end
