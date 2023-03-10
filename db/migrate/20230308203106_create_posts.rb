class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.bigint :author_id
      t.string :title
      t.string :text
      t.bigint :comments_counter
      t.bigint :likes_counter

      t.timestamps
    end
  end
end
