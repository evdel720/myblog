class AddCommentorToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentor, :user
  end
end
