class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.string :user_id
      t.string :post_id

      t.timestamps
    end
  end
end
