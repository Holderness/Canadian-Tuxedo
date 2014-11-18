class CreateLooks < ActiveRecord::Migration
  def change
    create_table :looks do |t|

      t.timestamps
    end
  end
end
