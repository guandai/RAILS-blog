class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friendA
      t.integer :friendB
      t.boolean :accepted
      t.integer :status

      t.timestamps
    end
  end
end
