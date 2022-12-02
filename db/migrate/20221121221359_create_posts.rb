class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :Text
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
