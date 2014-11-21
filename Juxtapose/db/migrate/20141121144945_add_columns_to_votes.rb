class AddColumnsToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :look, index: true
    add_reference :votes, :user, index: true
    add_column :votes, :vote, :integer
  end
end
