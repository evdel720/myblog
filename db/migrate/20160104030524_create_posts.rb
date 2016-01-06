class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :category
      t.references :comment

      t.timestamps 
    end
  end
end
