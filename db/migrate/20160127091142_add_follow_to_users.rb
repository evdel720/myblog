class AddFollowToUsers < ActiveRecord::Migration
  def change
    add_column :users, :follow, :boolean
  end
end
