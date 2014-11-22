class CreateClothingItems < ActiveRecord::Migration
  def change
    create_table :clothing_items do |t|

      t.timestamps
    end
  end
end
