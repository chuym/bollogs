class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,      null: false
      t.string :content,    null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end
    add_foreign_key :posts, :users, column: :author_id
  end
end
