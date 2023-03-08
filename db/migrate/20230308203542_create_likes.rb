class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :author_id
      t.bigint :post_id
      t.references :author_id, null: false, foreign_key: true
      t.references :post-id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
