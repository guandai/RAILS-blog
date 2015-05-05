class AddUserReferToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer
    add_foreign_key :articles, :user_id
    add_index :articles, :user_id
  end
end
