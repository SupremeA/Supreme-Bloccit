class FixVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :user_id
    remove_column :votes, :post_id
    add_column :votes, :user_id, :integer
    add_column :votes, :post_id, :integer
  end
end
