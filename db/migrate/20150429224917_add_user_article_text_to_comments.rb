class AddUserArticleTextToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :string
    add_column :comments, :article_id, :string
    add_column :comments, :text, :text
  end
end
