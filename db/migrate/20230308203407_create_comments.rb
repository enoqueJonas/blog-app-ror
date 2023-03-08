class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :author_id
      t.bigint :post_id
      t.string :text
      t.references :author_id, null: false, foreign_key: true
      t.references :post_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
